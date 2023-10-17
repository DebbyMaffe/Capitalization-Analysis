# Capitalization-Analysis

**Euro Area Banks' Capitalization Analysis** (2016-2021).

The dataset used for the project has been taken from **BankFocus**. Let's explain the **characteristic** of each variable:
-   ***company*** : company name Latin alphabet
-   ***country*** : country where company is domiciled (Euro area)
-   ***consolidation_code*** : attribute used to group similar object levels into categories for reporting

    -   *C1 :* statement of a mother bank integrating the statements of its controlled subsidiaries or branches with no unconsolidated companion
    -   *C2 :* statement of a mother bank integrating the statements of its controlled subsidiaries or branches with an unconsolidated
    -   *U1 :* statement not integrating the statements of the possible controlled subsidiaries or branches of the concerned bank with no consolidated companion.
    -   *U2 :* statement not integrating the statements of the possible controlled subsidiaries or branches of the concerned bank with an consolidated companion.

-   ***specialization*** :
    -   *Commercial banks :* offer basic banking services, including deposit accounts and loans, to consumers and small to midsize businesses;
    -   *Investment banks :* specialize in managing complex financial transactions such as IPOs and mergers for corporate clients.

-   ***RWAs*** : Other risk-weighted assets (RWAs)
-   ***RWAs_over_totAssets*** : Risk weighted asset intensity (RWA / Total Assets) (%)
-   ***totEquity_over_RWAs*** : Total equity / Risk-weighted assets (RWAs) (%)
-   ***totAssets*** : Total Assets
-   ***totEquity*** : Total Equity
-   ***Basel3_leverage_ratio*** : Basel III leverage ratio (%)
-   ***Tier1*** : Tier 1 Capital
-   ***Tier1_ratio*** : Tier 1 ratio (%)
-   ***Tier2*** : Tier 2
-   ***level3assets_over_CET1*** : Level 3 assets / Common Equity Tier 1 (CET1) capital
-   ***totEquity_over_RWAs*** : Total equity / Risk-weighted assets (RWAs) (%)
-   ***commonEquity_over_coreTier1_ratio*** : Common Equity / Core Tier 1 ratio (Basel III) (%)
-   ***commonEquity*** : Common Equity
-   ***retainedEarnings*** : Retained Earnings
-   ***otherComprIncome*** : Other Comprehensive Income
-   ***RWAs_growth*** : Growth in Risk Weighted Assets (%)
-   ***CET1_growth*** : Growth in CET1 (%)
-   ***commonEquity_over_CET1*** : Common Equity / Core Tier 1
-   ***totCapRatio*** : Total Capital Ratio.

The first step of the analysis include *filtering* our data and *choosing* the [consolidation]{.underline} [code]{.underline} that would provide us the best sample of accounts. Considering the time frame 2016 - 2021, let's inspect the observations based on the assessment of three main accounts: ***Revenue***, ***Total Assets*** and ***Equity*** capital. By calculating the total amount of each account, we can notice that the banks presenting the consolidated accounts with an unconsolidated companion, show the ***greatest*** results in the *size* assessment. For this reason, let's decide to filter our data by considering the **C2** Consolidation Code. Regarding the specialisation, let's focus our analysis on the most common type of institutions, which are ***Commercial*** and ***Investment*** banks.

Performing a *generic* capitalization analysis firstly, then continue with splitting the analysis according to three factors: ***Specialisation***, ***Country***, and ***Size***.

Once we analyzed the behavior of the main accounts such as *Total Equity*, *Total Assets*, *Retained Earnings* and *Other Comprehensive Income*, let's proceed by evaluating the:

-   ***Basel III Leverage Ratio***, in order to assess the ability of a company to *meet* its financial obligations;
-   ***TIER1 Ratio***, revealing the ability to *absorb* a reasonable amount of losses *without* risk of failure;
-   ***Total Capital Ratio***, showing the *stability* and *efficiency* of the bank's financial system;
-   ***CET1 Ratio***, meaning the ability of a bank to *withstand* financial distress.
