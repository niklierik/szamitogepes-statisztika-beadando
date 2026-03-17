# Statisztika a közösségi média használatból

Forrása az adathalmaznak: https://www.kaggle.com/datasets/imyjoshua/average-time-spent-by-a-user-on-social-media?resource=download

## Leíró statisztika

Forráskód: [1_leiro.r](1_leiro.r)

### Kvantitatív összegzés

|                   |  Kor   | Eltöltött idő (óra/nap) | Bevétel (USD) |
| ----------------: | :----: | :---------------------: | :-----------: |
|           Minimum | 18.000 |          1.000          |   10012.00    |
|           Maximum | 64.000 |          9.000          |   19980.00    |
|             Átlag | 40.986 |          5.029          |   15014.82    |
|          Q1 (25%) | 29.000 |          3.000          |   12402.25    |
| Medián / Q2 (50%) | 42.000 |          5.000          |   14904.50    |
|          Q3 (75%) | 52.000 |          7.000          |   17674.25    |

#### Boxplotok

![Age boxplot](1_age_boxplot.png)
![Time spent boxplot](1_time_spent_boxplot.png)
![Income boxplot](1_income_boxplot.png)

### Kvalitatív összegzés

#### Nem / Közösségi Média Platform

|             | Facebook | Instagram | YouTube |
| ----------: | :------: | :-------: | :-----: |
|          Nő |    85    |    135    |   111   |
|       Férfi |   113    |    128    |   96    |
| Nem-Bináris |   109    |    100    |   123   |

#### Hisztogrammok

![Is Home Owner barplot?](1_isHomeOwner_barplot.png)
![Gender barplot](1_gender_barplot.png)
![Indebt barplot](1_indebt_barplot.png)
![Owns Car barplot](1_Owns_Car_barplot.png)
![Platform barplot](1_platform_barplot.png)

## Közösségi médián töltött idő férfiak és nők között (kétmintás t-próba)

Forráskód: [2_t_proba.r](2_t_proba.r)

### Átlagos eltöltött idő

- **Férfiaknál**: 4.821958
- **Nőnél**: 5.190332

### Null-hipotézis (H0)

Nincs jelentős különbség az átlagos időtöltésben a férfiak és nők között.

`H₀: μ_férfi = μ_nő`, ahol `μ` az átlagot jelöli.

### Null-hipotézis eredménye

```
t = -1.8618
df = 665.24
p-value = 0.06307
```

Mivel a p-érték 0.05-nől nagyobb, ezért nem tudjuk elutasítani a null-hipotézist. Esetleg azt az alternatív hipotézist megfogalmazhatjuk:

#### Alternatív hipotézis (H1)

Van jelentős különbség az átlagos időtöltésben a férfiak és nők között.

Azonban ezt a próba ténylgesen nem bizonyítja.
