library(collections)

data_set <- read.csv("data/social-media.csv", stringsAsFactors = FALSE)

# Folytonos változók: age, time_spent, income
continuous_vars <- data_set[, c("age", "time_spent", "income")]

# Faktor analízis: 1 faktor (maximum likelihood)
fa_result <- factanal(continuous_vars, factors = 1)

cat("Faktor analízis eredménye (1 faktor):\n")
print(fa_result)

# Loadings
loadings <- fa_result$loadings[, 1]

cat("\nFaktor loadings:\n")
print(loadings)

# Ábra: loadings bar plot
png("6_faktor_analizis_plot.png", width = 600, height = 400)
barplot(loadings, main = "Faktor Loadings", xlab = "Változók", ylab = "Loading", names.arg = c("Kor", "Eltöltött idő", "Jövedelem"), col = "lightblue", ylim = c(-1, 1))
dev.off()

cat("\nAz ábra mentésre került: 6_faktor_analizis_plot.png\n")
