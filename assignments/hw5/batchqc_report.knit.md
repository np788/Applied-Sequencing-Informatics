---
title: "BatchQC Report"
date: "2021-03-22"
output: 
  html_vignette:
    toc: true
    toc_depth: 2
    template: batchQC.html
    self_contained: no
    lib_dir: libs
---


Summary
=======
## Confounding
### Number of samples in each Batch and Condition

---------------------------------------------------
       &nbsp;          Batch A   Batch B   Batch C 
--------------------- --------- --------- ---------
 **Condition Ctrl**       1         1         1    

 **Condition siRNA**      1         1         1    
---------------------------------------------------

### Measures of confounding between Batch and Condition

----------------------------------------------------------------------
            &nbsp;                Standardized Pearson     Cramer's V 
                                 Correlation Coefficient              
------------------------------- ------------------------- ------------
  **Confounding Coefficients                0                  0      
 (0=no confounding, 1=complete                                        
        confounding)**                                                
----------------------------------------------------------------------

## Variation Analysis
### Variation explained by Batch and Condition
![](/Users/parghi/Downloads/asi/hw5/batchqc_signature_data_report_files/figure-html/unnamed-chunk-4-1.png)<!-- -->


----------------------------------------------------------
   &nbsp;      Full (Condition+Batch)   Condition   Batch 
------------- ------------------------ ----------- -------
  **Min.**             0.109                0         0   

 **1st Qu.**           60.71              3.863     26.05 

 **Median**            78.44              15.71     50.19 

  **Mean**             72.36              23.76     48.6  

 **3rd Qu.**           88.48              37.99     70.85 

  **Max.**              100               99.46     99.75 
----------------------------------------------------------

## P-value Analysis
### Distribution of Batch and Condition Effect p-values Across Genes

--------------------------------------------------------------------------------------
         &nbsp;           Min.   1st Qu.   Median    Mean    3rd Qu.   Max.   Ps<0.05 
------------------------ ------ --------- -------- -------- --------- ------ ---------
   **Batch P-values**      0     0.1626    0.3122   0.3761   0.5614     1     0.06209 

 **Condition P-values**    0     0.1622    0.3712   0.4182   0.6545     1     0.07477 
--------------------------------------------------------------------------------------

![](/Users/parghi/Downloads/asi/hw5/batchqc_signature_data_report_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

![](/Users/parghi/Downloads/asi/hw5/batchqc_signature_data_report_files/figure-html/unnamed-chunk-8-1.png)<!-- -->


Differential Expression
=======================
## Expression Plot
Boxplots for all values for each of the samples and are colored by batch membership.

![](/Users/parghi/Downloads/asi/hw5/batchqc_signature_data_report_files/figure-html/unnamed-chunk-10-1.png)<!-- -->

## LIMMA

```
## Warning: Zero sample variances detected, have been offset away from zero
```


----------------------------------------------------------------------------------------------------
       &nbsp;          Condition: siRNA (logFC)   AveExpr     t       P.Value    adj.P.Val     B    
--------------------- -------------------------- --------- -------- ----------- ----------- --------
 **ENSG00000102317**            -516.7             1030     -49.55   4.563e-05     0.29      -4.526 

 **ENSG00000035862**            -3175              5957     -46.08   5.548e-05     0.29      -4.526 

 **ENSG00000164379**            -394.7             497.3    -44.68   6.03e-05      0.29      -4.526 

 **ENSG00000142798**             -464              1645     -37.02     1e-04      0.3609     -4.526 

 **ENSG00000175130**             -330              829.7    -32.64   0.0001403    0.4049     -4.526 

 **ENSG00000196154**            -2327              3756     -29.63   0.0001821    0.4379     -4.526 

 **ENSG00000069482**            -433.7             932.2    -23.26   0.0003485    0.5099     -4.526 

 **ENSG00000120899**            -203.7             230.5    -23.2    0.000351     0.5099     -4.526 

 **ENSG00000100353**            -1501              1188     -20.84   0.0004685    0.5099     -4.526 

 **ENSG00000048052**            -285.7             348.5    -20.66   0.000479     0.5099     -4.526 
----------------------------------------------------------------------------------------------------


Median Correlations
===================
This plot helps identify outlying samples.
![](/Users/parghi/Downloads/asi/hw5/batchqc_signature_data_report_files/figure-html/unnamed-chunk-13-1.png)<!-- -->


Heatmaps
========
## Heatmap
This is a heatmap of the given data matrix showing the batch effects and variations with different conditions.
![](/Users/parghi/Downloads/asi/hw5/batchqc_signature_data_report_files/figure-html/unnamed-chunk-15-1.png)<!-- -->

## Sample Correlations
This is a heatmap of the correlation between samples.
![](/Users/parghi/Downloads/asi/hw5/batchqc_signature_data_report_files/figure-html/unnamed-chunk-16-1.png)<!-- -->


Circular Dendrogram
===================
This is a Circular Dendrogram of the given data matrix colored by batch to show the batch effects.
![](/Users/parghi/Downloads/asi/hw5/batchqc_signature_data_report_files/figure-html/unnamed-chunk-18-1.png)<!-- -->


PCA: Principal Component Analysis
=================================
## PCA
This is a plot of the top two principal components colored by batch to show the batch effects.
![](/Users/parghi/Downloads/asi/hw5/batchqc_signature_data_report_files/figure-html/unnamed-chunk-20-1.png)<!-- -->

## Explained Variation

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 &nbsp;    Proportion of Variance (%)   Cumulative Proportion of   Percent Variation Explained by   Percent Variation Explained by   Condition Significance   Percent Variation Explained by   Batch Significance (p-value) 
                                              Variance (%)           Either Condition or Batch                Condition                    (p-value)                      Batch                                             
--------- ---------------------------- -------------------------- -------------------------------- -------------------------------- ------------------------ -------------------------------- ------------------------------
 **PC1**             49.64                       49.64                          75.7                             6.1                         0.5512                        69.6                           0.2585            

 **PC2**             22.44                       72.07                          98.1                             91.1                       0.01048                         7                             0.2174            

 **PC3**             11.15                       83.22                          82.8                              0                          0.9608                        82.7                           0.1725            

 **PC4**             10.12                       93.34                          18.7                             2.8                         0.819                          16                            0.8358            

 **PC5**             6.658                        100                           24.7                              0                          0.9844                        24.7                           0.7528            

 **PC6**           3.488e-29                      100                           86.1                             3.1                         0.5731                         83                            0.1431            
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Shape
=====
This is a heatmap plot showing the variation of gene expression mean, variance, skewness and kurtosis between samples grouped by batch to see the batch effects variation









