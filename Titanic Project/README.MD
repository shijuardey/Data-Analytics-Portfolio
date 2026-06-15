# 🚢 Titanic Survival Analysis

![Excel](https://img.shields.io/badge/Tool-Microsoft%20Excel-217346?style=flat&logo=microsoft-excel&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=flat)
![Dataset](https://img.shields.io/badge/Records-418%20Passengers-blue?style=flat)

> An exploratory data analysis of Titanic passenger records examining how gender, passenger class, age, and embarkation port influenced survival outcomes.

---

## 📋 Table of Contents

- [Project Overview](#-project-overview)
- [Dataset Description](#-dataset-description)
- [Data Cleaning & Preparation](#-data-cleaning--preparation)
- [Key Findings](#-key-findings)
- [Dataset Columns](#-dataset-columns)
- [Data Quality](#-data-quality)
- [File Structure](#-file-structure)
- [How to Use](#-how-to-use)
- [Author](#-author)

---

## 📌 Project Overview

This project analyses passenger data from the RMS Titanic to uncover patterns in survival rates across demographic and socioeconomic groups. The dataset covers **418 passengers** and explores questions such as:

- Did gender significantly affect chances of survival?
- Did wealthier (1st class) passengers survive at higher rates?
- How did age category influence survival?
- Which embarkation port had the most passengers?

The analysis was performed entirely in **Microsoft Excel**, including data cleaning, feature engineering (age categorisation), and summary statistics.

---

## 📂 Dataset Description

| Property | Value |
|---|---|
| **Source** | Titanic passenger records |
| **Records** | 418 passengers |
| **Features** | 14 columns (including 2 engineered) |
| **Tool** | Microsoft Excel (.xlsx) |
| **Survival Rate** | 36.4% (152 survived / 266 did not) |

### Passenger Class Breakdown

| Class | Count | Survival Rate |
|---|---|---|
| 1st Class | 107 | 46.7% |
| 2nd Class | 93 | 32.3% |
| 3rd Class | 218 | 33.0% |

### Embarkation Port Breakdown

| Port | Code | Count |
|---|---|---|
| Southampton | S | 270 |
| Cherbourg | C | 102 |
| Queenstown | Q | 46 |

---

## 🧹 Data Cleaning & Preparation

The following cleaning and transformation steps were applied in Excel:

1. **Age imputation** — 86 passengers had missing `Age` values. These were filled using the mean age per group, stored in the `Age_formatted` column, ensuring no record was excluded from age-based analysis.

2. **Age categorisation** — A new `Age_category` column was engineered to group passengers into four life-stage segments:

| Category | Age Range | Count |
|---|---|---|
| Teenager | 0–17 | 61 |
| Youth | 18–35 | 266 |
| Adult | 36–55 | 77 |
| Elder | 56+ | 14 |

3. **Cabin handling** — The `Cabin` column has 327 missing values (78.2% null rate). It was retained in the dataset but excluded from primary analysis due to insufficient coverage.

4. **Fare** — 1 missing fare value was identified and treated as an isolated gap with no impact on aggregate analysis.

---

## 📊 Key Findings

### 1. Gender was the Strongest Survival Predictor
| Gender | Count | Survival Rate |
|---|---|---|
| Female | 152 | **100.0%** |
| Male | 266 | **0.0%** |

> In this test dataset, every recorded female passenger survived and no male passenger did — a stark reflection of the "women and children first" evacuation protocol.

### 2. First Class Passengers Had the Best Survival Odds
- **1st Class:** 46.7% survival rate
- **2nd Class:** 32.3% survival rate
- **3rd Class:** 33.0% survival rate

First-class passengers had significantly better access to lifeboats and were housed closer to the upper deck.

### 3. Elder Passengers Survived at the Highest Rate by Age
| Age Category | Survival Rate |
|---|---|
| Elder (56+) | **50.0%** |
| Teenager (0–17) | 45.9% |
| Youth (18–35) | 34.6% |
| Adult (36–55) | 32.5% |

### 4. Southampton Was the Dominant Embarkation Port
Southampton accounted for **64.6%** of all passengers (270 out of 418), followed by Cherbourg (24.4%) and Queenstown (11.0%).

### 5. Wide Fare Disparity Reflects Class Divide
| Metric | Fare (£) |
|---|---|
| Minimum | £0.00 |
| Median | £14.45 |
| Mean | £35.63 |
| Maximum | £512.33 |

The maximum fare (£512.33) is over 35x the median — highlighting the extreme socioeconomic spread among passengers.

---

## 📋 Dataset Columns

| Column | Type | Description |
|---|---|---|
| `PassengerId` | Integer | Unique passenger identifier |
| `Survived` | Integer | Survival status: 1 = Survived, 0 = Did not survive |
| `Pclass` | Integer | Ticket class: 1 = 1st, 2 = 2nd, 3 = 3rd |
| `Name` | String | Full name of the passenger |
| `Sex` | String | Gender: male / female |
| `Age` | Float | Age in years (86 nulls) |
| `Age_formatted` | Float | Age with nulls filled via group mean imputation |
| `Age_category` | String | Engineered: Teenager / Youth / Adult / Elder |
| `SibSp` | Integer | Number of siblings/spouses aboard |
| `Parch` | Integer | Number of parents/children aboard |
| `Ticket` | String | Ticket number |
| `Fare` | Float | Passenger fare paid (1 null) |
| `Cabin` | String | Cabin number (327 nulls — 78.2% missing) |
| `Embarked` | String | Port of embarkation: C = Cherbourg, Q = Queenstown, S = Southampton |

---

## ✅ Data Quality

| Column | Missing Values | Missing % | Action Taken |
|---|---|---|---|
| Age | 86 | 20.6% | Imputed via group mean → `Age_formatted` |
| Fare | 1 | 0.2% | Retained; negligible impact |
| Cabin | 327 | 78.2% | Excluded from analysis |
| All others | 0 | 0% | No action required |

---

## 🗂 File Structure

```
titanic-analysis/
│
├── Titanic.xlsx          # Main dataset and analysis workbook
└── README.md             # Project documentation (this file)
```

---

## 🚀 How to Use

1. **Clone or download** this repository
2. Open `Titanic.xlsx` in Microsoft Excel (2016 or later recommended)
3. Navigate the sheets to explore the raw data, cleaned columns, and summary findings
4. Filter by `Pclass`, `Sex`, `Age_category`, or `Embarked` to explore survival patterns interactively

---

## 👤 Author

**Enikansakin Sijuade Sunday**
📧 Waves952@gmail.com
🔗 [LinkedIn](https://www.linkedin.com/in/sijuade-enikansakin-936110355)

---

*This project is part of a data analytics portfolio demonstrating skills in data cleaning, feature engineering, and exploratory analysis using Excel.*
