# m6APrediction

## Introduction
**m6APrediction** is an R package designed for predicting m6A modification sites in RNA sequences. This tool provides advanced algorithms aimed at assisting researchers in bioinformatics and genomics analyses to identify RNA modification sites.

## Installation
To install the package from GitHub, you can use the following commands:

```r  
# Using devtools  
devtools::install_github("Yuhui-xjtlu/m6APrediction")  

# Or using remotes  
remotes::install_github("Yuhui-xjtlu/m6APrediction") 


函数
1. DNA 编码函数
此函数将 DNA 序列编码为数值格式。

用法
```r
encoded_seq <- dna_encoding(c("ATCG", "GCTA"))
参数：
dna_strings: 一个 DNA 字符串的向量。
返回：一个包含编码序列的数据框。
2. 多样本预测函数
此函数基于输入特征预测多个样本的结果。

用法
```r
rf_fit <- readRDS(system.file("extdata", "rf_fit.rds", package="m6APrediction"))
example_df <- read.csv(system.file("extdata", "m6A_input_example.csv", package="m6APrediction"))
predictions <- prediction_multiple(example_df)
参数：
input_data: 包含预测特征的数据框。
返回：一个包含每个样本预测结果的数据框。
3. 单样本预测函数
此函数基于输入特征预测单个样本的结果。

用法
```r
result <- prediction_single(c(0.5, 1, 0.3))
参数：
single_input: 单个样本的特征向量。
返回：该样本的预测结果
