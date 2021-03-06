###########################################################
# Campos para lidar com as predi��es
names <- colnames(combi)
campos <- names[!names %in% c("Name", "TipoFamilia", "Ticket", "Cabin", "Surname")]
combi <- combi[campos]

# Criar f�rmula para gera��o de modelos
formula <- Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked + 
                      Familia + Title + Kid + Mother + Deck + NCabin + Line + 
                      PC + CA + WC + Crew

###########################################################
# Redividir valores
train <- combi[!is.na(combi$Survived),]
test <- combi[is.na(combi$Survived),]
rm(combi)

# Gera��o de valores para treino e testes
train.sample <- sample(1:nrow(train), size=nrow(train)*0.8)
train.treino <- train[train.sample,]
train.teste <- train[-train.sample,]
rm(train.sample)