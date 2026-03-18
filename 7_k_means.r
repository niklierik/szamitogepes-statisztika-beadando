library(collections)

data_set <- read.csv("data/social-media.csv", stringsAsFactors = FALSE)

cluster_data <- data_set[, c("age", "time_spent")]

wss <- sapply(1:10, function(k) {
    kmeans(cluster_data, centers = k, nstart = 10)$tot.withinss
})

png("7_elbow_plot.png", width = 600, height = 400)
plot(1:10, wss,
    type = "b", pch = 19, frame = FALSE,
    xlab = "Klaszterek száma (hány csoportba soroljuk az adatokat)",
    ylab = "Hiba mértéke (alacsonyabb = jobb csoportosítás)",
    main = "Könyök-módszer: Klaszterek ideális számának kiválasztása"
)
dev.off()

cat("Az elbow ábra mentésre került: 7_elbow_plot.png\n")

# Automatikus optimális k kiválasztása: ahol a csökkenés < 10% az előzőhöz képest
diff_wss <- -diff(wss) # Pozitív csökkenések
relative_decrease <- diff_wss / wss[1:(length(wss) - 1)]
optimal_k <- which(relative_decrease < 0.1)[1] + 1
if (is.na(optimal_k)) optimal_k <- 3 # Ha nem talál, alapértelmezett 3

cat("Automatikusan kiválasztott optimális klaszterek száma: k =", optimal_k, "(ahol a hiba csökkenése lelassul)\n")

set.seed(123)
kmeans_result <- kmeans(cluster_data, centers = optimal_k, nstart = 10)

cat("K-means klaszterezés eredménye (k =", optimal_k, "):\n")
cat("A csoportok átlagos értékei (középpontok):\n")
print(kmeans_result$centers)
cat("Minden csoportba hány pont tartozik:\n")
print(kmeans_result$size)
cat("Összes hiba a csoportosításban:", kmeans_result$tot.withinss, "(alacsonyabb = jobb)\n")

png("7_kmeans_plot.png", width = 600, height = 400)
plot(cluster_data,
    col = kmeans_result$cluster, pch = 19,
    main = paste("K-means Csoportosítás Eredménye (", optimal_k, " csoport)"),
    xlab = "Kor (évek)", ylab = "Közösségi média használata (óra/nap)"
)
points(kmeans_result$centers, col = 1:optimal_k, pch = 8, cex = 2, lwd = 2)
legend("topright", legend = c("Adatpontok (szín = csoport)", paste("Csoport középpontok (", 1:optimal_k, ")")), col = c(1, 1:optimal_k), pch = c(19, rep(8, optimal_k)))
dev.off()
