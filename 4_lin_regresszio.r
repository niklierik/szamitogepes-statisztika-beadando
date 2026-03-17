library(collections)

data_set <- read.csv("data/social-media.csv", stringsAsFactors = FALSE)

model1 <- lm(time_spent ~ age, data = data_set)
cat("Modell 1: time_spent ~ age\n")
print(summary(model1))
cat("R-squared:", summary(model1)$r.squared, "\n")
cat("AIC:", AIC(model1), "\n\n")

model2 <- lm(time_spent ~ income, data = data_set)
cat("Modell 2: time_spent ~ income\n")
print(summary(model2))
cat("R-squared:", summary(model2)$r.squared, "\n")
cat("AIC:", AIC(model2), "\n\n")

model3 <- lm(time_spent ~ age + income, data = data_set)
cat("Modell 3: time_spent ~ age + income\n")
print(summary(model3))
cat("R-squared:", summary(model3)$r.squared, "\n")
cat("AIC:", AIC(model3), "\n\n")

# Összehasonlítás
cat("Összehasonlítás:\n")
cat("Model 1 R-squared:", summary(model1)$r.squared, "AIC:", AIC(model1), "\n")
cat("Model 2 R-squared:", summary(model2)$r.squared, "AIC:", AIC(model2), "\n")
cat("Model 3 R-squared:", summary(model3)$r.squared, "AIC:", AIC(model3), "\n")

png("4_model1_plot.png", width = 600, height = 400)
plot(
    data_set$age, data_set$time_spent,
    main = "Eltöltött idő vs Kor", xlab = "Kor",
    ylab = "Eltöltött idő (óra/nap)"
)
abline(model1, col = "red", lwd = 2)
dev.off()

png("4_model2_plot.png", width = 600, height = 400)
plot(
    data_set$income, data_set$time_spent,
    main = "Eltöltött idő vs Jövedelem",
    xlab = "Jövedelem",
    ylab = "Eltöltött idő (óra/nap)"
)
abline(model2, col = "blue", lwd = 2)
dev.off()

png("4_model3_plot.png", width = 600, height = 400)
plot(
    fitted(model3), data_set$time_spent,
    main = "Előrejelzett vs Tényleges a 3. Modellhez",
    xlab = "Előrejelzett Eltöltött Idő",
    ylab = "Tényleges Eltöltött Idő"
)
abline(0, 1, col = "green", lwd = 2)
dev.off()
