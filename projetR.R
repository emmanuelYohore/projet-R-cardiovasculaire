data <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data"), header = FALSE)

colnames(data) <- c("age","sex","cp","trestbps","chol","fbs","restecg","thalach","exang","oldpeak","slope","ca","thal","target")

data$target[data$target == 2] <- 1
data$target[data$target == 3] <- 1
data$target[data$target == 4] <- 1

val_manquantes_ca <- which(data$ca %in% "?")
val_manquantes_thal <- which(data$thal %in% "?")
val_manquantes <- c(val_manquantes_ca, val_manquantes_thal)
data <- data[-val_manquantes,]

data$sex <- as.factor(data$sex)
data$cp <- as.factor(data$cp)
data$fbs <- as.factor(data$fbs)
data$restecg <- as.factor(data$restecg)
data$exang <- as.factor(data$exang)
data$slope <- as.factor(data$slope)
data$ca <- as.factor(data$ca)
data$thal <- as.factor(data$thal)
data$target <- as.factor(data$target)

data$age <- as.integer(data$age)
data$trestbps <- as.integer(data$trestbps)
data$chol <- as.integer(data$chol)
data$thalach <- as.integer(data$thalach)


levels(data$sex) <- c("Femme","Homme")
levels(data$cp) <- c("Angine stable", "Angine instable", "Autres douleurs", "Asymptomatique")
levels(data$fbs) <- c("Non","Oui")
levels(data$restecg) <- c("Normal","Anomalies","Hypertrophie")
levels(data$exang) <- c("Non","Oui")
levels(data$slope) <- c("En hausse","Stable", "En baisse")
levels(data$ca) <- c("Absence d'anomalie","Faible","Moyen","Elevé")
levels(data$thal) <- c("Non","Thalassémie sous contrôle","Thalassémie instable")
levels(data$target)
levels(data$target) <- c("Non","Oui")

str(data)

apply(data,2, anyNA)

table(data$sex)
round(prop.table(table(data$sex)), 4)*100

table(data$cp)
round(prop.table(table(data$cp)), 4)*100

table(data$fbs)
round(prop.table(table(data$fbs)), 4)*100

table(data$restecg)
round(prop.table(table(data$restecg)), 4)*100

table(data$exang)
round(prop.table(table(data$exang)), 4)*100

table(data$slope)
round(prop.table(table(data$slope)), 4)*100

table(data$thal)
round(prop.table(table(data$cp)), 4)*100

table(data$target)
round(prop.table(table(data$target)), 4)*100

summary(data$age)
summary(data$trestbps)
summary(data$chol)
summary(data$thalach)
summary(data$oldpeak)

var(data$age)
sd(data$age)

var(data$trestbps)
sd(data$trestbps)

var(data$chol)
sd(data$chol)

var(data$thalach)
sd(data$thalach)

var(data$oldpeak)
sd(data$oldpeak)

str(data)

apply(data,2, anyNA)

graph1 <- plot(data$sex, xlab="Sexe", ylab="Effectifs", main = "Répartition des patients selon le sexe",
     las=1, col = c("orange","blue"), ylim=c(0,250)
     )
text(x=graph1,y=table(data$sex)+10,labels=as.character(table(data$sex)))

graph2 <- plot(data$cp, xlab="Douleur thoraciques", ylab="Effectifs",main="Répartion des patients selon les douleurs thoraciques",ylim=c(0,150))
text(x=graph2,y=table(data$cp)+7,labels=as.character(table(data$cp)))

graph3 <- pie(table(data$target),
              main = "Répartition des patients selon l'apparition d'une maldie cardiovasculaire"
              ,clockwise =TRUE)

graph4 <- boxplot(data$age, main="Boite à moustache de la poupulation selon l'âge", ylab="Age", col="orange", las=1, ylim=c(20,80))

graph5 <- hist(data$trestbps, xlab="Tension artérielle au repos", ylab="Effectifs",
              main="Répartition des patients selon leur tension artérielle au repos", 
              col="orange", las=1, xlim=c(80,200))


graph6=barplot(table(data$target, data$sex), beside=TRUE, col=c("blue","orange"), xlab="Sexe", ylab="Patients", ylim=c(0,150))
legend("top", legend = levels(data$target), fill = c("blue","orange"), title = "Maldie cardiovasculaire")

graph7 <- boxplot(data$age ~ data$target, xlab="Maladie cardiovasculaire",ylab="Age",ylim=c(20,80))

graph8 <- boxplot(data$trestbps ~ data$target, xlab="Tension artériel au repos",ylab="Age")

