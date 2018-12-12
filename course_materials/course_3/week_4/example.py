import pandas as pd
from pipelinehelper import PipelineHelper
from sklearn.ensemble import RandomForestClassifier, AdaBoostClassifier, GradientBoostingClassifier
from sklearn.model_selection import GridSearchCV
from sklearn.naive_bayes import MultinomialNB
from sklearn.neighbors import KNeighborsClassifier
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler, MaxAbsScaler, MinMaxScaler
from sklearn.svm import SVC


def blight_model():
    # variables (to be changed if needed)
    train = 'train.csv'
    test = 'test.csv'
    addresses = 'addresses.csv'
    latlons = 'latlons.csv'
    # remove non-existing features from training data or both training and testing data
    features_to_remove_from_train_only = [
        'payment_amount',
        'payment_date',
        'payment_status',
        'balance_due',
        'collection_status',
        'compliance_detail'
    ]
    features_to_remove_general = [
        #         'agency_name',
        'inspector_name',
        'violator_name',
        'violation_street_number',
        'violation_street_name',
        'violation_zip_code',
        'mailing_address_str_number',
        'mailing_address_str_name',
        'city',
        'state',
        'zip_code',
        'non_us_str_code',
        'country',
        'ticket_issued_date',
        'hearing_date',
        'violation_code',
        'violation_description',
        #         'disposition',
        'grafitti_status',
        'state_fee',
        'admin_fee'
    ]

    # https://stackoverflow.com/questions/18171739/unicodedecodeerror-when-reading-csv-file-in-pandas-with-python
    df_train = pd.read_csv(train, encoding="latin-1", low_memory=False)
    df_test = pd.read_csv(test)
    df_addresses = pd.read_csv(addresses)
    df_latlons = pd.read_csv(latlons)

    # remove Null if the violator was found not responsible
    df_train_filtered = df_train[df_train['compliance'].notnull()]
    df_train_filtered = df_train_filtered[df_train_filtered['hearing_date'].notnull()]
    #     df_test_filtered =  df_test[df_test['hearing_date'].notnull()]

    # hot one encode agency_name and disposition
    df_train_filtered = pd.get_dummies(df_train_filtered, columns=['agency_name'])
    df_train_filtered = pd.get_dummies(df_train_filtered, columns=['disposition'])
    df_test = pd.get_dummies(df_test, columns=['agency_name'])
    df_test = pd.get_dummies(df_test, columns=['disposition'])

    # add non existing columns will default value of 0
    df_test['agency_name_Health Department'] = 0
    df_test['agency_name_Neighborhood City Halls'] = 0
    df_train_filtered['disposition_Responsible (Fine Waived) by Admis'] = 0
    df_train_filtered['disposition_Responsible - Compl/Adj by Default'] = 0
    df_train_filtered['disposition_Responsible - Compl/Adj by Determi'] = 0
    df_train_filtered['disposition_Responsible by Dismissal'] = 0

    # fix dates
    df_train_filtered['ticket_issued_date'] = pd.to_datetime(df_train_filtered['ticket_issued_date'])
    df_test['ticket_issued_date'] = pd.to_datetime(df_test['ticket_issued_date'])
    df_train_filtered['hearing_date'] = pd.to_datetime(df_train_filtered['hearing_date'])
    df_test['hearing_date'] = pd.to_datetime(df_test['hearing_date'])
    df_train_filtered['days_between_ticket'] = df_train_filtered['hearing_date'] - df_train_filtered[
        'ticket_issued_date']
    df_test['days_between_ticket'] = df_test['hearing_date'] - df_test['ticket_issued_date']
    df_train_filtered['days_between_ticket'] = df_train_filtered['days_between_ticket'].dt.days
    df_test['days_between_ticket'] = df_test['days_between_ticket'].dt.days
    df_test['days_between_ticket'].fillna(0, inplace=True)
    df_train_filtered['days_between_ticket'].fillna(0, inplace=True)

    # drop features from training data
    df_train_filtered = df_train_filtered.drop(features_to_remove_from_train_only, axis=1)
    df_train_filtered = df_train_filtered.drop(features_to_remove_general, axis=1)
    df_test_filtered = df_test.drop(features_to_remove_general, axis=1)

    # join addresses and latlons together based on common column of address
    # https://stackoverflow.com/questions/45068584/merge-two-csv-files-into-one-with-pandas-by-id
    df_locations = pd.merge(df_addresses, df_latlons, how='inner', on=['address', 'address'])

    # join addresses to train and test dataframe
    df_train_filtered = pd.merge(df_train_filtered, df_locations, how='inner', on=['ticket_id', 'ticket_id'])
    df_test_filtered = pd.merge(df_test_filtered, df_locations, how='inner', on=['ticket_id', 'ticket_id'])

    df_train_filtered = df_train_filtered.drop('address', axis=1)
    df_test_filtered = df_test_filtered.drop('address', axis=1)

    # fill NaN values
    df_train_filtered.lat.fillna(method='pad', inplace=True)
    df_train_filtered.lon.fillna(method='pad', inplace=True)
    df_test_filtered.lat.fillna(method='pad', inplace=True)
    df_test_filtered.lon.fillna(method='pad', inplace=True)
    df_train_filtered.lat.fillna(method='bfill', inplace=True)
    df_train_filtered.lon.fillna(method='bfill', inplace=True)
    df_test_filtered.lat.fillna(method='bfill', inplace=True)
    df_test_filtered.lon.fillna(method='bfill', inplace=True)

    #     df_train_filtered = df_train_filtered.reindex(sorted(df_train_filtered.columns), axis=1)
    #     df_test_filtered = df_test_filtered.reindex(sorted(df_test_filtered.columns), axis=1)

    #     print(df_train_filtered.shape)
    #     print()
    #     print(df_test_filtered.shape)

    y = df_train_filtered.compliance[:20000]
    X = df_train_filtered.drop('compliance', axis=1)[:20000]
    X_test = df_test_filtered

    scores = ['roc_auc']

    for score in scores:
        print("# Tuning hyper-parameters for %s" % score)
        pipe = Pipeline([
            ('scaler', PipelineHelper([
                ('std', StandardScaler()),
                ('max', MaxAbsScaler()),
            ], include_bypass=True)),  # this will produce one setting without scaler
            ('classifier', PipelineHelper([
                ('svm', SVC()),
                ('rf', RandomForestClassifier()),
                ('ada', AdaBoostClassifier()),
                ('gb', GradientBoostingClassifier()),
                ('knn', KNeighborsClassifier()),

                ('nb_pipe', Pipeline([
                    # Naivie Bayes needs positive numbers
                    ('scaler', MinMaxScaler()),
                    ('nb', MultinomialNB())
                ])),
            ])),
        ])

        params = {
            'scaler__selected_model': pipe.named_steps['scaler'].generate({
                'std__with_mean': [True, False],
                'std__with_std': [True, False],
                # no params for 'max' leads to using standard params
            }),
            'classifier__selected_model': pipe.named_steps['classifier'].generate({
                # too slow!
                # 'svm__C': [0.1, 1.0, 10, 100, 1000],
                # 'svm__gamma': [0.0001, 0.001, 0.01, 0.05, 0.1, 1, 10, 100],
                # 'svm__kernel': ['linear', 'rbf'],

                'rf__n_estimators': [10, 20, 50, 100, 150],
                'rf__max_features': ['auto', 'sqrt', 'log2'],
                'rf__min_samples_split': [2, 5, 10],
                'rf__min_samples_leaf': [1, 2, 4],
                'rf__bootstrap': [True, False],

                'ada__n_estimators': [10, 20, 40, 100],
                'ada__algorithm': ['SAMME', 'SAMME.R'],

                'gb__n_estimators': [10, 20, 50, 100],
                'gb__criterion': ['friedman_mse', 'mse', 'mae'],
                'gb__max_features': ['auto', 'sqrt', None],
                'gb__max_depth': [3, 4, 5, 6, 7],

                'knn__n_neighbors': [2, 3, 5, 7, 10],
                'knn__leaf_size': [1, 2, 3, 5],
                'knn__weights': ['uniform', 'distance'],
                'knn__algorithm': ['auto', 'ball_tree', 'kd_tree', 'brute'],

                'nb_pipe__nb__fit_prior': [True, False],
                'nb_pipe__nb__alpha': [0.1, 0.2],
            })
        }
        grid = GridSearchCV(pipe, params, scoring='%s'%score, cv=3, verbose=1, n_jobs=-1)
        grid.fit(X, y)
        print(grid.best_params_)
        print(grid.best_score_)

    # remove gb__ prefix from best_params_
    # new_gb_best_params_ = dict((key.replace('gb__', ''), value) for (key, value) in estimator.best_params_.items())
    # new_gb_best_params_ = {'criterion': 'friedman_mse', 'max_depth': 6, 'max_features': 'sqrt', 'n_estimators': 10}
    # new_nb_best_params_ = {'fit_prior': True, 'alpha': 0.1}
    # new_std_best_params_ = {'with_mean': True, 'with_std': True}

    # scaler = StandardScaler(**new_std_best_params_)
    #
    # X_scaled = scaler.fit_transform(X)
    #
    # X_test_scaled = scaler.transform(X_test)

    # scaler = MinMaxScaler()
    #
    # X_scaled = scaler.fit_transform(X)
    #
    # X_test_scaled = scaler.transform(X_test)
    #
    # estimator3 = MultinomialNB(**new_nb_best_params_)
    #
    # estimator3.fit(X_scaled, y)
    #
    # yhat_prob = estimator3.predict_proba(X_test_scaled)[:,1]
    #
    # results = pd.DataFrame(columns=['ticket_id','compliance'])
    # results['ticket_id'] = df_test_filtered.ticket_id
    # results['compliance'] = yhat_prob
    # results.set_index('ticket_id', inplace=True)
    #
    # return results


if __name__ == '__main__':
    blight_model()
