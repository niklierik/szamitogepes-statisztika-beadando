library(collections)

data_set <- read.csv("data/social-media.csv", stringsAsFactors = FALSE)

# Választott változók: time_spent (eredmény), age (magyarázó)
# Nemlineáris regresszió: kvadratikus polinom

# Kimaradt minta: az első sor
train_data <- data_set[-1, ]
test_data <- data_set[1, ]

# Modell illesztése kvadratikus polinommal
model <- lm(time_spent ~ poly(age, 2), data = train_data)

cat("Nemlineáris regresszió modell (kvadratikus):\n")
print(summary(model))

# Predikció a kimaradt mintára
predicted <- predict(model, newdata = test_data)
actual <- test_data$time_spent
error <- abs(predicted - actual)

cat("\nPredikció:\n")
cat("Tényleges érték:", actual, "\n")
cat("Előrejelzett érték:", predicted, "\n")
cat("Abszolút eltérés:", error, "\n")

# Ábra
png("5_nemlin_regresszio_plot.png", width = 600, height = 400)
plot(train_data$age, train_data$time_spent, main = "Nemlineáris regresszió: time_spent ~ age^2", xlab = "Kor", ylab = "Eltöltött idő (óra/nap)", col = "blue", pch = 20)

# Illesztett görbe
age_seq <- seq(min(data_set$age), max(data_set$age), length.out = 100)
fitted_values <- predict(model, newdata = data.frame(age = age_seq))
lines(age_seq, fitted_values, col = "red", lwd = 2)

# Predikált pont jelölése
points(test_data$age, predicted, col = "green", pch = 17, cex = 2)
points(test_data$age, actual, col = "black", pch = 19, cex = 2)

legend("topright", legend = c("Tanuló adatok", "Illesztett görbe", "Előrejelzett pont", "Tényleges pont"), col = c("blue", "red", "green", "black"), pch = c(20, NA, 17, 19), lty = c(NA, 1, NA, NA))

dev.off()

cat("\nAz ábra mentésre került: 5_nemlin_regresszio_plot.png\n")
