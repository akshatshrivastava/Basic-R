library(ggpubr)

ggdensity(iris, x="Sepal.Length", color="Species", 
          fill="Species")

gghistogram(iris, x="Sepal.Length",
            fill = "Species",
            color = "Species",
            bins = 25,
            palette = c("#00AFBB", "#E7B800", "#FC4E07"))

ggboxplot(iris, y = "Sepal.Length", x = "Species",
          color = "Species", 
          palette =c("#ff0000", "#0400ff", "#fb00ff"),
          shape = "Species")

ggboxplot(iris, y = "Sepal.Length", x = "Species",
          color = "Species", 
          palette =c("#ff0000", "#0400ff", "#fb00ff"),
          shape = "Species",
          add = "jitter",
          ggtheme = theme_minimal())

ggscatter(iris, y = "Sepal.Length", x = "Species",
          color = "Species")

#ggpie
df <- data.frame(
  group = c("Male", "Female", "Child"),
  value = c(25, 25, 50))

ggpie(df, "value", label = "group",
      fill = "group", color = "white",
      palette = c("#00AFBB", "#E7B800", "#FC4E07") )


labs <- paste0(df$group, " (", df$value, "%)")
ggpie(df, "value", label = labs,
      lab.pos = "in", lab.font = "white",
      fill = "group", color = "white",
      palette = c("#00AFBB", "#E7B800", "#FC4E07"))


