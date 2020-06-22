# 1. To load Titanic data and look at basic information of the data

titanic <- read.csv("titanic.csv", header = TRUE)
str(titanic)
head(titanic)
View(titanic)
summary(titanic)

# 2. To create a new dataset without having the fields (passenger Id, name, ticket, and cabin)

titanic <- subset(titanic, select = -c(PassengerId, Name, Ticket, Cabin))

# 3. To change the current data type of ¡°Survived¡± into a categorical data

titanic$Survived <- as.factor(titanic$Survived)

# 4. To find the missing values in Age, and replace those missing values with ¡°median¡± value

age_median = median(titanic$Age, na.rm = TRUE)
titanic$Age[is.na(titanic$Age)] <- age_median

# 5. To split the data into train and test sets with 70/30 rule

train.index <- sample(1:nrow(titanic), 0.7*nrow(titanic))
titanic.train <- titanic[train.index,]
titanic.test <- titanic[-train.index,]


# 6. To make a decision tree by using a train set and display the tree information

library(rpart)
library(rpart.plot)

titanic.tree <- rpart(Survived~., data=titanic.train)
head(titanic.tree)

prp(titanic.tree, type=1, extra=1, under=TRUE, split.font=1, varlen=0)

# 7. To make a separate prediction with ¡°class¡± and ¡°prob¡± types, respectively

titanic.predictions_class <- predict(titanic.tree, titanic.test, type="class")
titanic.predictions_class

titanic.predictions_prob <- predict(titanic.tree, titanic.test, type="prob")
titanic.predictions_prob

library(caret)
confusionMatrix(titanic.predictions_class, titanic.test$Survived)

# 8. To use some controls in the decision tree, such as minimum split and depth, and make a new decision tree and a prediction again.

tree.params <- rpart.control(minsplit=10, minbucket=5, maxdepth=30, cp=0.01)
titanic.tree <- rpart(Survived~., data=titanic.train, control=tree.params, parms=list(split="gini"))
prp(titanic.tree, type=1, extra=1, under=TRUE, split.font=1, varlen=0)

titanic.predictions <- predict(titanic.tree, titanic.test, type="class")
titanic.predictions
confusionMatrix(titanic.predictions, titanic.test$Survived)

# 9. To apply a random forest with number of tree = 500 and mtry = 3

library(randomForest)
titanic.rf <- randomForest(Survived ~., data=titanic.train, ntree=500, mtry=3, nodesize=3, importance=TRUE)

varImpPlot(titanic.rf, type=1)

rf.pred <- predict(titanic.rf, titanic.test)
rf.pred
confusionMatrix(rf.pred, titanic.test$Survived)

# 10. 

library(tm)
library(NLP)

titanic2 <- read.csv("titanic.csv", header = TRUE)

titanic_nax <- titanic2[c(!is.na(titanic2$Age)),]    # Extract data that age is not a missing value
children_name <- titanic_nax[titanic_nax$Age<13,"Name"]   # Children's name data extraction
children_medians <- median(titanic_nax[titanic_nax$Age<13,"Age"]) # children's age median

children_names <- ""

for (i in children_name){
  children_names <- paste(children_names, i)  # Merge children's names into one document
}

adult_name <- titanic_nax[titanic_nax$Age>=13,"Name"]   # adult's name data extraction
adult_medians <- median(titanic_nax[titanic_nax$Age>=13,"Age"])   # adult's age median

adult_names <- ""

for (i in adult_name){
  adult_names <- paste(adult_names, i)    # Merge adult's names into one document
}


name <- rbind(children_names, adult_names)    # Merge children's name and adult's name

# Getting tf-idf value
corp <- Corpus(VectorSource(name))
corp.tk <- tm_map(corp, stripWhitespace)
corp.tk <- tm_map(corp.tk, removePunctuation)
corp.tk <- tm_map(corp.tk, removeWords, stopwords("english"))
corp.tk <- tm_map(corp.tk, stemDocument)
tdm.tk <- TermDocumentMatrix(corp.tk)

tfidf <- weightTfIdf(tdm.tk)
tfidf <- as.matrix(tfidf)

# Fill missing values
for (i in 1:nrow(titanic2)){
  if (is.na(titanic2$Age[i])){
    value <- c()
    for (j in 1:nrow(tfidf)){
      if ( grepl(rownames(tfidf)[j], titanic2$Name[i])){
        if (tfidf[j,1]>tfidf[j,2]) value <- c(value,1)
        else value <- c(value,2)
      }
    }
    count_v <- count(value) 
    # Assignment of median value of total data when prediction of child or adult is impossible
    if (is.null(value)) titanic2$Age[i] <- age_median   
    # when prediction of child or adult is possible
    else {
      if (max(count_v)==1) titanic2$Age[i] <- children_medians
      else titanic2$Age[i] <- adult_medians
    }
  }
}

# Getting decision trees
titanic2 <- subset(titanic2, select = -c(PassengerId, Name, Ticket, Cabin))
titanic2$Survived <- as.factor(titanic2$Survived)

train2.index <- sample(1:nrow(titanic2), 0.7*nrow(titanic2))
titanic2.train <- titanic2[train2.index,]
titanic2.test <- titanic2[-train2.index,]
titanic2.tree <- rpart(Survived~., data=titanic2.train)

prp(titanic2.tree, type=1, extra=1, under=TRUE, split.font=1, varlen=0)
titanic2.predictions_class <- predict(titanic2.tree, titanic2.test, type="class")
confusionMatrix(titanic2.predictions_class, titanic2.test$Survived)
