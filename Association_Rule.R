#loading the arules package
install.packages("arulesViz")

#loading the arulesviz package
library("arulesViz")

#loading the dataset
data("Income")

#To show transactions(rows) and items(columns)
head(Income)


summary(Income)#summarizing the rules

rules <- apriori(Income, parameter=list(support=0.5, confidence=0.5, target = "rules"))#defining  the  rules 

rules

inspect(rules[1:10])#inspecting  the  top 10 rules

head(quality(rules))

subrules <- rules[quality(rules)$confidence > 0.8]

subrules

summary(subrules) #summarizing the rules


plot(subrules, method="matrix3D", measure="lift")

#graph visualization for top 20 rules
plot(rules[1:20],method ="graph",control = list(type = "items")) 

plot(rules[1:20], measure=c("support","lift"), shading="confidence");

plot(rules[1:20], shading="order", control=list(main ="Two-key plot"));

#defining the subrule
subrule <- head(sort(rules, by="lift"), 10)     

#parallel coordinate for subrule
plot(subrule, method="paracoord", control=list(reorder=TRUE)) 

#grouped visualization for subrule
plot(rules, method="grouped", control=list(k=50)) 



