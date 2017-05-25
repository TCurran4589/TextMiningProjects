clinton_1<-corpus_subset(DEBATES, speaker== "clinton" & primary == 1)
clinton_0<- summary(clinton_1)


#graph
plot(log(clinton_1$Types), log(clinton_1$Tokens)) + 
  abline(lm(log(clinton_1$Tokens) ~ log(clinton_1$Types)))

#####3) Exploring text fragment with Heap's Law:
###### Combined Heaps Law:
```{r heaps_law, echo=FALSE, warning=FALSE, tidy=TRUE}
df<-summary(DEBATES)

plot(log(df$Types), log(df$Tokens)) + abline(lm(log(df$Tokens) ~ log(df$Types)))

summary(lm(log(df$Tokens) ~log(df$Types)))
```

```{r speaker_df,echo=FALSE, warning=FALSE, tidy=TRUE}
#create trump only data frame
trump<-corpus_subset(DEBATES, speaker== "trump")
#create clinton only data frame
clinton<-corpus_subset(DEBATES, speaker== "clinton")
```
###### Clinton Heaps Law:
```{r clinton_heap,echo=FALSE, warning=FALSE, tidy=TRUE}
#add clinton heap from previous block
clinton<-summary(clinton)

plot(log(clinton$Types), log(clinton$Tokens)) + abline(lm(log(clinton$Tokens) ~ log(clinton$Types)))

summary(lm(log(clinton$Tokens) ~log(clinton$Types)))
```
###### Trump Heaps Law:
```{r trump_heap, echo=FALSE, warning=FALSE, tidy=TRUE}
#add trump heap from previous block
plot(log(trump$Types), log(trump$Tokens)) + abline(lm(log(trump$Tokens) ~ log(trump$Types)))

summary(lm(log(trump$Tokens) ~log(trump$Types)))
```
#####4)Lexical Diversity Before and After Accepting Party's Nomination:



#####Clinton Heaps Law Before Party's Nomination:
```{r clinton_before_nom}
#Clinton Before Nominee
clinton_0<-corpus_subset(DEBATES, speaker== "clinton" & primary == 0)
clinton_0<- summary(clinton_0)

#Graph
plot(log(clinton_0$Types), log(clinton_0$Tokens)) + abline(lm(log(clinton_0$Tokens) ~ log(clinton_0$Types)))
```
#####Clinton Heaps Law After Party's Nomination:
```{r clinton_after_nom}
#Clinton After Nominee
clinton_1<-corpus_subset(DEBATES, speaker== "clinton" & primary == 1)
clinton_1<- summary(clinton_1)

plot(log(clinton_1$Types), log(clinton_1$Tokens)) + abline(lm(log(clinton_1$Tokens) ~ log(clinton_1$Types)))
```

#####Trump Heaps Law Before Party's Nomination:
```{r trump_before_nom}
#Clinton After Nominee
trump_0<-corpus_subset(DEBATES, speaker== "trump" & primary == 0)
trump_0<- summary(trump_0)

plot(log(trump_0$Types), log(trump_0$Tokens)) + abline(lm(log(trump_0$Tokens) ~ log(trump_0$Types)))
```
#####Trump Heaps Law After Party's Nomination:
```{r trump_after_nom}
#Clinton After Nominee
trump_1<-corpus_subset(DEBATES, speaker== "trump" & primary == 1)
trump_1<- summary(trump_1)

plot(log(trump_1$Types), log(trump_1$Tokens)) + abline(lm(log(trump_1$Tokens) ~ log(trump_1$Types)))
```

#####6) Remove stopwords from the corpus
```{r}
#mydfm<-removeFeatures(DEBATES, stopwords("English"))
?removeFeatures
```
####7) Tokenize function to construct seperate bi-gram for both candidates
