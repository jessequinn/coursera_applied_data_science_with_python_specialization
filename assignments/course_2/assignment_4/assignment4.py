''' https://github.com/henriquepgomide/caRtola
    All data was taken from caRtola's repository.
'''


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

# concat several years of match data
m2014 = pd.read_csv('./caRtola-master/data/2014/2014_partidas.csv')
m2015 = pd.read_csv('./caRtola-master/data/2015/2015_partidas.csv')
m2016 = pd.read_csv('./caRtola-master/data/2016/2016_partidas.csv')
m2017 = pd.read_csv('./caRtola-master/data/2017/2017_partidas.csv')
m2018 = pd.read_csv('./caRtola-master/data/2018/2018_partidas.csv')

# remove cancelled game
m2016.drop(m2016.index[377], inplace=True)
m2018.drop(m2018.index[27], inplace=True)
# drop future games for 2018
m2018.drop(m2018.index[239:], inplace=True)

# print(m2018)

matches = pd.concat([m2014, m2015, m2016, m2017, m2018])

# team data
t2014 = pd.read_csv('./caRtola-master/data/2014/2014_times.csv')
t2015 = pd.read_csv('./caRtola-master/data/2015/2015_times.csv')
t2016 = pd.read_csv('./caRtola-master/data/2016/2016_times.csv')
t2017 = pd.read_csv('./caRtola-master/data/2017/2017_times.csv')
teams = pd.concat([t2014, t2015, t2016, t2017]).drop_duplicates('ID')

# add missing 2018 teams (CSV file doesn't exist yet)
teams = teams.append(pd.Series(
    [600, 'Paraná', 'PAR', 'Paraná - PR'], index=teams.columns), ignore_index=True)
teams = teams.append(pd.Series(
    [601, 'Ceará', 'CEA', 'Ceará - CE'], index=teams.columns), ignore_index=True)

# clean up names and abbreviations
teams['Nome'] = teams['Nome'].apply(lambda s: s.lower())
teams['Abreviacao'] = teams['Abreviacao'].apply(lambda s: s.upper())

# print(teams.sort_values('ID'))

# fix glitches in naming
matches['home_team'] = matches['home_team'].str.replace(
    'Vasco da Gama - RJ', 'vasco')
matches['away_team'] = matches['away_team'].str.replace(
    'Vasco da Gama - RJ', 'vasco')

matches['home_team'] = matches['home_team'].str.replace(
    'Atlético - GO', 'Atlético-GO')
matches['away_team'] = matches['away_team'].str.replace(
    'Atlético - GO', 'Atlético-GO')

matches['home_team'] = matches['home_team'].str.replace(
    'Atlético - PR', 'atlético-pr')
matches['away_team'] = matches['away_team'].str.replace(
    'Atlético - PR', 'atlético-pr')

matches['home_team'] = matches['home_team'].str.replace(
    'Atletico - PR', 'atlético-pr')
matches['away_team'] = matches['away_team'].str.replace(
    'Atletico - PR', 'atlético-pr')

matches['home_team'] = matches['home_team'].str.replace(
    'Atlético - MG', 'atlético-mg')
matches['away_team'] = matches['away_team'].str.replace(
    'Atlético - MG', 'atlético-mg')

matches['home_team'] = matches['home_team'].str.replace(
    'América - MG', 'américa-mg')
matches['away_team'] = matches['away_team'].str.replace(
    'América - MG', 'américa-mg')

matches['home_team'] = matches['home_team'].str.replace(
    'Criciuma - SC', 'criciúma')
matches['away_team'] = matches['away_team'].str.replace(
    'Criciuma - SC', 'criciúma')

matches['home_team'] = matches['home_team'].apply(
    lambda s: s.split(' - ')[0].rstrip().lower())
matches['away_team'] = matches['away_team'].apply(
    lambda s: s.split(' - ')[0].rstrip().lower())

# drop garbage columns
matches.drop(['Unnamed: 0', 'X', 'arena', 'game'], axis=1, inplace=True)

# Change names to abbreviation
matches['home_team'] = matches['home_team'].map(
    teams.set_index('Nome')['Abreviacao'])
matches['away_team'] = matches['away_team'].map(
    teams.set_index('Nome')['Abreviacao'])

# check for NaN
# print(matches.isnull().sum())
# print(matches[matches.isnull().any(axis=1)])

# convert date string to datetime object
matches['date'] = pd.to_datetime(matches['date'], format='%d/%m/%Y - %H:%M')
# matches['date'] = matches.date.dt.to_period('M')
matches['date'] = matches.date.dt.strftime('%Y')

# fix scoring
matches['score_home_team'] = matches['score'].apply(
    lambda s: s[:1]).astype(np.int64)
matches['score_away_team'] = matches['score'].apply(
    lambda s: s[3:]).astype(np.int64)

matches.drop(['score'], axis=1, inplace=True)

perround = matches[matches['date'] <= '2017'].groupby(
    ['round'])['score_home_team', 'score_away_team'].agg(['mean', 'std'])
perround2018 = matches[matches['date'] == '2018'].groupby(
    ['round'])['score_home_team', 'score_away_team'].agg(['mean'])


f, ax = plt.subplots(2, figsize=(10, 8))

lp = sns.lineplot(data=perround, ax=ax[1])
sp = sns.scatterplot(data=perround2018, ax=ax[1])
L = plt.legend()
L.get_texts()[0].set_text('2014-2017 Home')
L.get_texts()[1].set_text('2014-2017 Away')
L.get_texts()[2].set_text('2018 Home')
L.get_texts()[3].set_text('2018 Away')
plt.xlabel('Round')
plt.ylabel('Average Goals')
axes = lp.axes
axes.set_xlim(1, 38)


perteamhome = matches.groupby(
    ['home_team'])['score_home_team'].agg(['max', 'min'])
# perteam.columns = ['_'.join(col) for col in perteam.columns]
perteamhome.reset_index(level=0, inplace=True)

perteamaway = matches.groupby(
    ['away_team'])['score_away_team'].agg(['max', 'min'])
# perteam.columns = ['_'.join(col) for col in perteam.columns]
perteamaway.reset_index(level=0, inplace=True)

sns.stripplot(x='home_team', y='max', data=perteamhome,
              ax=ax[0], color='#298CC1', label="Max Home Score 2014-2018")
stp2 = sns.stripplot(x='away_team', y='max', data=perteamaway,
                     ax=ax[0], color='orange', marker='X', label="Max Away Score 2014-2018")

plt.sca(stp2.axes)
plt.xticks(rotation=45)
plt.xlabel('Team')
plt.ylabel('Goals')

handles, labels = stp2.get_legend_handles_labels()

l = plt.legend(handles[0::len(handles)-1], labels[0::len(labels)-1])
plt.title('Brazilian Serie A Football')

plt.tight_layout() 
plt.savefig('assignment4.png')
# plt.show()
