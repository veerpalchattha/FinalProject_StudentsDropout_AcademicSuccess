# 🎓 Student Dropout & Academic Success Prediction

## 📌 Project Overview

This project aims to analyze and predict student academic outcomes in higher education using **data analytics and machine learning techniques**. The primary goal is to **identify students at risk of dropping out at an early stage**, enabling institutions to implement targeted support strategies and reduce academic failure.

The project is based on a real-world dataset containing **demographic, socioeconomic, and academic information available at the time of student enrollment**. The problem is formulated as a **multi-class classification task**, where the target variable represents the student's final academic status.

---

## 🎯 Objectives

* Analyze factors influencing **student dropout, enrollment, and graduation**
* Identify **key predictors** of academic success and failure
* Build and evaluate **machine learning models** to predict student outcomes
* Provide **data-driven insights** to support early intervention strategies

---

## 📊 Dataset Description

### Purpose of the Dataset

The dataset was created as part of a project focused on **reducing academic dropout and failure in higher education** through early risk detection using machine learning.

### Funding

This dataset is supported by the **SATDAP – Capacitação da Administração Pública** program under grant **POCI-05-5762-FSE-000191**, Portugal.

### Instances

* Each row represents a **single student**

### Target Variable

* `Target`:

  * Dropout
  * Enrolled
  * Graduate

### Features

The dataset includes the following categories of variables:

#### Demographic Information

* Gender
* Age at enrollment
* Marital status
* Nationality
* International status
* Displaced

#### Socioeconomic Background

* Mother’s qualification and occupation
* Father’s qualification and occupation
* Scholarship holder
* Debtor
* Tuition fees up to date

#### Academic Background (at Enrollment)

* Previous qualification
* Previous qualification grade
* Admission grade
* Application mode
* Application order
* Course
* Daytime/Evening attendance

#### Academic Performance (Post-enrollment)

* Curricular units (1st and 2nd semester):

  * Enrolled
  * Evaluations
  * Approved
  * Grades
  * Without evaluations

#### Macroeconomic Indicators

* Unemployment rate
* Inflation rate
* GDP

---

## 🧹 Data Preprocessing

* Handling missing values
* Removing anomalies and unexplainable outliers
* Encoding categorical variables
* Feature scaling where required

A rigorous preprocessing pipeline was applied to ensure data quality and model reliability.

---

## 🔍 Research Questions

* Does prior academic performance influence dropout likelihood?
* Do socioeconomic factors affect student outcomes?
* Are demographic characteristics associated with higher dropout rates?
* Do some academic programs have higher dropout rates than others?
* Can student outcomes be predicted using data available at enrollment?
* Which features contribute most to dropout prediction?

---

## 🤖 Machine Learning Approach

### Models Used

* Logistic Regression (Multinomial)
* Decision Trees
* Random Forest
* Gradient Boosting (XGBoost)

### Evaluation Metrics

* Accuracy
* Precision, Recall, F1-score (with focus on Dropout class)
* Confusion Matrix
* ROC-AUC (One-vs-Rest)

### Train-Test Split

* 80% Training
* 20% Testing

---

## 🔎 Model Explainability

To ensure interpretability and responsible use of machine learning:

* Feature importance analysis
* SHAP values for global and local explanations
* Comparison of feature contributions across models

---

## ⚖️ Ethical Considerations

* Analysis of potential bias across demographic groups
* Fairness evaluation of model predictions
* Careful handling of sensitive attributes

---

## 🧠 Key Insights

* Academic background and early performance are strong predictors of dropout
* Socioeconomic factors play a significant role in student success
* Certain courses and enrollment types show higher dropout rates
* Machine learning models can effectively identify at-risk students at enrollment

---

## 🚀 Future Work

* Incorporate time-series or longitudinal analysis
* Develop an early-warning system dashboard
* Evaluate intervention strategies based on risk scores
* Extend fairness and bias analysis

---

## 🛠 Technologies Used

* Python
* Pandas, NumPy
* Matplotlib, Seaborn
* Scikit-learn
* SHAP
* Jupyter Notebook

---

## 📎 How to Run the Project

1. Clone the repository
2. Create and activate the virtual environment
3. Install dependencies
4. Run the notebooks in order

```bash
uv venv
.venv\Scripts\activate
uv pip install -r requirements.txt
jupyter notebook
```

---

## 📌 Conclusion

This project demonstrates how data analytics and machine learning can be leveraged to **support student success**, reduce dropout rates, and enable **evidence-based decision-making** in higher education.

---

## 👩‍💻 Author

Veerpal


