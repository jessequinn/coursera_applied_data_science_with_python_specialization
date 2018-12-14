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
