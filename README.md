# Family Income, Entrepreneurship, and Social Mobility: A Double Machine Learning with Instrument Variable (DML-IV) Approach

This repository presents an empirical analysis building on the work of **Lin et al. (2020)**, using a **Double Machine Learning (DoubleML)** framework with instrumental variables to investigate one of the key question in the work:  
**How do entrepreneurship and family income background shape intergenerational income mobility?**

## 📘 Overview

Intergenerational mobility—particularly the ability to move beyond one’s childhood income class—is a central concern in the study of inequality. Lin et al. (2020) argue that entrepreneurship can serve as a pathway for upward mobility, particularly for individuals from low-income backgrounds. However, issues of endogeneity and selection bias complicate causal interpretation.

This study addresses those limitations by applying a **DoubleML framework with instrumental variables (IV-DML)** to estimate the causal effects of:
- Early-life income strata (`strata_young`)
- Entrepreneurial status (`is_entrepreneur`)
- Their interaction term (`T1T2`)

## 🧠 Methodology

This study applies an **Instrumental Variable Double Machine Learning (IV-DML)** approach to estimate the causal effects of early-life income and entrepreneurship on adult income, using data from the **2017 Taiwan Social Change Survey**. The model is implemented in Python with `DoubleML` (v0.9.3), using **K-fold cross-validation** to tune machine learning models for nuisance functions.

The partially linear IV model includes three endogenous treatments—**early-life income strata** (`strata_young`), **entrepreneurship** (`is_entrepreneur`), and their **interaction**—instrumented by **father’s education** (`f_edu`). Controls include demographic and family background variables. Instrument relevance was validated via OLS. Best-performing models selected by cross-validated MSE:

These models were integrated into the `DoubleMLPLIV` estimator for causal inference.


## 💻 Environment

- **Python**: 3.11.11  
- **DoubleML**: 0.9.3  
- **scikit-learn**: 1.6.1  

## 📊 Key Findings

- **Early-life income strata (`strata_young`)** has a statistically significant positive causal effect on adult income strata (p = 0.0026), reinforcing the **class reproduction thesis**: advantages in early life persist into adulthood.
- **Entrepreneurship (`is_entrepreneur`)** shows no statistically significant effect (p = 0.605), suggesting that self-employment does not systematically improve intergenerational mobility once confounding is controlled for.
- **Interaction term (`T1T2`)**—measuring whether entrepreneurship modifies the effect of family background—also lacks statistical significance (p = 0.829).

These results contrast with Lin et al. (2020), who reported a **positive effect of entrepreneurship** and a **negative interaction** (implying entrepreneurship especially benefits those from lower-income families). Our analysis, using a more robust IV-DML framework, **challenges that optimistic view**.

## 📄 Output

See `doubleML_entrepreneurship.ipynb` or `doubleML_entrepreneurship.html`for the full report, including:
- Data preparation and feature construction
- Estimation results and confidence intervals
- Robustness checks and model diagnostics

## ✍️ Author

This project is part of a broader research initiative on causal inference and structural inequality using modern statistical learning.

## 📜 License

MIT License. See `LICENSE` for more details.
