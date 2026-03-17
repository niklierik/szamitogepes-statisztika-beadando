library(collections)

data_set <- read.csv("data/social-media.csv", stringsAsFactors = FALSE)

# Választott nominális változók: gender és platform
# Chi-négyzet teszt függetlenségre

cont_table <- table(data_set$gender, data_set$platform)

cat("Kontingencia tábla gender és platform között:\n")
print(cont_table)

chi_test <- chisq.test(cont_table)

cat("\nChi-négyzet teszt eredménye:\n")
print(chi_test)

cat("\nÉrtelmezés:\n")
if (chi_test$p.value < 0.05) {
    cat("A p-érték kisebb, mint 0.05, ezért elutasítjuk a nullhipotézist. Van összefüggés a gender és platform változók között.\n")
} else {
    cat("A p-érték nagyobb vagy egyenlő 0.05-tel, ezért nem utasítjuk el a nullhipotézist. Nincs bizonyíték összefüggésre a gender és platform változók között.\n")
}