round(prop.table(table(data$sex, data$target), margin=1), 4)*100
round(prop.table(table(data$cp, data$target), margin=1), 4)*100
round(prop.table(table(data$fbs, data$target), margin=1), 4)*100
round(prop.table(table(data$restecg, data$target), margin=1), 4)*100
round(prop.table(table(data$exang, data$target), margin=1), 4)*100
round(prop.table(table(data$slope, data$target), margin=1), 4)*100
round(prop.table(table(data$ca, data$target), margin=1), 4)*100
round(prop.table(table(data$thal, data$target), margin=1), 4)*100

## test de Khi2

chisq.test(data$sex, data$target)
chisq.test(data$cp, data$target)
chisq.test(data$fbs, data$target)
chisq.test(data$restecg, data$target)
chisq.test(data$exang, data$target)
chisq.test(data$slope, data$target)
chisq.test(data$ca, data$target)
chisq.test(data$thal, data$target)

tapply(data$age, data$target, mean)
tapply(data$trestbps, data$target, mean)
tapply(data$chol, data$target, mean)
tapply(data$thalach, data$target, mean)
tapply(data$oldpeak, data$target, mean)

## test de shapiro-wilk
### H0 : L'échantillon suit une distribution normale (si p-value > 0.05)
### H1 : L'échantillon ne suit pas une distribution normale (si p-value < 0.05)

library(dplyr)

shapiro.test(filter(data, target == "Oui")$age) #H1
hist(data$age)

shapiro.test(filter(data, target == "Oui")$trestbps) #H1
hist(data$trestbps)

shapiro.test(filter(data, target == "Oui")$chol) #HO
hist(data$chol)

shapiro.test(filter(data, target == "Oui")$thalach) #HO
hist(data$thalach)

shapiro.test(filter(data, target == "Oui")$oldpeak) #H1
hist(data$oldpeak)

## test de Mann-Whitney

### H0 : Il n'y a pas de différence significative entre la moyenne des deux variables
### H1 : Il y'a une différence significative entre la moyenne des deux variables

wilcox.test(data$age ~ data$target)
wilcox.test(data$trestbps ~ data$target)
wilcox.test(data$oldpeak ~ data$target)

## test de Student

### H0 : Il n'y a pas de différence significative entre la moyenne des deux variables
### H1 : Il y'a une différence significative entre la moyenne des deux variables

t.test(data$chol ~ data$target)
t.test(data$thalach ~ data$target)

## Division des données en train / test

set.seed(99)
library(caTools)

split <- sample.split(data$target, SplitRatio = 0.8)
train <- subset(data, split == TRUE)
test <- subset(data, split == FALSE)

## Création du modèle

model = glm(target ~ . , data = train, family = "binomial")
summary(model)

## Optimisation du modèle

model = update(model, .~.-restecg)
model = update(model, .~.-slope)
model = update(model, .~.-thal)
model = update(model, .~.-age)
model = update(model, .~.-fbs)
model = update(model, .~.-chol)
model = update(model, .~.-thalach)
model = update(model, .~.-cp)
model = update(model, .~.-trestbps)
summary(model)

## AIC sans variable cp : 202.23
## AIC avec variable cp : 177.71

## Prédictions

prediction <- predict(model, test, type = "response")
prediction
tableau_pred <- as.data.frame(prediction)

creation_fonction <- function(x){
  return(ifelse(x>0.5,1,0))
}

tableau_pred <- apply(tableau_pred, 2,creation_fonction)

## Mesure des performances du modèle

levels(test$target) <- c(0,1)
library(caret)
confusionMatrix(as.factor(test$target), as.factor(tableau_pred))

## Tableau de comparaison

tab_compar <- cbind(test, tableau_pred)
tab_compar$prediction <- as.factor((tab_compar$prediction))

levels(tab_compar$target) <- c("Non", "Oui")
levels(tab_compar$prediction) <- c("Non", "Oui")

## Test de Hosmer et Lemeshow
### H0 : L'ajustement du modèle est bon
### H1 : L'ajustement du modèle est mauvais

library(performance)
performance_hosmer(model)

## Courbe ROC(comaprer vrai positif et faux positif)

library(pROC)

par(pty="s")
roc(train$target, model$fitted.values, plot=TRUE, main="Courbe ROC", lwd=4, xlab="Taux de Faux Positifs",ylab="aux de Vrai Positifs", col="blue", legacy.axes=TRUE)

## Aire sur la courbe : 0.9281