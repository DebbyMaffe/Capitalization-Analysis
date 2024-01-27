# Capitalization-Analysis
**Euro Area Banks' Capitalization Analysis** (2016-2021) - University Group Project

## 01. INTRODUCTION

**DATA SOURCE AND CLEANING**

The dataset used for the project has been taken from **BankFocus**, collecting the **company** name, the **country** where the company is domiciled (Euro Area), the **consolidation code** used to group similar object levels into categories for reporting, and the industry-specific **specialisation**. 

We initiated our analysis by selecting the **C2 consolidation** code to optimize our account sample, focusing specifically on *commercial* and *investment* banks: commercial banks primarily contend with *credit risk*, while investment banks predominantly encounter *market risk*.  This decision was based on the assessment of three key accounts (*Revenue*, *Total Assets*, and *Equity Capital*) spanning from 2016 to 2021. Notably, banks with *consolidated* accounts, accompanied by an unconsolidated companion, demonstrated **superior** size assessment results in this specialized category.

To refine our analysis further, we *filtered* data based on the availability of accounts for each year, **minimizing** *missing* values attributable to non-existent accounts in specific years. Additionally, we employed the intersection of the six datasets (2016-2021) involving **183** commercial and investment banks for each year, enhancing the *comparability* of results across the specified period.

## 02. CAPITALIZATION ANALYSIS

Our analysis, centered on *capitalization*, acknowledges the distinctive **risk exposures** faced by different types of banks. Focusing on the euro area characterized by traditional banking practices, particularly in *loans*, *deposits*, and *bonds*, we observe that commercial banks derive **net** interest **income** from the spread between lending revenues and deposit-related expenses, making *credit risk* their primary concern. In contrast, investment banks predominantly engage with corporations and other banks, offering *financial advice*, operating as *risk-takers* in underwriting with guarantees, and providing *trading* and *selling* services. Although there is limited overlap in the services offered by both types of banks, according to our sample, the eurozone is marked by a prevalence of **commercial** banks.
Despite the prevalence of commercial banks, the presence of *investment* banks is crucial for **diversifying** funding sources and supporting the growth of companies in the euro area.

Transitioning to capitalization, graphs comparing banks based on specialization reveal that, although *commercial* banks are **larger**, *investment* banks tend to exhibit **higher** *total equity* relative to their size. While the gap between commercial and investment banks is narrowing, an **increase** in *Total Capital* and *Tier 1 capital* ratios for commercial banks is noted, indicating a **reduction** in risk-weighted assets *(RWAs)*.

Analyzing capitalization ratios (Tier 1, CET1, Total Capital, and Leverage), *investment* banks appear **better** capitalized at first glance. However, the small sample size and susceptibility to outliers prompt a closer examination. Evaluating compliance with Basel III thresholds, **68.5%** of commercial banks and **66.7%** of investment banks meet the minimum requirements, with a slight edge for commercial banks.
While the data distribution complicates a straightforward assessment, a general trend emerges: *commercial* banks in the sample **increased** their capitalization from 2016-2021, while *investment* banks display a **mix** of increases and decreases during the same period.

## 03. SIZE

The analysis of bank size reveals a notable **increase** in *large* banks and a **decrease** in *smaller* banks from 2016 to 2021, potentially driven by mergers and acquisitions aiming for increased market concentration and competitiveness. Moving to capitalization, despite **lower** average *ratios* (Tier 1, CET1, Total Capital, and Leverage) for larger banks, the data distribution *variation* is more pronounced for **very small** banks.

Contrary to expectations, although small and medium banks exhibit **higher** average *ratios*, the percentage of *compliance* with Basel III thresholds is **lower** compared to large banks. This discrepancy challenges the initial hypothesis that smaller banks are better capitalized. Examining boxplots for the Total Capital and Tier 1 ratios, we observe high variation and outliers in very small banks, contributing to data bias. Large banks maintain a **higher** percentage of *compliance* despite lower average ratio values.

In summary, although **smaller** *banks* show **higher** average values for Basel III *ratios*, **large** banks in the sample demonstrate better *capitalization*, as evidenced by a greater percentage of compliance with minimum thresholds.

## 04. COUNTRY

While *France* and *Spain* have the most banks in our sample, it's crucial to note that this *doesn't* necessarily reflect the total number of banks in the Euro Area. France leads due to a concentration of consolidated banks with unconsolidated companions, a trend influenced by our choice of the **C2** consolidation code, favoring larger banks. Examining bank sizes by country, we can infer that France, Germany, the Netherlands, and Spain as home to the *largest* banks, while Latvia, Finland, and Malta house *smaller* observations.

Delving into the variation of data distribution for Basel III ratios (Tier 1, CET1, Total Capital, and Leverage), specific countries exhibit noteworthy patterns. For the **Leverage Ratio**, variations stem from differences between *commercial* and *investment* banks (e.g., Greece, the Netherlands) and *outliers* (e.g., Ireland, Austria). Estonia and Malta showcase a different type of variance with movement across years. Despite high individual results, cautious inference is needed due to variations.

Analyzing the **CET1 ratio**, we observe *lower* variation, with outliers in Portugal and Greece impacting overall data diversity. Latvia and Lithuania present divergent results, emphasizing the importance of considering the sample size for accurate inference.

Exploring the **Tier 1 ratio**, countries like Germany and France demonstrate varying distribution, with outliers influencing results. While Italy and Spain show consistency for commercial banks, variations arise from outliers in investment banks.

For the **Total Capital Ratio**, Belgium, Portugal, Spain, and Greece display outliers, affecting average values. Estonia maintains high values, and Malta shows an increasing trend.

Thus, while specific countries exhibit identifiable patterns in Basel III ratios, generalizing conclusions for the entire euro area proves challenging. *Commercial* banks generally display **less volatile** values across countries, but nuanced variations call for cautious interpretation, especially with differences in sample *size* and *outliers* impacting results.

## 05. CONCLUSION

In summary, our analysis of capitalization in the 2016-2021 period indicates that, on average, the observations in our sample meet **Basel III** regulatory requirements well, suggesting ample buffers to absorb potential losses. However, the percentage of compliant banks is **68.3%**, which may seem lower than expected based solely on average ratio values. A more detailed analysis reveals an **increase** in *total equity* for all observations and compliant observations, showcasing *positive* trends. 

**Removing** the *CET1 ratio* as a compliance requirement increases the percentage of compliant banks to **83.6%**, indicating that some non-complying observations meet other ratio thresholds but fall short in common equity. Despite expectations for a higher compliance percentage, the overall conclusion is that banks in the euro area are generally sufficiently *capitalized*. Nevertheless, this statement requires careful consideration, emphasizing the need for a thorough analysis given the importance and binding nature of the Basel accord and the associated economic risks. 
