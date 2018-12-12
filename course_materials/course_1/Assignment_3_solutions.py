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
