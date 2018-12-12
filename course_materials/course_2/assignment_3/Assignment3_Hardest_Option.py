import pandas as pd
import numpy as np
import scipy.stats as st
import matplotlib as mpl
import matplotlib.pyplot as plt
from matplotlib import cm
import matplotlib.gridspec as gridspec


"""http://hamelg.blogspot.com/2015/11/python-for-data-analysis-part-22.html
"""


class PointPicker(object):
    def __init__(self, ax, mean, confint, std, values, clicklim=0.05):
        self.fig = ax.figure
        self.diff = []
        self.values = values
        self.ax = ax
        self.mean = mean
        self.confint = confint
        self.std = std
        self.ycoords = []
        self.xcoords = []
        self.clicklim = clicklim
        self.horizontal_line1 = ax.axhline(y=0.4, color='black', alpha=0.5)
        self.horizontal_line2 = ax.axhline(y=0.7, color='black', alpha=0.5)
        self.hspan = ax.axhspan(
            2, 4, facecolor='gray', alpha=0.3)

        self.text1 = ax.text(0, 0.4, "")
        self.text2 = ax.text(0, 0.7, "")

        self.ax.bar(self.values, self.mean, yerr=self.confint,
                    edgecolor='black', color=cm.Reds(tuple(self.confint/10000)))
        self.fig.canvas.mpl_connect('button_press_event', self.onclick)

    def onclick(self, event):
        if event.inaxes == self.ax:
            self.xcoords.append(event.xdata)
            self.ycoords.append(event.ydata)
            xlim0, xlim1 = self.ax.get_xlim()

            if len(self.ycoords) == 2:
                # set values for horizontal lines
                self.horizontal_line1.set_ydata(self.ycoords[0])
                self.horizontal_line2.set_ydata(self.ycoords[1])

                # set text values with y values
                self.text1.set_text("{0:.2f}".format(self.ycoords[0]))
                self.text1.set_position((xlim0, self.ycoords[0]))
                self.text2.set_text("{0:.2f}".format(self.ycoords[1]))
                self.text2.set_position((xlim0, self.ycoords[1]))

                # fill between with axhspan
                self.hspan.set_xy([[0, self.ycoords[0]], [
                                  0, self.ycoords[1]], [1, self.ycoords[1]], [
                    1, self.ycoords[0]]])

                for i in range(len(self.mean)):
                    prob_over_max_value = 1 - \
                        st.norm.cdf(max(self.ycoords),
                                    self.mean[i], self.confint[i])
                    prob_under_min_value = st.norm.cdf(
                        min(self.ycoords), self.mean[i], self.confint[i])
                    between_prob = 1 - \
                        (prob_over_max_value + prob_under_min_value)
                    if np.abs(between_prob < 0.1):
                        between_prob = 0
                    if np.abs(prob_over_max_value < 0.001):
                        prob_over_max_value = 0
                    if np.abs(prob_under_min_value < 0.001):
                        prob_under_min_value = 0
                    # print('[{}] PUMaxV: {} POMinV: {} Between probabilities: {}'.format(
                        # i, prob_over_max_value, prob_under_min_value, between_prob))

                    self.diff.append(round(between_prob, 3))

                self.ax.bar(self.values, self.mean, yerr=[self.confint, self.confint],
                            edgecolor='black', color=cm.Reds(tuple(self.diff)))
                self.fig.canvas.draw()

                # print(self.diff)

                # reset coordinates
                self.xcoords = []
                self.ycoords = []
                self.diff = []


"""Class for doing statistical calculations
"""


class Calculators(object):
    def __init__(self):
        self.mean = 0
        self.std = 0
        self.confint = []

    def calculate_mean(self, df, years):
        # calculate mean for each column
        self.mean = np.array(df[years].mean())

    def calculate_std(self, df, years):
        # calculate std of population for each column
        self.std = np.array(df[years].std())

    def calculate_confint2(self, df):
        # calculate 95% confidence interval
        # not required, SEM is more desirable
        self.confint = st.t.interval(0.95, len(
            df)-1, loc=np.mean(df), scale=st.sem(df))

    def calculate_confint(self, df):
        # calculate confidence interval
        self.confint = 1.96 * st.sem(df)


if __name__ == '__main__':
    np.random.seed(12345)

    df = pd.DataFrame([np.random.normal(32000, 200000, 3650),
                       np.random.normal(43000, 100000, 3650),
                       np.random.normal(43500, 140000, 3650),
                       np.random.normal(48000, 70000, 3650)],
                      index=[1992, 1993, 1994, 1995])

    df_transposed = df.T
    df_transposed.columns = ['1992', '1993', '1994', '1995']

    c = Calculators()
    c.calculate_mean(df_transposed, df_transposed.columns.values)
    c.calculate_std(df_transposed, df_transposed.columns.values)
    c.calculate_confint(df_transposed)

    # print('Mean values: {}'.format(c.mean))
    # print('Standard deviation values: {}'.format(c.std))
    # print('95% confidence level of SEM: {}'.format(c.confint))

    fig = plt.figure(figsize=(10, 6))
    gs = gridspec.GridSpec(2, 1, height_ratios=[15, 1])
    ax0 = plt.subplot(gs[0])

    p = PointPicker(ax0, c.mean, c.confint, c.std,
                    df_transposed.columns.values)

    ax1 = plt.subplot(gs[1])
    ax1.set_xticks(np.arange(0, 1, step=0.2))
    norm = mpl.colors.Normalize(vmin=0, vmax=1)
    mpl.colorbar.ColorbarBase(
        ax1, cmap=cm.Reds, norm=norm, orientation='horizontal')

    plt.tight_layout()
    plt.savefig('assignment.png')
    # plt.close()
    plt.show()
