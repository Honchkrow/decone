#' @title Compute regression Metrics for matrix results.
#'
#' @description Compute several regression Metrics for cell type deconcolution.
#'
#' @param actual The groundcloth proportion of cell types in matrix.
#' row: cell types, column: samples.
#' @param predicted The predicted proportion of cell types in matrix.
#' row: cell types, column: samples.
#' @param method One of c("rmse", "mape", "mae", "kendall", "pearson", "spearman"),
#' @param type One of c("sample.", "celltype", "all").
#' For "sample.", generate metric for each sample.
#' For "celltype", generate metric for each cell type.
#' For "all", generate metric for all data, which means flattening all data into an vector.
#' Note: for mape, cell types with read proportion 0 will be ignored.
#'
#' @return a vector with the value for each sample.
#'
#' @importFrom Metrics rmse mape mae
#' @importFrom stats cor
#'
#' @export
#'
#' @examples
#' res <- regMetrics(actual = matrix(data = seq(9), nrow = 3),
#'                   predicted = matrix(data = seq(9), nrow = 3),
#'                   method = "rmse")
regMetrics <- function(actual, predicted, method = NULL, type = NULL) {
    if (!all(dim(actual) == dim(predicted))) {
        stop("Dimension of matrix actual and predicted are inconsistent.")
    } else {
        num_celltype <- nrow(actual)
        num_sample <- ncol(actual)
    }

    res <- c()

    if (type == "sample") {
        if (method == "rmse") {
            for (i in seq(num_sample)) {
                res <- c(res, rmse(actual = actual[, i], predicted = predicted[, i]))
            }
            names(res) <- colnames(actual)

        } else if (method == "mape") {
            for (i in seq(num_sample)) {
                tmp_x <- actual[, i]
                tmp_y <- predicted[, i]
                idx <- which(tmp_x > 0)
                res <- c(res, mape(actual = tmp_x[idx], predicted = tmp_y[idx]))
            }
            names(res) <- colnames(actual)

        } else if (method == "mae"){
            for (i in seq(num_sample)) {
                res <- c(res, mae(actual = actual[, i], predicted = predicted[, i]))
            }
            names(res) <- colnames(actual)

        } else if (method %in% c("pearson", "kendall", "spearman")){
            for (i in seq(num_sample)) {
                res <- c(res, cor(x = actual[, i], y = predicted[, i], method = method))
            }
            names(res) <- colnames(actual)

        } else {
            stop("Parameter 'method' is invalid.")

        }

    } else if (type == "celltype") {
        if (method == "rmse") {
            for (i in seq(num_celltype)) {
                res <- c(res, rmse(actual = actual[i, ], predicted = predicted[i, ]))
            }
            names(res) <- rownames(actual)

        } else if (method == "mape") {
            for (i in seq(num_celltype)) {
                tmp_x <- actual[i, ]
                tmp_y <- predicted[i, ]
                idx <- which(tmp_x > 0)
                res <- c(res, mape(actual = tmp_x[idx], predicted = tmp_y[idx]))
            }
            names(res) <- rownames(actual)

        } else if (method == "mae"){
            for (i in seq(num_celltype)) {
                res <- c(res, mae(actual = actual[i, ], predicted = predicted[i, ]))
            }
            names(res) <- rownames(actual)

        } else if (method %in% c("pearson", "kendall", "spearman")){
            for (i in seq(num_celltype)) {
                res <- c(res, cor(x = actual[i, ], y = predicted[i, ], method = method))
            }
            names(res) <- rownames(actual)

        } else {
            stop("Parameter 'method' is invalid.")

        }

    } else if (type == "all") {
        actual <- as.vector(actual)
        predicted <- as.vector(predicted)
        if (method == "rmse") {
            res <- c(res, rmse(actual = actual, predicted = predicted))

        } else if (method == "mape") {
            tmp_x <- actual
            tmp_y <- predicted
            idx <- which(tmp_x > 0)
            res <- c(res, mape(actual = tmp_x, predicted = tmp_y))

        } else if (method == "mae"){
            res <- c(res, mae(actual = actual, predicted = predicted))

        } else if (method %in% c("pearson", "kendall", "spearman")){
            res <- c(res, cor(x = actual, y = predicted, method = method))

        } else {
            stop("Parameter 'method' is invalid.")

        }

    } else {
        stop("Parameter type must be 'sample', 'celltype' or 'all'!")

    }

    return(res)
}
