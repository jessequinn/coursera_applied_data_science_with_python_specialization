import pandas as pd
import numpy as np
import scipy.stats as st
import matplotlib as mpl
import matplotlib.pyplot as plt
from matplotlib import cm
import matplotlib.gridspec as gridspec


'''
https://stackoverflow.com/questions/42876219/point-picker-event-handler-drawing-line-and-displaying-coordinates-in-matplotlib
'''


class PointPicker(object):
    def __init__(self, ax, mean, confint, values, clicklim=0.05):
        self.fig = ax.figure
        self.diff = confint
        self.values = values
        self.ax = ax
        self.mean = mean
        self.confint = confint
        self.y = 0
        self.x = 0
        self.clicklim = clicklim
        self.horizontal_line = ax.axhline(y=0.5, color='black', alpha=0.5)
        self.text = ax.text(0, 0.5, "")
        print(self.horizontal_line)
        self.ax.bar(self.values, self.mean, yerr=self.confint,
                   edgecolor='black', color=cm.bwr(tuple(self.diff/10000)))
        self.fig.canvas.mpl_connect('button_press_event', self.onclick)

    def onclick(self, event):
        if event.inaxes == self.ax:
            self.x = event.xdata
            self.y = event.ydata
            xlim0, xlim1 = self.ax.get_xlim()
            if self.x <= xlim0 + (xlim1 - xlim0) * self.clicklim:
                self.horizontal_line.set_ydata(self.y)
                self.text.set_text("{0:.2f}".format(self.y))
                self.text.set_position((xlim0, self.y))
                self.fig.canvas.draw()
            self.diff = (self.mean + (self.confint / 2)) - self.y
            self.diff[self.diff < 0] = 0
            self.ax.bar(self.values, self.mean, yerr=self.confint,
                   edgecolor='black', color=cm.bwr(tuple(self.diff/10000)))
            plt.draw()


"""Class for doing statistical calculations
"""


class Calculators(object):
    def __init__(self):
        self.mean = 0
        self.sem = 0
        self.confint = 0

    def calculate_mean(self, df, years):
        # calculate mean for each column
        self.mean = np.array(df[years].mean())

    def calculate_confint2(self, df):
        # calculate 95% confidence interval
        # not required, SEM is more desirable
        self.confint = st.t.interval(0.95, len(
            df)-1, loc=np.mean(df), scale=st.sem(df))

    def calculate_sem(self, df):
        # calculate standard error of the mean (SEM)
        self.sem = st.sem(df)

    def calculate_confint(self, df):
        # calcualte confidence interval
        self.calculate_sem(df)
        self.confint = 1.96 * self.sem


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
    c.calculate_confint(df_transposed)
    print('Mean values: {}'.format(c.mean))
    print('95% confidence level of SEM: {}'.format(c.confint))

    fig = plt.figure(figsize=(10, 6))
    gs = gridspec.GridSpec(2, 1, height_ratios=[15, 1])
    ax0 = plt.subplot(gs[0])
    
    # ax0.bar(df_transposed.columns.values, c.mean, yerr=c.confint,
    # edgecolor='black', color=cmap(tuple(c.confint/10000)), alpha=0.5)

    p = PointPicker(ax0, c.mean, c.confint, df_transposed.columns.values)

    ax1 = plt.subplot(gs[1])
    ax1.set_xticks(np.arange(0, 1, step=0.2))
    norm = mpl.colors.Normalize(vmin=0, vmax=1)
    mpl.colorbar.ColorbarBase(
        ax1, cmap=cm.bwr, norm=norm, orientation='horizontal')

    plt.tight_layout()
    # plt.savefig('assignment.png')
    # plt.close()
    plt.show()
