Got it! Here's the updated version of the README with a section referencing the `cleaning.do` file to document the data cleaning process:

---

# Family Income, Entrepreneurship, and Social Mobility: A Double Machine Learning with Instrument Variable (DML-IV) Approach

This repository presents an empirical analysis building on the work of **Lin et al. (2020)**, using a **Double Machine Learning (DoubleML)** framework with instrumental variables to investigate a central question:  
**How do entrepreneurship and family income background shape intergenerational income mobility?**

> 📘 **Course Project**  
> This project is the final assignment for the course *Measuring Treatment Effects with Causal Machine Learning Techniques* (Spring 2024), offered by the **Graduate Institute of Public Affairs**, **National Taiwan University**.

## 🧠 Overview

Intergenerational mobility—particularly the ability to move beyond one’s childhood income class—is a central concern in the study of inequality. Lin et al. (2020) argue that entrepreneurship can serve as a pathway for upward mobility, especially for individuals from low-income backgrounds. However, endogeneity and selection bias complicate causal interpretation.

This study addresses those limitations by applying a **DoubleML framework with instrumental variables (IV-DML)** to estimate the causal effects of:
- Early-life income strata (`strata_young`)
- Entrepreneurial status (`is_entrepreneur`)
- Their interaction term (`T1T2`)

## 📂 Data

This analysis uses data from the **2017 Taiwan Social Change Survey**.  
> ⚠️ **Data Availability**: The dataset used in this project is **not publicly available** due to privacy and licensing constraints.

> 🧹 **Data Cleaning**:  
> The full data cleaning pipeline is documented in the Stata script `cleaning.do`, which includes variable selection, construction of treatment and outcome variables, and preprocessing steps for machine learning compatibility.

## ⚙️ Methodology

We implement an **Instrumental Variable Double Machine Learning (IV-DML)** approach to estimate the causal effects of early-life income and entrepreneurship on adult income. The model is built using Python with `DoubleML` (v0.9.3), applying **K-fold cross-validation** to tune nuisance models.

The partially linear IV model includes three endogenous treatments—**early-life income strata** (`strata_young`), **entrepreneurship** (`is_entrepreneur`), and their **interaction** (`T1T2`)—instrumented using **father’s education** (`f_edu`). Covariates include demographics and family background factors.

## 💻 Environment

- **Python**: 3.11.11  
- **DoubleML**: 0.9.3  
- **scikit-learn**: 1.6.1  
- **Stata**: for data preprocessing (`cleaning.do`)

## 📊 Key Findings

- **Early-life income strata (`strata_young`)** has a statistically significant *positive* causal effect on adult income strata (p = 0.0026), supporting the **class reproduction thesis**: early advantages persist into adulthood.
- **Entrepreneurship (`is_entrepreneur`)** has *no significant effect* (p = 0.605), suggesting self-employment does not systematically enhance intergenerational mobility once confounding is addressed.
- **Interaction term (`T1T2`)**—testing whether entrepreneurship moderates family background effects—also lacks statistical significance (p = 0.829).

These findings contrast with Lin et al. (2020), who report a **positive effect of entrepreneurship** and a **negative interaction**, suggesting entrepreneurship disproportionately benefits individuals from disadvantaged backgrounds. Using a more robust IV-DML framework, this analysis **challenges that optimistic view**.

## 📄 Output

Refer to the following files for full documentation:
- `doubleML_entrepreneurship.ipynb`

These include:
- Data preprocessing
- Model Selection
- Model results with confidence intervals

## 📜 License

MIT License. See `LICENSE` for details.
