# Applied Data Science With Python Specialization


The 5 courses in this University of Michigan specialization introduce learners to data science through the python programming language. This skills-based specialization is intended for learners who have a basic python or programming background, and want to apply statistical, machine learning, information visualization, text analysis, and social network analysis techniques through popular python toolkits such as pandas, matplotlib, scikit-learn, nltk, and networkx to gain insight into their data. Introduction to Data Science in Python (course 1), Applied Plotting, Charting & Data Representation in Python (course 2), and Applied Machine Learning in Python (course 3) should be taken in order and prior to any other course in the specialization. After completing those, courses 4 and 5 can be taken in any order. All 5 are required to earn a certificate.

## Applied Data Science with Python Specialization

[University of Michigan - Applied Data Science with Python Specialization](https://www.coursera.org/specializations/data-science-python)

#### Assignment 2

```python
''' Assignment 2 - Pandas Introduction
    All questions are weighted the same in this assignment.

    Part 1
    The following code loads the olympics dataset (olympics.csv), which was derrived from the Wikipedia entry on [All Time Olympic Games Medals](https://en.wikipedia.org/wiki/All-time_Olympic_Games_medal_table), and does some basic data cleaning.

    The columns are organized as # of Summer games, Summer medals, # of Winter games, Winter medals, total # number of games, total # of medals. Use this dataset to answer the questions below.
'''

import pandas as pd

df = pd.read_csv('olympics.csv', index_col=0, skiprows=1)

for col in df.columns:
    if col[:2] == '01':
        df.rename(columns={col: 'Gold'+col[4:]}, inplace=True)
    if col[:2] == '02':
        df.rename(columns={col: 'Silver'+col[4:]}, inplace=True)
    if col[:2] == '03':
        df.rename(columns={col: 'Bronze'+col[4:]}, inplace=True)
    if col[:1] == '№':
        df.rename(columns={col: '#'+col[1:]}, inplace=True)

names_ids = df.index.str.split('\s\(')  # split the index by '('

df.index = names_ids.str[0]  # the [0] element is the country name (new index)
# the [1] element is the abbreviation or ID (take first 3 characters from that)
df['ID'] = names_ids.str[1].str[:3]

df = df.drop('Totals')
df.head()


''' Question 1
    Which country has won the most gold medals in summer games?

    *This function should return a single string value.*
'''


def answer_one():
    return df[df['Gold'] == df['Gold'].max()].index[0]


''' Question 2
    Which country had the biggest difference between their summer and winter gold medal counts?

    *This function should return a single string value.*
'''


def answer_two():
    return (df['Gold'] - df['Gold.1']).idxmax()


''' Question 3
    Which country has the biggest difference between their summer gold medal counts and winter gold medal counts relative to their total gold medal count?

    $\frac{Summer~Gold - Winter~Gold}{Total~Gold}$$

    Only include countries that have won at least 1 gold in both summer and winter.

    *This function should return a single string value.*
'''


def answer_three():
    df2 = df[(df['Gold'] > 0) & (df['Gold.1'] > 0)]
    return ((df2['Gold'] - df2['Gold.1'])/df2['Gold.2']).idxmax()


''' Question 4
    Write a function that creates a Series called "Points" which is a weighted value where each gold medal (`Gold.2`) counts for 3 points, silver medals (`Silver.2`) for 2 points, and bronze medals (`Bronze.2`) for 1 point. The function should return only the column (a Series object) which you created, with the country names as indices.

    *This function should return a Series named `Points` of length 146*
'''


def answer_four():
    df['Points'] = df['Gold.2'] * 3 + df['Silver.2'] * 2 + df['Bronze.2'] * 1
    return df['Points']


''' Part 2
    For the next set of questions, we will be using census data from the [United States Census Bureau](http://www.census.gov). Counties are political and geographic subdivisions of states in the United States. This dataset contains population data for counties and states in the US from 2010 to 2015. [See this document](https://www2.census.gov/programs-surveys/popest/technical-documentation/file-layouts/2010-2015/co-est2015-alldata.pdf) for a description of the variable names.

    The census dataset (census.csv) should be loaded as census_df. Answer questions using this as appropriate.

    Question 5
    Which state has the most counties in it? (hint: consider the sumlevel key carefully! You'll need this for future questions too...)

    *This function should return a single string value.*
'''

census_df = pd.read_csv('census.csv')
# census_df.head()


def answer_five():
    return census_df['STNAME'].value_counts().idxmax()


''' Question 6
    **Only looking at the three most populous counties for each state**, what are the three most populous states (in order of highest population to lowest population)? Use `CENSUS2010POP`.

    *This function should return a list of string values.*
'''


# SUMLEV: 040 = State and/or Statistical Equivalent 050 = County and /or Statistical Equivalent
def answer_six():
    return census_df[census_df['SUMLEV'] == 50].groupby('STNAME')['CENSUS2010POP'].apply(lambda cp: cp.nlargest(3).sum()).nlargest(3).index.values.tolist()


''' Question 7
    Which county has had the largest absolute change in population within the period 2010-2015? (Hint: population values are stored in columns POPESTIMATE2010 through POPESTIMATE2015, you need to consider all six columns.)

    e.g. If County Population in the 5 year period is 100, 120, 80, 105, 100, 130, then its largest change in the period would be |130-80| = 50.

    *This function should return a single string value.*
'''


# CTYNAME: County Name

def answer_seven():
    return census_df[census_df['SUMLEV'] == 50].groupby('CTYNAME')['POPESTIMATE2010', 'POPESTIMATE2011', 'POPESTIMATE2012', 'POPESTIMATE2013', 'POPESTIMATE2014', 'POPESTIMATE2015'].apply(lambda cp: (cp.max(axis=1)-cp.min(axis=1)).max()).idxmax()


''' Question 8
    In this datafile, the United States is broken up into four regions using the "REGION" column.

    Create a query that finds the counties that belong to regions 1 or 2, whose name starts with 'Washington', and whose POPESTIMATE2015 was greater than their POPESTIMATE 2014.

    *This function should return a 5x2 DataFrame with the columns = ['STNAME', 'CTYNAME'] and the same index ID as the census_df (sorted ascending by index).*
'''


def answer_eight():
    return census_df[(census_df['REGION'] < 3) & (census_df['POPESTIMATE2015'] > census_df['POPESTIMATE2014']) & (census_df['CTYNAME'].str.contains('Washington'))][['STNAME', 'CTYNAME']]


print(answer_one())
print(answer_two())
print(answer_three())
print(answer_four())
print(answer_five())
print(answer_six())
print(answer_seven())
print(answer_eight())
```

#### Assignment 3

````python
''' Assignment 3 - More Pandas
    This assignment requires more individual learning then the last one did - you are encouraged to check out the [pandas documentation](http://pandas.pydata.org/pandas-docs/stable/) to find functions or methods you might not have used yet, or ask questions on [Stack Overflow](http://stackoverflow.com/) and tag them as pandas and python related. And of course, the discussion forums are open for interaction with your peers and the course staff.

    Question 1 (20%)
    Load the energy data from the file `Energy Indicators.xls`, which is a list of indicators of [energy supply and renewable electricity production](Energy%20Indicators.xls) from the [United Nations](http://unstats.un.org/unsd/environment/excel_file_tables/2013/Energy%20Indicators.xls) for the year 2013, and should be put into a DataFrame with the variable name of **energy**.

    Keep in mind that this is an Excel file, and not a comma separated values file. Also, make sure to exclude the footer and header information from the datafile. The first two columns are unneccessary, so you should get rid of them, and you should change the column labels so that the columns are:

    `['Country', 'Energy Supply', 'Energy Supply per Capita', '% Renewable']`

    Convert `Energy Supply` to gigajoules (there are 1,000,000 gigajoules in a petajoule). For all countries which have missing data (e.g. data with "...") make sure this is reflected as `np.NaN` values.

    Rename the following list of countries (for use in later questions):

    "Republic of Korea": "South Korea",
    "United States of America": "United States",
    "United Kingdom of Great Britain and Northern Ireland": "United Kingdom",
    "China, Hong Kong Special Administrative Region": "Hong Kong"```

    There are also several countries with numbers and/or parenthesis in their name. Be sure to remove these,

    e.g.

    'Bolivia (Plurinational State of)'` should be `'Bolivia'`,
    `'Switzerland17'` should be `'Switzerland'`.

    Next, load the GDP data from the file `world_bank.csv`, which is a csv containing countries' GDP from 1960 to 2015 from [World Bank](http://data.worldbank.org/indicator/NY.GDP.MKTP.CD). Call this DataFrame **GDP**.

    Make sure to skip the header, and rename the following list of countries:

    "Korea, Rep.": "South Korea",
    "Iran, Islamic Rep.": "Iran",
    "Hong Kong SAR, China": "Hong Kong"```

    Finally, load the [Sciamgo Journal and Country Rank data for Energy Engineering and Power Technology](http://www.scimagojr.com/countryrank.php?category=2102) from the file `scimagojr-3.xlsx`, which ranks countries based on their journal contributions in the aforementioned area. Call this DataFrame **ScimEn**.

    Join the three datasets: GDP, Energy, and ScimEn into a new dataset (using the intersection of country names). Use only the last 10 years (2006-2015) of GDP data and only the top 15 countries by Scimagojr 'Rank' (Rank 1 through 15).

    The index of this DataFrame should be the name of the country, and the columns should be ['Rank', 'Documents', 'Citable documents', 'Citations', 'Self-citations',
    'Citations per document', 'H index', 'Energy Supply',
    'Energy Supply per Capita', '% Renewable', '2006', '2007', '2008',
    '2009', '2010', '2011', '2012', '2013', '2014', '2015'].

    *This function should return a DataFrame with 20 columns and 15 entries.*
'''
import pandas as pd
import numpy as np

energy = pd.read_excel('Energy Indicators.xls', skiprows=17)

# remove header and footer
energy = energy[:227]

# drop useless columns
energy = energy.drop(energy.columns[[0, 1]], axis=1)

# rename columns
energy.columns = ['Country', 'Energy Supply',
                  'Energy Supply per Capita', '% Renewable']

# replace ... with NaN
energy.replace('...', np.nan, inplace=True)

# convert Energy Supply units
energy['Energy Supply'] = energy['Energy Supply'] * 1000000

# remove all numbers from country names and parenthesis


def remove_numbers(country):
    return ''.join(filter(lambda x: not x.isdigit(), country))


def remove_parenthesis(country):
    start = country.find('(')
    if start > -1:
        return country[:start-1]
    return country


energy['Country'] = energy['Country'].apply(remove_numbers)
energy['Country'] = energy['Country'].apply(remove_parenthesis)

# replace country names
country_replace = {'Republic of Korea': 'South Korea',
                   'United States of America': 'United States',
                   'United Kingdom of Great Britain and Northern Ireland': 'United Kingdom',
                   'China, Hong Kong Special Administrative Region': 'Hong Kong',
                   }
# energy.replace(country_replace, inplace = True)
energy.replace({'Country': country_replace}, inplace=True)

GDP = pd.read_csv('world_bank.csv', skiprows=4)

# rename Country Name to Country so that merge will work later on.
GDP.rename(columns={'Country Name': 'Country'}, inplace=True)

country_replace = {'Korea, Rep.': 'South Korea',
                   'Iran, Islamic Rep.': 'Iran',
                   'Hong Kong SAR, China': 'Hong Kong'
                   }

GDP.replace({'Country': country_replace}, inplace=True)

ScimEn = pd.read_excel('scimagojr-3.xlsx')


def answer_one():
    global energy, GDP, ScimEn

    # merge all three dataframes
    combined_df = pd.merge(
        pd.merge(energy, GDP, on='Country'), ScimEn, on='Country')

    # set index to country name
    combined_df.set_index('Country', inplace=True)

    # keep specific columns
    combined_df = combined_df[['Rank', 'Documents', 'Citable documents', 'Citations',
                               'Self-citations', 'Citations per document', 'H index',
                               'Energy Supply', 'Energy Supply per Capita', '% Renewable',
                               '2006', '2007', '2008', '2009', '2010', '2011', '2012', '2013',
                               '2014', '2015']]

    # only include Ranking 15 or higher
    combined_df = combined_df[combined_df['Rank'] <= 15]

    # organize the Ranking
    combined_df = combined_df.sort_values(['Rank'], ascending=[1])

    return combined_df


''' Question 2 (6.6%)
    The previous question joined three datasets then reduced this to just the top 15 entries. When you joined the datasets, but before you reduced this to the top 15 items, how many entries did you lose?

    *This function should return a single number.*
'''


def answer_two():
    global energy, GDP, ScimEn

    un = pd.merge(pd.merge(energy, GDP, on='Country', how='outer'),
                  ScimEn, on='Country', how='outer')
    int = pd.merge(pd.merge(energy, GDP, on='Country'), ScimEn, on='Country')

    return (len(un) - len(int))


''' Answer the following questions in the context of only the top 15 countries by Scimagojr Rank (aka     the DataFrame returned by `answer_one()`)
'''

''' Question 3 (6.6%)
    What is the average GDP over the last 10 years for each country? (exclude missing values from this calculation.)

    *This function should return a Series named `avgGDP` with 15 countries and their average GDP sorted in descending order.*
'''


def answer_three():
    Top15 = answer_one()
    avgGDP = Top15[['2006', '2007', '2008', '2009', '2010', '2011', '2012',
                    '2013', '2014', '2015']].mean(axis=1).sort_values(ascending=False)

    return avgGDP


''' Question 4 (6.6%)
    By how much had the GDP changed over the 10 year span for the country with the 6th largest average GDP?

    *This function should return a single number.*
'''


def answer_four():
    Top15 = answer_one()
    avgGDP = answer_three().reset_index()

    return np.float64(Top15.filter(like=avgGDP.iloc[5]['Country'], axis=0)['2015'] - Top15.filter(like=avgGDP.iloc[5]['Country'], axis=0)['2006'])


''' Question 5 (6.6%)
    What is the mean `Energy Supply per Capita`?

    *This function should return a single number.*
'''


def answer_five():
    Top15 = answer_one()

    return Top15['Energy Supply per Capita'].mean()


''' Question 6 (6.6%)
    What country has the maximum % Renewable and what is the percentage?

    *This function should return a tuple with the name of the country and the percentage.*
'''


def answer_six():
    Top15 = answer_one()
    country = Top15.sort_values(by='% Renewable', ascending=False).iloc[0]

    return (country.name, country['% Renewable'])


''' Question 7 (6.6%)
    Create a new column that is the ratio of Self-Citations to Total Citations.
    What is the maximum value for this new column, and what country has the highest ratio?

    *This function should return a tuple with the name of the country and the ratio.*
'''


def answer_seven():
    Top15 = answer_one()
    Top15['Citation ratio'] = (Top15['Self-citations'] / Top15['Citations'])
    country = Top15.sort_values(by='Citation ratio', ascending=False).iloc[0]

    return (country.name, country['Citation ratio'])


''' Question 8 (6.6%)

    Create a column that estimates the population using Energy Supply and Energy Supply per capita.
    What is the third most populous country according to this estimate?

    *This function should return a single string value.*
'''


def answer_eight():
    Top15 = answer_one()
    Top15['Population'] = (Top15['Energy Supply'] /
                           Top15['Energy Supply per Capita'])

    return Top15.sort_values(by='Population', ascending=False).iloc[2].name


''' Question 9 (6.6%)
    Create a column that estimates the number of citable documents per person.
    What is the correlation between the number of citable documents per capita and the energy supply per capita? Use the `.corr()` method, (Pearson's correlation).

    *This function should return a single number.*
'''


def answer_nine():
    Top15 = answer_one()
    Top15['PopEst'] = Top15['Energy Supply'] / \
        Top15['Energy Supply per Capita']
    Top15['Citable docs per Capita'] = Top15['Citable documents'] / Top15['PopEst']

    return Top15[['Energy Supply per Capita', 'Citable docs per Capita']].corr().loc['Energy Supply per Capita', 'Citable docs per Capita']


''' Question 10 (6.6%)
    Create a new column with a 1 if the country's % Renewable value is at or above the median for all countries in the top 15, and a 0 if the country's % Renewable value is below the median.

    *This function should return a series named `HighRenew` whose index is the country name sorted in ascending order of rank.*
'''


def answer_ten():
    Top15 = answer_one()

    # T / F for % renewable over median or not
    Top15['HighRenew'] = Top15['% Renewable'] >= Top15['% Renewable'].median()
    Top15['HighRenew'] = Top15['HighRenew'].apply(lambda x: 1 if x else 0)

    # sorted by Rank
    Top15.sort_values(by='Rank', inplace=True)

    return Top15['HighRenew']


''' Question 11 (6.6%)
    Use the following dictionary to group the Countries by Continent, then create a dateframe that displays the sample size (the number of countries in each continent bin), and the sum, mean, and std deviation for the estimated population of each country.

    ContinentDict  = {'China':'Asia',
                  'United States':'North America',
                  'Japan':'Asia',
                  'United Kingdom':'Europe',
                  'Russian Federation':'Europe',
                  'Canada':'North America',
                  'Germany':'Europe',
                  'India':'Asia',
                  'France':'Europe',
                  'South Korea':'Asia',
                  'Italy':'Europe',
                  'Spain':'Europe',
                  'Iran':'Asia',
                  'Australia':'Australia',
                  'Brazil':'South America'}


*This function should return a DataFrame with index named Continent `['Asia', 'Australia', 'Europe', 'North America', 'South America']` and columns `['size', 'sum', 'mean', 'std']`*
'''


def answer_eleven():
    Top15 = answer_one()
    ContinentDict = {'China': 'Asia',
                     'United States': 'North America',
                     'Japan': 'Asia',
                     'United Kingdom': 'Europe',
                     'Russian Federation': 'Europe',
                     'Canada': 'North America',
                     'Germany': 'Europe',
                     'India': 'Asia',
                     'France': 'Europe',
                     'South Korea': 'Asia',
                     'Italy': 'Europe',
                     'Spain': 'Europe',
                     'Iran': 'Asia',
                     'Australia': 'Australia',
                     'Brazil': 'South America'
                     }

    groups = pd.DataFrame(columns=['size', 'sum', 'mean', 'std'])
    Top15['PopEst'] = Top15['Energy Supply'] / \
        Top15['Energy Supply per Capita']

    for continent, count in Top15.groupby(ContinentDict):
        #         print(count['PopEst'])
        #         print('*'*40)
        groups.loc[continent] = [len(count), count['PopEst'].sum(
        ), count['PopEst'].mean(), count['PopEst'].std()]

    return groups


''' Question 12 (6.6%)
    Cut % Renewable into 5 bins. Group Top15 by the Continent, as well as these new % Renewable bins. How many countries are in each of these groups?

    *This function should return a __Series__ with a MultiIndex of `Continent`, then the bins for `% Renewable`. Do not include groups with no countries.*
'''


def answer_twelve():
    Top15 = answer_one()
    ContinentDict = {'China': 'Asia',
                     'United States': 'North America',
                     'Japan': 'Asia',
                     'United Kingdom': 'Europe',
                     'Russian Federation': 'Europe',
                     'Canada': 'North America',
                     'Germany': 'Europe',
                     'India': 'Asia',
                     'France': 'Europe',
                     'South Korea': 'Asia',
                     'Italy': 'Europe',
                     'Spain': 'Europe',
                     'Iran': 'Asia',
                     'Australia': 'Australia',
                     'Brazil': 'South America'
                     }

    Top15['Continent'] = Top15.index.map(lambda c: ContinentDict[c])

    # https://pandas.pydata.org/pandas-docs/stable/generated/pandas.cut.html
    Top15['% Renewable bins'] = pd.cut(Top15['% Renewable'], 5)

    return Top15.groupby(['Continent', '% Renewable bins']).size()


''' Question 13 (6.6%)
    Convert the Population Estimate series to a string with thousands separator (using commas). Do not round the results.

    e.g. 317615384.61538464 -> 317,615,384.61538464

    *This function should return a Series `PopEst` whose index is the country name and whose values are the population estimate string.*
'''


def answer_thirteen():
    Top15 = answer_one()
    Top15['PopEst'] = Top15['Energy Supply'] / \
        Top15['Energy Supply per Capita']

    # https://stackoverflow.com/questions/22617/format-numbers-to-strings-in-python
    return Top15['PopEst'].apply(lambda str: '{0:,}'.format(str))


print('-'*40)
print(answer_one())
print('-'*40)
print(answer_two())
print('-'*40)
print(answer_three())
print('-'*40)
print(answer_four())
print('-'*40)
print(answer_five())
print('-'*40)
print(answer_six())
print('-'*40)
print(answer_seven())
print('-'*40)
print(answer_eight())
print('-'*40)
print(answer_nine())
print('-'*40)
print(answer_ten())
print('-'*40)
print(answer_eleven())
print('-'*40)
print(answer_twelve())
print('-'*40)
print(answer_thirteen())
````

#### Assignment 4

````python
import pandas as pd
import numpy as np
from scipy.stats import ttest_ind


''' Assignment 4 - Hypothesis Testing
    This assignment requires more individual learning than previous assignments - you are encouraged to check out the [pandas documentation](http://pandas.pydata.org/pandas-docs/stable/) to find functions or methods you might not have used yet, or ask questions on [Stack Overflow](http://stackoverflow.com/) and tag them as pandas and python related. And of course, the discussion forums are open for interaction with your peers and the course staff.

    Definitions:
    * A _quarter_ is a specific three month period, Q1 is January through March, Q2 is April through June, Q3 is July through September, Q4 is October through December.
    * A _recession_ is defined as starting with two consecutive quarters of GDP decline, and ending with two consecutive quarters of GDP growth.
    * A _recession bottom_ is the quarter within a recession which had the lowest GDP.
    * A _university town_ is a city which has a high percentage of university students compared to the total population of the city.

    **Hypothesis**: University towns have their mean housing prices less effected by recessions. Run a t-test to compare the ratio of the mean price of houses in university towns the quarter before the recession starts compared to the recession bottom. (`price_ratio=quarter_before_recession/recession_bottom`)

    The following data files are available for this assignment:
    * From the [Zillow research data site](http://www.zillow.com/research/data/) there is housing data for the United States. In particular the datafile for [all homes at a city level](http://files.zillowstatic.com/research/public/City/City_Zhvi_AllHomes.csv),  ```City_Zhvi_AllHomes.csv```, has median home sale prices at a fine grained level.
    * From the Wikipedia page on college towns is a list of [university towns in the United States](https://en.wikipedia.org/wiki/List_of_college_towns#College_towns_in_the_United_States) which has been copy and pasted into the file ```university_towns.txt```.
    * From Bureau of Economic Analysis, US Department of Commerce, the [GDP over time](http://www.bea.gov/national/index.htm#gdp) of the United States in current dollars (use the chained value in 2009 dollars), in quarterly intervals, in the file ```gdplev.xls```. For this assignment, only look at GDP data from the first quarter of 2000 onward.

    Each function in this assignment below is worth 10%, with the exception of ```run_ttest()```, which is worth 50%.
'''

# Use this dictionary to map state names to two letter acronyms
states = {'OH': 'Ohio', 'KY': 'Kentucky', 'AS': 'American Samoa', 'NV': 'Nevada', 'WY': 'Wyoming', 'NA': 'National', 'AL': 'Alabama', 'MD': 'Maryland', 'AK': 'Alaska', 'UT': 'Utah', 'OR': 'Oregon', 'MT': 'Montana', 'IL': 'Illinois', 'TN': 'Tennessee', 'DC': 'District of Columbia', 'VT': 'Vermont', 'ID': 'Idaho', 'AR': 'Arkansas', 'ME': 'Maine', 'WA': 'Washington', 'HI': 'Hawaii', 'WI': 'Wisconsin', 'MI': 'Michigan', 'IN': 'Indiana', 'NJ': 'New Jersey', 'AZ': 'Arizona', 'GU': 'Guam', 'MS': 'Mississippi', 'PR': 'Puerto Rico', 'NC': 'North Carolina',
          'TX': 'Texas', 'SD': 'South Dakota', 'MP': 'Northern Mariana Islands', 'IA': 'Iowa', 'MO': 'Missouri', 'CT': 'Connecticut', 'WV': 'West Virginia', 'SC': 'South Carolina', 'LA': 'Louisiana', 'KS': 'Kansas', 'NY': 'New York', 'NE': 'Nebraska', 'OK': 'Oklahoma', 'FL': 'Florida', 'CA': 'California', 'CO': 'Colorado', 'PA': 'Pennsylvania', 'DE': 'Delaware', 'NM': 'New Mexico', 'RI': 'Rhode Island', 'MN': 'Minnesota', 'VI': 'Virgin Islands', 'NH': 'New Hampshire', 'MA': 'Massachusetts', 'GA': 'Georgia', 'ND': 'North Dakota', 'VA': 'Virginia'}


def get_list_of_university_towns():
    '''Returns a DataFrame of towns and the states they are in from the
    university_towns.txt list. The format of the DataFrame should be:
    DataFrame( [ ["Michigan", "Ann Arbor"], ["Michigan", "Yipsilanti"] ],
    columns=["State", "RegionName"]  )

    The following cleaning needs to be done:

    1. For "State", removing characters from "[" to the end.
    2. For "RegionName", when applicable, removing every character from " (" to the end.
    3. Depending on how you read the data, you may need to remove newline character '\n'. '''

    # create empty dataframe
    df = pd.DataFrame(columns=['State', 'RegionName'])

    # open file using with to avoid file close etc.
    with open('university_towns.txt', 'r') as file:
        # empty strings
        state = ''
        regionname = ''

        # index
        i = 0

        for line in file:
            if '[edit]' in line:
                state = line.replace('[edit]', '').strip('\n')
                regionname = ''
            else:
                start = line.find('(')
                if start != -1:
                    regionname = line[:start - 1]

            # populate dataframe from index = 0
            if regionname != '':
                #                 print('State: {}, RegionName: {}\n'.format(state, regionname))
                df.loc[i] = [state, regionname]
                i = i + 1

    return df

# get_list_of_university_towns()


def get_recession_start():
    '''Returns the year and quarter of the recession start time as a
    string value in a format such as 2005q3'''

    df = pd.read_excel('gdplev.xls', skiprows=219)
    df = df.drop(df.columns[list(range(0, 4)) + [5, 7]], axis=1)

    df.columns = ['Quarterly', 'GDP in chained 2009 dollars']

    return df.loc[df[(df['GDP in chained 2009 dollars']
                      < df['GDP in chained 2009 dollars'].shift(1))
                     & (df['GDP in chained 2009 dollars'].shift(1)
                        < df['GDP in chained 2009 dollars'].shift(2))].index[0] - 1][0]

# get_recession_start()


def get_recession_end():
    '''Returns the year and quarter of the recession end time as a
    string value in a format such as 2005q3'''

    df = pd.read_excel('gdplev.xls', skiprows=219)
    df = df.drop(df.columns[list(range(0, 4)) + [5, 7]], axis=1)

    df.columns = ['Quarterly', 'GDP in chained 2009 dollars']

    return df.loc[df[(df['GDP in chained 2009 dollars']
                      < df['GDP in chained 2009 dollars'].shift(1))
                     & (df['GDP in chained 2009 dollars'].shift(1)
                        < df['GDP in chained 2009 dollars'].shift(2))].index[-1] + 2][0]

# get_recession_end()


def get_recession_bottom():
    '''Returns the year and quarter of the recession bottom time as a
    string value in a format such as 2005q3'''

    df = pd.read_excel('gdplev.xls', skiprows=219)
    df = df.drop(df.columns[list(range(0, 4)) + [5, 7]], axis=1)

    df.columns = ['Quarterly', 'GDP in chained 2009 dollars']

    return df.loc[df[(df['GDP in chained 2009 dollars']
                      < df['GDP in chained 2009 dollars'].shift(1))
                     & (df['GDP in chained 2009 dollars'].shift(1)
                        < df['GDP in chained 2009 dollars'].shift(2))].index[-1]][0]

# get_recession_bottom()


def convert_housing_data_to_quarters():
    '''Converts the housing data to quarters and returns it as mean
    values in a dataframe. This dataframe should be a dataframe with
    columns for 2000q1 through 2016q3, and should have a multi-index
    in the shape of ["State","RegionName"].

    Note: Quarters are defined in the assignment description, they are
    not arbitrary three month periods.

    The resulting dataframe should have 67 columns, and 10,730 rows.
    '''

    df = pd.read_csv('City_Zhvi_AllHomes.csv')

    # A quarter is a specific three month period,
    # Q1 is January through March, Q2 is April through June,
    # Q3 is July through September, Q4 is October through December

    # drop 96 to 99 data
    df = df.drop(df.columns[[0] + list(range(3, 51))], axis=1)

    # map new state abbreviations
    df.replace({'State': states}, inplace=True)
    df = df.set_index(['State', 'RegionName'])

    # rename columns with datetime
    df.columns = pd.to_datetime(df.columns)

    # resample to quarterly
    # https://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.resample.html
    res = df.resample('Q', axis=1).mean()
    # https://stackoverflow.com/questions/40963347/find-average-of-every-three-columns-in-pandas-dataframe
    res = res.rename(columns=lambda col: '{}q{}'.format(col.year, col.quarter))

    # drop all data from df
    df = df.drop(df.columns[:], axis=1)

    # concat to original df with res
    df = pd.concat([df, res], axis=1)

    return df

# convert_housing_data_to_quarters()


def run_ttest():
    '''First creates new data showing the decline or growth of housing prices
    between the recession start and the recession bottom. Then runs a ttest
    comparing the university town values to the non-university towns values,
    return whether the alternative hypothesis (that the two groups are the same)
    is true or not as well as the p-value of the confidence.

    Return the tuple (different, p, better) where different=True if the t-test is
    True at a p<0.01 (we reject the null hypothesis), or different=False if
    otherwise (we cannot reject the null hypothesis). The variable p should
    be equal to the exact p value returned from scipy.stats.ttest_ind(). The
    value for better should be either "university town" or "non-university town"
    depending on which has a lower mean price ratio (which is equivilent to a
    reduced market loss).'''

    # call functions and set variables
    university_towns = get_list_of_university_towns()
    recession_start = get_recession_start()
    recession_bottom = get_recession_bottom()
    housing = convert_housing_data_to_quarters()

    # new data showing the decline or growth of housing prices
    # between the recession start and the recession bottom
    housing['RecessionDifferential'] = (
        housing[recession_start] - housing[recession_bottom])

    university_town_housing = pd.merge(housing, university_towns,
                                       how='inner', left_index=True, right_on=['State', 'RegionName'])

    # https://stackoverflow.com/questions/40518639/how-to-identify-whats-not-in-the-inner-join-during-dataframe-merge
    non_university_town_housing = pd.merge(housing, university_towns,
                                           how='outer', left_index=True, right_on=['State', 'RegionName'],
                                           indicator=True)

    non_university_town_housing.query('_merge != "both"')

    t_stat, p_val = ttest_ind(university_town_housing['RecessionDifferential'].dropna(
    ), non_university_town_housing['RecessionDifferential'].dropna())

    return (True if p_val < 0.01 else False, p_val, "university town" if
            university_town_housing['RecessionDifferential'].mean() <
            non_university_town_housing['RecessionDifferential'].mean()
            else "non-university town")

print(run_ttest())
````