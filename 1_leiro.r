library(collections)

data_set <- read.csv("data/social-media.csv", stringsAsFactors = FALSE)

pretty_names <- dict()
pretty_names[["age"]] <- "Age"
pretty_names[["gender"]] <- "Gender"
pretty_names[["time_spent"]] <- "Time Spent (hours/day)"
pretty_names[["platform"]] <- "Platform"
pretty_names[["income"]] <- "Income (USD)"
pretty_names[["indebt"]] <- "Indebted"
pretty_names[["isHomeOwner"]] <- "Home Owner"
pretty_names[["Owns_Car"]] <- "Owns Car"

variables <- names(data_set)
types <- sapply(data_set, class)

quantitative_variables <- c("age", "time_spent", "income")
qualitative_variables <-
  c("gender", "platform", "indebt", "isHomeOwner", "Owns_Car")

quant_stats <- lapply(data_set[quantitative_variables], function(x) {
  x <- as.numeric(x)
  q <- quantile(x, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)
  c(
    min = q[1],
    Q1 = q[2],
    median = q[3],
    mean = mean(x, na.rm = TRUE),
    Q3 = q[4],
    max = q[5]
  )
})

cat("Quantitative summary (min, Q1, median, mean, Q3, max):\n")
print(as.data.frame(quant_stats))

for (variable in quantitative_variables) {
  png(paste("1", variable, "boxplot.png", sep = "_"), width = 400, height = 600)
  boxplot(
    data_set[[variable]],
    main = pretty_names[[variable]],
    ylab = pretty_names[[variable]],
    outline = FALSE
  )
  dev.off()
}

for (variable in qualitative_variables) {
  png(paste("1", variable, "barplot.png", sep = "_"), width = 400, height = 600)
  freq <- table(data_set[[variable]])
  bp <- barplot(
    freq,
    main = pretty_names[[variable]],
    xlab = pretty_names[[variable]],
    ylab = "Frequency",
    ylim = c(0, max(freq) * 1.3)
  )
  text(bp, freq, labels = freq, pos = 3)
  dev.off()
}

cat("Finished\n")
