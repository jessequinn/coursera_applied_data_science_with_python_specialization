# !pip install PipelineHelper

import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline
from sklearn.model_selection import GridSearchCV
from sklearn.preprocessing import StandardScaler, MaxAbsScaler, MinMaxScaler
from sklearn.svm import SVC
from sklearn.ensemble import RandomForestClassifier, AdaBoostClassifier, GradientBoostingClassifier
from sklearn.naive_bayes import MultinomialNB
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import classification_report

# specific for PipelineHelper Class
from sklearn.base import TransformerMixin, BaseEstimator, ClassifierMixin
from collections import defaultdict
import itertools


class PipelineHelper(BaseEstimator, TransformerMixin, ClassifierMixin):

    def __init__(self, available_models=None, selected_model=None, include_bypass=False):
        self.include_bypass = include_bypass
        self.selected_model = selected_model
        # this is required for the clone operator used in gridsearch
        if type(available_models) == dict:
            self.available_models = available_models
        # this is the case for constructing the helper initially
        else:
            # a string identifier is required for assigning parameters
            self.available_models = {}
            for (key, model) in available_models:
                self.available_models[key] = model

    def generate(self, param_dict={}):
        per_model_parameters = defaultdict(lambda: defaultdict(list))

        # collect parameters for each specified model
        for k, values in param_dict.items():
            model_name = k.split('__')[0]
            param_name = k[len(model_name)+2:]  # might be nested
            if model_name not in self.available_models:
                raise Exception('no such model: {0}'.format(model_name))
            per_model_parameters[model_name][param_name] = values

        ret = []

        # create instance for cartesion product of all available parameters for each model
        for model_name, param_dict in per_model_parameters.items():
            parameter_sets = (dict(zip(param_dict, x)) for x in itertools.product(*param_dict.values()))
            for parameters in parameter_sets:
                ret.append((model_name, parameters))

        # for every model that has no specified parameters, add the default model
        for model_name in self.available_models.keys():
            if model_name not in per_model_parameters:
                ret.append((model_name, dict()))

        # check if the stage is to be bypassed as one configuration
        if self.include_bypass:
            ret.append((None, dict(), True))
        return ret

    def get_params(self, deep=False):
        return {'available_models': self.available_models,
                'selected_model': self.selected_model,
                'include_bypass': self.include_bypass}

    def set_params(self, selected_model, available_models=None, include_bypass=False):
        include_bypass = len(selected_model) == 3 and selected_model[2]

        if available_models:
            self.available_models = available_models

        if selected_model[0] is None and include_bypass:
            self.selected_model = None
            self.include_bypass = True
        else:
            if selected_model[0] not in self.available_models:
                raise Exception('so such model available: {0}'.format(selected_model[0]))
            self.selected_model = self.available_models[selected_model[0]]
            self.selected_model.set_params(**selected_model[1])

    def fit(self, X, y=None):
        if self.selected_model is None and not self.include_bypass:
            raise Exception('no model was set')
        elif self.selected_model is None:
            # print('bypassing model for fitting, returning self')
            return self
        else:
            # print('using model for fitting: ', self.selected_model.__class__.__name__)
            return self.selected_model.fit(X, y)

    def transform(self, X, y=None):
        if self.selected_model is None and not self.include_bypass:
            raise Exception('no model was set')
        elif self.selected_model is None:
            # print('bypassing model for transforming:')
            # print(X[:10])
            return X
        else:
            # print('using model for transforming: ', self.selected_model.__class__.__name__)
            return self.selected_model.transform(X)

    def predict(self, x):
        if self.include_bypass:
            raise Exception('bypassing classifier is not allowed')
        if self.selected_model is None:
            raise Exception('no model was set')
        return self.selected_model.predict(x)

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
        'agency_name',
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
        'disposition',
        'grafitti_status'
    ]

    # https://stackoverflow.com/questions/18171739/unicodedecodeerror-when-reading-csv-file-in-pandas-with-python
    df_train = pd.read_csv(train, encoding="latin-1", low_memory=False)
    df_test = pd.read_csv(test)
    df_addresses = pd.read_csv(addresses)
    df_latlons = pd.read_csv(latlons)

    # remove Null if the violator was found not responsible
    df_train_filtered = df_train[df_train['compliance'].notnull()]
    df_train_filtered = df_train_filtered[df_train_filtered['hearing_date'].notnull()]

    # drop features from training data
    df_train_filtered = df_train_filtered.drop(features_to_remove_from_train_only, axis=1)
    df_train_filtered = df_train_filtered.drop(features_to_remove_general, axis=1)
    df_test_filtered = df_test.drop(features_to_remove_general, axis=1)

    # join addresses and latlons together based on common column of address
    # https://stackoverflow.com/questions/45068584/merge-two-csv-files-into-one-with-pandas-by-id
    #     df_locations = pd.merge(df_addresses, df_latlons, how='inner', on=['address', 'address'])

    # join addresses to train and test dataframe
    #     df_train_filtered = pd.merge(df_train_filtered, df_locations, how='inner', on=['ticket_id', 'ticket_id'])
    #     df_test_filtered = pd.merge(df_test_filtered, df_locations, how='inner', on=['ticket_id', 'ticket_id'])

    #     df_train_filtered = df_train_filtered.drop('address', axis=1)
    #     df_test_filtered = df_test_filtered.drop('address', axis=1)

    #     print(df_train_filtered.info())

    y = df_train_filtered.compliance[0:200]
    X = df_train_filtered.drop('compliance', axis=1)[0:200]

    # Split the dataset in two equal parts
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=0)


    #     tuned_parameters = [
    #         {
    #             'svm__kernel': ['linear'],
    #             'svm__gamma': [0.0001, 0.001, 0.01, 0.05, 0.1, 1, 10, 100, 1000],
    #             'svm__C': [1, 10, 100, 1000]
    #         }, {
    #             'svm__kernel': ['rbf'],
    #             'svm__gamma': [0.0001, 0.001, 0.01, 0.05, 0.1, 1, 10, 100, 1000],
    #             'svm__C': [1, 10, 100, 1000]
    #         }]

    # assignment only requires roc_auc
    scores = ['accuracy']

    for score in scores:
        print("# Tuning hyper-parameters for %s" % score)
        print()

        pipe = Pipeline([
            ('scaler', PipelineHelper([
                ('std', StandardScaler()),
                ('max', MaxAbsScaler()),
                ('minmax', MinMaxScaler()),
            ], include_bypass=True)), # this will produce one setting without scaler
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

        # http://scikit-learn.org/stable/auto_examples/model_selection/plot_grid_search_digits.html
        # http://scikit-learn.org/stable/modules/grid_search.html
        # Set the parameters by cross-validation
        # two grids should be explored linear and RBF
        #         tuned_parameters = {
        #             'scaler__selected_model': pipe.named_steps['scaler'].generate({
        #                 'std__with_mean': [True, False],
        #                 'std__with_std': [True, False],
        #                 'max__copy': [True],
        #                 'minmax__copy': [True]
        #             }),
        #             'classifier__selected_model': pipe.named_steps['classifier'].generate({
        #                 'svm__kernel': ['linear', 'rbf'],
        #                 'svm__gamma': [0.0001, 0.001, 0.01, 0.05, 0.1, 1, 10, 100, 1000],
        #                 'svm__C': [1, 10, 100, 1000],
        #                 'gbclf__max_depth': [3]
        #             })
        #         }
        params = {
            'scaler__selected_model': pipe.named_steps['scaler'].generate({
                'std__with_mean': [True, False],
                'std__with_std': [True, False],
                # no params for 'max' leads to using standard params
            }),
            'classifier__selected_model': pipe.named_steps['classifier'].generate({
                'svm__C': [0.1, 1.0],
                'svm__kernel': ['linear', 'rbf'],
                'rf__n_estimators': [10, 20, 50, 100, 150],
                'rf__max_features' : ['auto', 'sqrt', 'log2'],
                'rf__min_samples_split' : [2, 5, 10],
                'rf__min_samples_leaf' : [1, 2, 4],
                'rf__bootstrap': [True, False],
                'ada__n_estimators': [10, 20, 40, 100],
                'ada__algorithm': ['SAMME', 'SAMME.R'],
                'gb__n_estimators': [10, 20, 50, 100],
                'gb__criterion': ['friedman_mse', 'mse', 'mae'],
                'gb__max_features': ['auto', 'sqrt', None],
                'knn__n_neighbors'  : [2, 3, 5, 7, 10],
                'knn__leaf_size':[1,2,3,5],
                'knn__weights': ['uniform', 'distance'],
                'knn__algorithm': ['auto', 'ball_tree','kd_tree','brute'],
                'nb_pipe__nb__fit_prior': [True, False],
                'nb_pipe__nb__alpha': [0.1, 0.2],
            })
        }

        #         pipe = Pipeline(steps=[('scaler', MinMaxScaler()), ('svm', SVC())])
        estimator = GridSearchCV(pipe, params, scoring='%s'%score, verbose=1, n_jobs=-1)
        estimator.fit(X_train, y_train)

        print("Best parameters set found on development set: ", estimator.best_params_)
        print()
        print('Grid best score (AUC): ', estimator.best_score_)
        print()

#         means = estimator.cv_results_['mean_test_score']
#         stds = estimator.cv_results_['std_test_score']
#         for mean, std, params in zip(means, stds, estimator.cv_results_['params']):
#             print("%0.3f (+/-%0.03f) for %r"
#                   % (mean, std * 2, params))
#         print()
#         print("Detailed classification report:")
#         print()
#         print("The model is trained on the full development set.")
#         print("The scores are computed on the full evaluation set.")
#         print()
#         y_true, y_pred = y_test, estimator.predict(X_test)
#         print(classification_report(y_true, y_pred))
#         print()



blight_model()
