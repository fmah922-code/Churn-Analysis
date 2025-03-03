# Logistic Regression vs. Decision Tree for Churn Analysis 
This repository contains comprehensive files for retrieving data from a Kaggle Dataset to be used in a logistic regression model and a decision tree model to determine customer churn rates. The analysis and appropriate visuals will be displayed in the visuals folder.


## **Data Analysis For Comparing Between Models**
After loading in the data, we can observe a linear relationship between the independent variable, and the log-odds of the dependent variable. This is a major assumption of the logistic regression. The model assumes this relationship for binary classification.
![image](https://github.com/user-attachments/assets/f0ff793c-fdaa-44c4-835f-5f89a6b98bec)

Distribution of Continuous Variables
![image](https://github.com/user-attachments/assets/37b02d78-c71c-4cb8-9e7a-1af5ed62b8af)

![image](https://github.com/user-attachments/assets/412b8b09-253c-4f4f-9c77-64bbc6fe359d)


Receiver Operating Characteristic (ROC) Curve
![image](https://github.com/user-attachments/assets/837d7cb8-2b56-4f46-807d-3c141db7287a)


# Logistic Regression Model Building

#### Hyperparameter Tuning

Overview:

There are two common methods for tuning hyperparameters: **`GridSearchCV`** and **`RandomizedSearchCV`**.

- **`GridSearchCV`**  
  - This algorithm works by exhaustively searching through **all possible** combinations of model configuration.
  - We define a parameter grid, which acts as a dictionary where the keys are the different hyperparameters, and the values are the ranges of values that we want to explore. 
  - The downside of this is that it can be very computationally expensive, so it's important to understand whether or not accuracy of a model is priority.
  - This **performance** is based on different metrics, such as F1-Score, Accuracy, Recall, and Precision



- **`RandomizedSearchCV`**  
  - Samples **random** combinations from the hyperparameter space, rather than searching all possible combinations.  
  - Advantages to this is that RandomizedSearchCV can be **much faster**, however it's possible to miss the **best possible combination**

The different hyperparameters that are important in logistic regression are...

- **penalty** - controls regularization, helping prevent overfitting by adding constraint to the model's coefficient
- **tol** - Tolerance for stopping criteria of gradient descent. Gradient descent is an optimization algorithm used to train ML models by minimizing errors between predicted and actual results by iteratively changing parameters.
- **C** - C is the inverse of regularization. It is a constant that determines how strongly regularization will affect the model.
- **solver** - These are the methods that try and estimate the best possible parameters while producing the least amount of error in predicting the output, aka the cost function.
- **max_iter** - specifies max # of iterations that solver is allowed to take in order to converge to a solution

**Analysis of Model Metrics**

| Metric     | RandomizedSearchCV    | GridSearchCV     | Default     |
|--------------|--------------|--------------|--------------|
| Precision     | Class 0 = 0.86, Class 1 = 0.68 | Class 0 = 0.86, Class 1 = 0.70 | Class 0 = 0.86, Class 1 = 0.69 |
| Recall   | Class 0 = 0.90, Class 1 = 0.60 | Class 0 = 0.91, Class 1 = 0.58 | Class 0 = 0.90, Class 1 = 0.60 |
| F1-Score | Class 0 = 0.88, Class 1 = 0.64 | Class 0 = 0.88, Class 1 = 0.64 | Class 0 = 0.88, Class 1 = 0.64 |

- Model performance is consistent mostly throughout any hyperparameter tuning method
- There is only slight variations between these different metrics, Higher recall in class 0 for GridSearchCV, higher precision for Class 1 in GridSearchCV
- Reasons for this could be that the default hyperparameters for this model produced nearly the best output. 
- We will use the GridSearchCV hyperparameters for our model, since it has the best performance

## Statistical Analysis

A p-value of < .05 indicates that the likelihood of obtaining the observed data, assuming no relationship, is less than 5%. This means that the observed effect is not random, inferring a statistically significant relationship between the feature and the dependent variable - **`Churn`** .

## Key Findings

- **Paperless Billing**: Customers with paperless billing or those who use electronic checks have a significant chance of churning.
- **Senior Citizen**: Older individuals are more likely to leave the Telco service.
- **Contract_Two Year / Contract_One year** although not very insightful, customers that had a one year or two year contract were likely not going to churn.
- **Total Charges** total charges didn't have that much of an effect on whether or not a customer churns or not.


# Decision Tree Model Building
![image](https://github.com/user-attachments/assets/0fda2c78-ba86-4342-bd88-274bd42cb65d)


Although Decision Trees can train on complex non-linear relationships to determine the relationship between a feature and a  target variable, it can't understand categorical features that are expressed through strings like `'Yes'` or `'No'` / `'Female'` or `'Male'` so we must map to these to numerical values without necessarily needing to create indicator variables unlike with building a logistic regression model.

<u>**Decision Tree Analysis**</u>

Root Node: **`PaymentMethod`** being in the root node suggests that it has the highest impact on Churn probability. There are several payment methods including **`Electronic check`**, **`Mailed Check`**, **`Bank Transfer (automatic)`**, and **`Credit Card (automatic)`**. It would be worth exploring how one method of payment may be causing higher churn rates compared to other methods. The root node is determined by differences in entropy, a measure of randomness within a system. When using entropy to build a decision tree, the root node is determined by Information Gain. This is the difference between the entropy before and the entropy of resulting subsets after the split, another way of framing information gain is measuring how much uncertainty is reduced in predicting Churn when splitting on a particular feature

Leaf Nodes: **`OnlineBackup`** and **`Tenure`** had the lowest entropy scores, at the leaves. This would indicate that Tenure and Onlinebackup had a very strong relationship to Churn levels.

\
<u>**Hyperparameter Improvement**</u>

Hyperparameter tuning increased all overall metrics with tuning. GridSearchCV showed improvements in the following metrics

- **Precision** 
  - *(Churn)*: **0.49 -> 0.59**  
  - *(Non-Churn)*: **0.83 -> 0.85**
- **Recall** 
  - *(Churn)*: **0.53 -> 0.59**
  - *(Non-Churn)*: **0.80 -> 0.85**   
- **F1-Score**:  
  - *(Churn)*: **0.51 -> 0.59**  
  - *(Non-Churn)*: **0.81 -> 0.85**

\
<u>**Business Interpretation / Next Steps**</u>

- It would be advisable to research different payment methods in the company and see which ones are linked to higher levels of Churn
- Tenure also had a large effect on whether a customer had churned. Incentivize customers with either lower tenure or higher tenure. Tenure also accounted for a little over 9% of the entire dataset, and the metrics indicate that 94-95% of customers that churn or stay are dependent on tenure amount. This company should establish targeted retention incentives programs, such as a temporary free subscription for users that haven't stayed with the company long.
-  OnlineBackup services also had a large effect on customer churn, it would be worth analyzing this feature more. perhaps implementing discounts for online backup services, or bundled packages to retain these customers

# Comparison between Models

<u> **Decision Tree Classification Summary** </u>

GridSearchCV Performance: **`81.05%`** \
GridSearchCV chosen hyperparameters: {'criterion': 'entropy', 'max_depth': 6, 'max_features': 8, 'min_samples_leaf': 5}



                     Precision    Recall  F1-Score   Support
       Non-Churn          0.85      0.85      0.85      1036
       Churn              0.59      0.59      0.59       373
       Accuracy                               0.78      1409
       macro avg          0.72      0.72      0.72      1409
       weighted avg       0.78      0.78      0.78      1409



<u> **Logistic Regression Classification Summary** </u>

GridSearchCV Performance: **`82.54%`** \
GridSearchCV chosen hyperparameters: {'C': np.float64(0.08858667904100823),
 'class_weight': None,
 'dual': False,
 'fit_intercept': True,
 'intercept_scaling': 1,
 'l1_ratio': None,
 'max_iter': 50,
 'multi_class': 'deprecated',
 'n_jobs': None,
 'penalty': 'l1',
 'random_state': None,
 'solver': 'liblinear',
 'tol': 0.0001,
 'verbose': 0,
 'warm_start': False}


                     Precision    Recall  F1-score   Support
       Non-Churn          0.86      0.91      0.88      1036
       Churn              0.71      0.58      0.64       373
       accuracy                               0.83      1409
       macro avg          0.78      0.75      0.76      1409
       weighted avg       0.82      0.83      0.82      1409
\
Comparing metrics between the models, 
- Increase in `Precision`
   - `Churn` from (**0.59 -> 0.71**) 
   - `Non-Churn` from (**0.85 -> 0.86**)
- Increase & Decrease in `Recall`
   - `Churn` from (**0.85 -> 0.91**) 
   - `Non-Churn` from (**0.59 -> 0.58**)
- Increase in `F1-Score`
   - `Churn` from (**0.59 -> 0.64**)
   - `Non-Churn` from (**0.85 -> 0.88**)

\
In terms of overall performance, Logistic Regression excels, however it's worth noting that the Decision Tree may be useful in recognizing more positive cases. Indicated with the increase in recall with Churn, if the company more prioritizes false negatives, then the Decision Tree may be the better option. However, if the company is more interested in positive predictions of whether or not a customer churns, the Logistic Regression may be more suitable, it really depends on the needs of this company. Another reason Logistic Regression is preferable is because it's a major assumption in the model that the individual features have a linear relationship to the log odds of the target variable. While Decision Trees thrive on data with complex relationships, if the features have this linearity, Logistic Regression in general, performs and generalizes better.  As shown from the previous graphic and the increase in performance and F1-Score may indicate that the Logistic Regression model would be better for this dataset.

#### PowerBI Visualizations after Analysis
![image](https://github.com/user-attachments/assets/dcddde1d-650e-44a0-8fe8-d235488a898a)

Based on our previous analysis, customers who use electronic checks or mailed checks show a higher tendency to churn. Additionally, churn rates peak around the one-year tenure mark.

#### SQL Server utilized for Data Storage

#### Raw Dataset
![image](https://github.com/user-attachments/assets/8af7a614-d5c2-4436-9b52-eb9850154546)

#### Cleaned Dataset for Logistic Regression Training
![image](https://github.com/user-attachments/assets/7b44056a-4e3b-4143-935d-de7c37f1b0b1)

#### Lineage of columns used in the Logistic Regression final dataset for training 
![image](https://github.com/user-attachments/assets/6bdfce1d-f74f-4465-885d-055a28f4fb2b) 

#### Lineage of columns not used in Logistic Regression model due to multicollinearity
![image](https://github.com/user-attachments/assets/05904784-8e0c-46b6-8edf-2db9ec02be14)

### Dataset Information:
- Customers who left within the last month – the column is called Churn
- Services that each customer has signed up for – phone, multiple lines, internet, online security, online backup, device protection, tech support, and streaming TV and movies
- Customer account information – how long they’ve been a customer, contract, payment method, paperless billing, monthly charges, and total charges
Demographic info about customers – gender, age range, and if they have partners and dependents

https://www.kaggle.com/datasets/blastchar/telco-customer-churn/data


### Technologies Used:
- Python (for API requests, data processing, data transforming)
- DBT (transformation documentation)
- SQL Server (for Data storage)
- PowerBI (for Visuals)


