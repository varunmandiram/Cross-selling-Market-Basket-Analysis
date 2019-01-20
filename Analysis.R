setwd("V:\\GrabOn")

#read the data
data<-read.csv("groceries.csv",header = FALSE)

#see how many unique products are present
unique(unlist(data))

##Data manipulation and create transaction class to feed Apriori
cols<-colnames(data)
data$id<-c(1:nrow(data))
data$item_list <- apply( data[ ,cols  ] , 1 , paste , collapse = "," )
my_data = paste(unlist(data$item_list), sep="\n");
write(my_data, file = "my_basket");
trans = read.transactions("my_basket", format = "basket", sep=",");

##create Association rules

#inspect(trans);
basket_rules <- apriori(trans,parameter 
                        = list(sup = 0.01,
                               conf = 0.2,target="rules"));
basket_rules<-sort(basket_rules, by="confidence", decreasing=TRUE)

##View the top 5 Rules
inspect(basket_rules[1:5])

df_basket <- as(basket_rules,"data.frame")
View(df_basket)



itemFrequencyPlot(trans, topN = 5)




