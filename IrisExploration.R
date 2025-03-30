# install.packages("ggplot2")
library(ggplot2)

head(iris)  # First 6 rows
str(iris)  # Types of columns (numeric/factor)

summary(iris)  # Stats for numeric columns + counts for Species

ggplot(data = iris) #iris |> ggplot()

# Histogram distribution of Sepal Length variable
ggplot(iris, aes(x = Sepal.Length)) +
  geom_histogram(binwidth = 0.2, fill = "blue", alpha = 0.7) +
  facet_wrap(~Species) +  # Separate by species
  ggtitle("Sepal Length Distribution by Species")
ggsave("sepal_length_histogram.png", width = 8, height = 6)  # Saves last plot


ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  ggtitle("Sepal Length by Species")


# Histogram distribution of Sepal Width variable
ggplot(iris, aes(x = Sepal.Width)) +
  geom_histogram(binwidth = 0.2, fill = "red", alpha = 0.7) +
  facet_wrap(~Species) +  # Separate by species
  ggtitle("Sepal Width Distribution by Species")

ggplot(iris, aes(x = Species, y = Sepal.Width, fill = Species)) +
  geom_boxplot() +
  ggtitle("Sepal Width by Species")


# Relationship between Sepal features
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3) +
  ggtitle("Sepal Length vs. Width")

# Relationship between Petal features
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point(size = 3) +
  ggtitle("Petal Length vs. Width")


install.packages("GGally")  # For advanced pair plots
library(GGally)
ggpairs(iris, columns = 1:4, aes(color = Species, alpha = 0.5))


# Correlation analysis:

cor(iris[, 1:4])  # Excludes Species (factor)

#Anova for sign differences:
summary(aov(Sepal.Length ~ Species, data = iris))
# post-hoc test
TukeyHSD(aov(Sepal.Length ~ Species, data = iris))

summary(aov(Sepal.Width ~ Species, data = iris))

summary(aov(Petal.Length ~ Species, data = iris))
summary(aov(Petal.Width ~ Species, data = iris))




# Visualizing the differences
# Install packages if needed
install.packages(c("ggpubr", "rstatix"))
library(ggpubr)  # For stat_compare_means()
library(rstatix) # For tukey_hsd()

# Boxplot with p-values
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot(alpha = 0.7) +
  # Add ANOVA p-value (top of plot)
  stat_compare_means(
    method = "anova", 
    label.y = 8.5, 
    aes(label = paste0("ANOVA, p = ", ..p.format..))
  ) +
  # Add Tukey HSD bars (if tukey_results works)
  geom_signif(
    comparisons = list(c("setosa", "versicolor"), 
                       c("setosa", "virginica"), 
                       c("versicolor", "virginica")),
    map_signif_level = TRUE,
    textsize = 3,
    step_increase = 0.1
  ) +
  labs(title = "Sepal Length by Species") +
  theme_minimal()





# Perform Tukey HSD
tukey_results <- tukey_hsd(Sepal.Length ~ Species, data = iris)

# Plot differences and confidence intervals
ggplot(tukey_results, aes(x = group1, y = group2)) +
  geom_tile(aes(fill = p.adj < 0.05), color = "white") +  # Color tiles by significance
  geom_text(aes(label = paste0("p = ", round(p.adj, 4))), size = 3.5) +  # Add p-values
  scale_fill_manual(
    values = c("TRUE" = "lightgreen", "FALSE" = "gray90"),
    name = "Significant (p < 0.05)"
  ) +
  labs(
    title = "Tukey HSD Pairwise Comparisons",
    x = "Group 1",
    y = "Group 2",
    subtitle = "Green cells: significant differences"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels




# Data viz of the dataset

iris |> 
  ggplot() + # iniciar el gráfico
  # definir el mapeo de variables a características estéticas del gráfico
  aes(x = Sepal.Length, # eje x (horizontal)
      y = Sepal.Width) # eje y (vertical)
