This project is an end-to-end data analysis solution designed to extract critical business insights from Walmart sales data. We utilize Python for data processing and analysis, SQL for advanced querying, and structured problem-solving techniques to solve key business questions. The project is ideal for data analysts looking to develop skills in data manipulation, SQL querying, and data pipeline creation.


# Walmart Sales Data Analysis

## Project Overview
This project focuses on analyzing Walmart sales data using Python and SQL (MySQL). The analysis involves data extraction, cleaning, feature engineering, database storage, and advanced SQL queries to derive meaningful insights.

## Tools & Technologies Used
- **Programming Language**: Python
- **Databases**: MySQL
- **Libraries**: pandas, numpy, sqlalchemy, mysql-connector-python
- **Environment**:  Jupyter Notebook
- **Data Source**: Kaggle API

---

## Project Steps

### **1. Set Up the Environment**
- Install and configure **Jupyter Notebook** for development.
- Organize project folders for structured development and data handling.

### **2. Set Up Kaggle API**
- Obtain your Kaggle API token from your Kaggle **profile settings**.
- Place the `kaggle.json` file in the `.kaggle/` directory.
- Use the command:
  ```sh
  kaggle datasets download -d <dataset-path>
  ```
  to download datasets directly.

### **3. Download Walmart Sales Data**
- **Source**: Kaggle
- **Dataset Link**: [Walmart Sales Dataset](https://www.kaggle.com/)
- **Storage**: Save the data in the `data/` folder.

### **4. Install Required Libraries and Load Data**
Install necessary libraries:
```sh
pip install pandas numpy sqlalchemy mysql-connector-python psycopg2
```
Read data into a Pandas DataFrame for analysis.

### **5. Explore the Data**
- Conduct an initial exploration using:
  ```python
  df.info()
  df.describe()
  df.head()
  ```
- Check data distribution, column types, and potential issues.

### **6. Data Cleaning**
- **Remove Duplicates**: Drop duplicate entries to avoid skewed results.
- **Handle Missing Values**: Drop or fill missing values where necessary.
- **Fix Data Types**: Convert date columns to `datetime`, prices to `float`, etc.
- **Currency Formatting**: Use `.replace()` to format currency values.
- **Validation**: Check for inconsistencies and verify cleaned data.

### **7. Feature Engineering**
- Create a new column **Total Amount**:
  ```python
  df['total_amount'] = df['unit_price'] * df['quantity']
  ```
- Enhance dataset for further SQL analysis.

### **8. Load Data into MySQL**
- **Set Up Connections**: Connect Python to MySQL using `sqlalchemy`.
- **Table Creation**: Automate table creation and data insertion.
- **Verification**: Run SQL queries to confirm successful data upload.

### **9. SQL Analysis: Complex Queries & Business Insights**
- Execute advanced SQL queries to analyze:
  - **Revenue trends** across branches and categories.
  - **Best-selling product categories**.
  - **Sales performance** by time, city, and payment method.
  - **Peak sales periods** and customer buying patterns.
  - **Profit margin analysis** by branch and category.

### **10. Project Publishing & Documentation**
- Maintain structured documentation using Markdown/Jupyter Notebook.
- Publish project on GitHub with:
  - `README.md` (this document)
  - SQL query scripts
  - Jupyter Notebooks (if applicable)
  - Data files (or steps to access them)

---

## Requirements
### **Software & Tools**
- Python 3.8+
- MySQL

### **Python Libraries**
```sh
pip install pandas numpy sqlalchemy mysql-connector-python psycopg2
```

### **Kaggle API Setup**
- Obtain a **Kaggle API Key** for downloading datasets.

---


