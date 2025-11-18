#' DNA Encoding Function
#'
#' This function encodes DNA sequences into a numerical format.
#' @param dna_strings A vector of DNA strings.
#' @return A data frame containing the encoded sequences.
#' @examples
#' encoded_seq <- dna_encoding(c("ATCG", "GCTA"))
#' @import randomForest
#' @export
dna_encoding <- function(dna_strings) {
  nn <- nchar(dna_strings[1])
  seq_m <- matrix(unlist(strsplit(dna_strings, "")), ncol = nn, byrow = TRUE)
  colnames(seq_m) <- paste0("base_", 1:nn)
  seq_df <- as.data.frame(seq_m)
  return(seq_df)
}
#' Prediction for Multiple Samples
#'
#' This function predicts outcomes for multiple samples based on input features.
#' @param input_data A data frame of features for prediction.
#' @return A data frame with predictions for each sample.
#' @examples
#' rf_fit <- readRDS(system.file("extdata", "rf_fit.rds", package="m6APrediction"))
#' example_df <- read.csv(system.file("extdata", "m6A_input_example.csv", package="m6APrediction"))
#' predictions <- prediction_multiple(rf_fit, example_df, positive_threshold = 0.6)
#' @export
#' @import randomForest
prediction_multiple <- function(input_data) {
  stopifnot(all(c("gc_content", "RNA_type") %in% names(input_data)))

  # 假设 ml_model 是预先训练的模型
  inferred_prob <- predict(ml_model, newdata = input_data)
  input_data$predicted_probability <- inferred_prob
  return(input_data)
}
#' Prediction for a Single Sample
#'
#' This function predicts the outcome for a single sample based on input features.
#' @param single_input A vector of features for a single sample.
#' @return The predicted outcome for the sample.
#' @examples
#' rf_fit <- readRDS(system.file("extdata", "rf_fit.rds", package="m6APrediction"))
#' result <- prediction_single(c(0.5, 1, 0.3))
#' @export
#' @import randomForest
prediction_single <- function(single_input) {
  # 注意：这里的输入应符合模型所需的格式
  prediction <- predict(ml_model, newdata = data.frame(t(single_input)))
  return(prediction)
}
