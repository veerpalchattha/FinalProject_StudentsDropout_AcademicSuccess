import streamlit as st
import pandas as pd
import joblib

# Load your saved model
model = joblib.load("student_dropout_rf_model.joblib")

# Define all columns your model expects
all_features = [
    "Marital status",
    "Application mode",
    "Application order",
    "Course",
    "Daytime/evening attendance\t",
    "Previous qualification",
    "Previous qualification (grade)",
    "Displaced",
    "Educational special needs",
    "Debtor",
    "Tuition fees up to date",
    "Gender",
    "Scholarship holder",
    "Age at enrollment"
]

st.title("🎓 Student Dropout Prediction")

# Ask user for key inputs
admission_grade = st.number_input("Admission grade", min_value=0.0, max_value=200.0, value=120.0)
age = st.number_input("Age at enrollment", 15, 60)
tuition_paid = st.selectbox("Tuition fees up to date?", [0, 1])
scholarship = st.selectbox("Scholarship holder?", [0, 1])

# Create a DataFrame with all required columns
input_data = pd.DataFrame([{col: 0 for col in all_features}])

# Overwrite with user inputs
input_data["Age at enrollment"] = age
input_data["Tuition fees up to date"] = tuition_paid
input_data["Scholarship holder"] = scholarship
input_data["Admission grade"] = admission_grade

# Predict
if st.button("Predict"):
    pred = model.predict(input_data)[0]
    st.success(f"Predicted outcome: {pred}")