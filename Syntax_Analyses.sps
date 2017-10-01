* Encoding: UTF-8.

*** Apply proper exclusions***

DATASET ACTIVATE DataSet1.
USE ALL.
COMPUTE filter_$=(EXCLUDEFINAL ~= '1').
VARIABLE LABELS filter_$ "EXCLUDEFINAL ~= '1' (FILTER)".
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

*** View results for Main Experiment, Replication 1, Replication 2 seperately***

SORT CASES  BY STUDY.
SPLIT FILE SEPARATE BY STUDY.

***ANALYSIS: "TABLE 1. Correlations between implicit causality object-bias and 
binding values as well as individualizing values across harm/force and filler verbs" ***

CORRELATIONS
  /VARIABLES=BINDING INDIVIDUALIZING Harmforce_IClogtran COERCED_IC ENSLAVED_IC FORCED_IC 
    INFLUENCED_IC KILLED_IC MANIPULATED_IC RAPED_IC ROBBED_IC STABBED_IC STRANGLED_IC TEMPTED_IC 
    CLOBBERED_IC Fillers_IClogtran_SHARED10 DELIGHTED_IC IMPRESSED_IC SKIPPED_IC APPROACHED_IC 
    OBSERVED_IC TRANSPORTED_IC QUOTED_IC THANKED_IC CONGRATULATED_IC PRAISED_IC
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

***ANALYSES: "Table 2. Results of regression analyses examining the relationships 
between value clusters (binding values and individualizing values) and 
(2a) implicit causality object-bias and (2b) explicit causal judgments for 
harm/force events and filler events." ***

***2a***

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Harmforce_IClogtran
  /METHOD=ENTER BINDING INDIVIDUALIZING POLITICS GENDER RELIGION.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Fillers_IClogtran_SHARED10
  /METHOD=ENTER BINDING INDIVIDUALIZING POLITICS GENDER RELIGION.

***2b***

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Harmforce_agentcont
  /METHOD=ENTER BINDING INDIVIDUALIZING POLITICS GENDER RELIGION.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Harmforceverbs_patientcont
  /METHOD=ENTER BINDING INDIVIDUALIZING POLITICS GENDER RELIGION.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Fillers_agentcont_SHARED10
  /METHOD=ENTER BINDING INDIVIDUALIZING POLITICS GENDER RELIGION.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Fillers_patientcont_SHARED10
  /METHOD=ENTER BINDING INDIVIDUALIZING POLITICS GENDER RELIGION.


***ANALYSES: "Table 3. Results of analyses examining implicit causality object-biases for 
harm/force and filler events, binding values and individualizing values, politics, religiosity, 
gender condition, and participant gender."***


GLM Harmforce_IClogtran Fillers_IClogtran_SHARED10 BY Condition_MVF1_FVM2 GENDER WITH BINDING 
    INDIVIDUALIZING POLITICS RELIGION
  /WSFACTOR=IC 2 Polynomial 
  /METHOD=SSTYPE(3)
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05)
  /DESIGN= Condition_MVF1_FVM2 GENDER BINDING INDIVIDUALIZING POLITICS RELIGION.

***Follow-up Analyses: repeated-measures ANOVAs with implicit causality object-bias 
for harm/force and filler events entered as the within-subjects dependent variable, and a 
between-subjects factor made by splitting participants into high and low binding 
values groups using a median-split" - See Figure 2: Significant interactions between binding values 
and implicit causality object-bias observed across studies: high binding values participants selected 
the object in the implicit causality task more often for harm/force verbs, but not filler verbs, 
compared to low binding values participants. ***

GLM Harmforce_IClogtran Fillers_IClogtran_SHARED10 BY BINDINGhilo
  /WSFACTOR=IC 2 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(BINDINGhilo) 
  /EMMEANS=TABLES(IC) 
  /EMMEANS=TABLES(BINDINGhilo*IC) 
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=IC 
  /DESIGN=BINDINGhilo.

***Follow-up Analyses: repeated-measures ANOVAs with implicit causality object-bias 
for harm/force and filler events entered as the within-subjects dependent variable, and 
and gender condition entered as the between subjects factor. - See Figure 3: Significant 
interactions between gender condition and implicit causality object bias observed across 
studies: when women harmed/forced men, implicit causality object-bias scores were 
higher compared to when men harmed/forced women ***

GLM Harmforce_IClogtran Fillers_IClogtran_SHARED10 BY Condition_MVF1_FVM2
  /WSFACTOR=IC 2 Polynomial 
  /METHOD=SSTYPE(3)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(IC) 
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=IC 
  /DESIGN=Condition_MVF1_FVM2.


***Correlations: TABLE 4 ***



CORRELATIONS
  /VARIABLES=BINDING INDIVIDUALIZING CONTAM INJURED Harmforce_IClogtran Fillers_IClogtran_SHARED10 
    Harmforce_agentcont Harmforceverbs_patientcont Fillers_agentcont_SHARED10 
    Fillers_patientcont_SHARED10
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


***Regression Analyses (pg 18) examining how implicit and explicit causality judgments factored into the relationship 
between moral values and victim injury and contamination ratings***

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT CONTAM
  /METHOD=ENTER BINDING INDIVIDUALIZING POLITICS GENDER RELIGION
  /METHOD=ENTER Harmforce_IClogtran Harmforce_agentcont Harmforceverbs_patientcont.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT INJURED
  /METHOD=ENTER BINDING INDIVIDUALIZING POLITICS GENDER RELIGION
  /METHOD=ENTER Harmforce_IClogtran Harmforce_agentcont Harmforceverbs_patientcont.
