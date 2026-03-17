library(collections)

data_set <- read.csv("data/social-media.csv", stringsAsFactors = FALSE)

male_data <- subset(data_set, gender == "male")
female_data <- subset(data_set, gender == "female")

t_test_result <- t.test(male_data$time_spent, female_data$time_spent)

cat("Két mintás t-próba időtöltésen (time_spent) férfiak és nők között:\n")
print(t_test_result)

cat("\nÉrtelmezés:\n")
if (t_test_result$p.value < 0.05) {
    cat(
        "A p-érték kisebb, mint 0.05, ezért elutasítjuk a nullhipotézist. Jelentős különbség van az átlagos időtöltésben a férfiak és nők között.\n"
    )
} else {
    cat(
        "A p-érték nagyobb vagy egyenlő 0.05-tel, ezért nem utasítjuk el a nullhipotézist. Nincs jelentős különbség az átlagos időtöltésben a férfiak és nők között.\n"
    )
}

cat("Átlagos eltöltött idő férfiaknál:", mean(male_data$time_spent), "\n")
cat("Átlagos eltöltött idő nőknél:", mean(female_data$time_spent), "\n")
