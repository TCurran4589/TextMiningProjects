#4)
################################################################################
# Candidate Readbility Scores
################################################################################
#Clinton readability
clinton_readability <- textstat_readability(clinton, measure="Flesch.Kincaid")
mean(clinton_readability)

clinton0_readability <- textstat_readability(clinton_1, measure="Flesch.Kincaid")
mean(clinton0_readability)

clinton1_readability <- textstat_readability(clinton_0, measure="Flesch.Kincaid")
mean(clinton1_readability)


##Trump Readbility
trump_readability <- textstat_readability(trump, measure="Flesch.Kincaid")
mean(trump_readability)

trump0_readability <- textstat_readability(trump_0, measure="Flesch.Kincaid")
mean(trump0_readability)

trump1_readability <- textstat_readability(trump_1, measure="Flesch.Kincaid")
mean(trump1_readability)
################################################################################
# Candidate Lexile Diversity Scores:
################################################################################
#Lexical Diversity: Trump before nomination
trump0_dfm<-dfm(corpus_subset(DEBATES, speaker=='trump' & primary==0))
lexdiv_trump0<-textstat_lexdiv(trump0_dfm, measure="TTR")
mean(lexdiv_trump0)
#Lexical Diversity: Trump after nomination
trump1_dfm<-dfm(corpus_subset(DEBATES, speaker=='trump' & primary==1))
lexdiv_trump1<-textstat_lexdiv(trump1_dfm, measure="TTR")
mean(lexdiv_trump1)
#Lexical Diversity: Clinton before nomination
clinton0_dfm<-dfm(corpus_subset(DEBATES, speaker=='clinton' & primary==0))
lexdiv_clinton0<-textstat_lexdiv(clinton0_dfm, measure="TTR")
mean(lexdiv_clinton0)
#Lexical Diversity: Clinton after nomination
clinton1_dfm<-dfm(corpus_subset(DEBATES, speaker=='clinton' & primary==1))
lexdiv_clinton0<-textstat_lexdiv(clinton1_dfm, measure="TTR")
mean(lexdiv_clinton0)
################################################################################
#5)Lexical Diversity and Readability Score Hypothesis for Trump and Clinton
################################################################################

################################################################################
#6) Remove stopwords from corpus
################################################################################
DEBATES_nostop <- dfm(DEBATES, remove=stopwords("english"))

Debates_clinton_nostop <- dfm(clinton, remove = stopwords("english"))

Debates_trump_nostop <- dfm(trump, remove = stopwords("english"))
################################################################################
#7) Using Tokenize() construct a seperate bi-gram for both candidates and calculate
#the ten most frequently used bi-grams
################################################################################
#Debates bi-gram
tok <- quanteda::removeFeatures(quanteda::tokenize(DEBATES, remove_punct=TRUE), stopwords("english"))
tok <-unlist(tokens_ngrams(tok,n=2, concatenator=" "))
df<- data.table("token"=tok, "president"=names(tok))
df<- df[,.N, by=token][order(N, decreasing = TRUE)]
df$N<-as.numeric(df$N)
df[1:10]

#Clinton bi-gram
tok_clinton <- quanteda::removeFeatures(quanteda::tokenize(clinton, remove_punct=TRUE), stopwords("english"))
tok_clinton <-unlist(tokens_ngrams(tok_clinton,n=2, concatenator=" "))
df<- data.table("token"=tok_clinton, "president"=names(tok_clinton))
df<- df[,.N, by=token][order(N, decreasing = TRUE)]
df$N<-as.numeric(df$N)
df[1:10]

#clinton bi-gram before nomination
tok_clinton0 <- quanteda::removeFeatures(quanteda::tokenize(clinton_0, remove_punct=TRUE), stopwords("english"))
tok_clinton0 <-unlist(tokens_ngrams(tok_clinton0,n=2, concatenator=" "))
df<- data.table("token"=tok_clinton0, "president"=names(tok_clinton0))
df<- df[,.N, by=token][order(N, decreasing = TRUE)]
df$N<-as.numeric(df$N)
df[1:10]

#clinton bi-gram after nomination
tok_clinton1 <- quanteda::removeFeatures(quanteda::tokenize(clinton_1, remove_punct=TRUE), stopwords("english"))
tok_clinton1 <-unlist(tokens_ngrams(tok_clinton1,n=2, concatenator=" "))
df<- data.table("token"=tok_clinton1, "president"=names(tok_clinton1))
df<- df[,.N, by=token][order(N, decreasing = TRUE)]
df$N<-as.numeric(df$N)
df[1:10]

#trump bi-gram
tok_trump <- quanteda::removeFeatures(quanteda::tokenize(trump, remove_punct=TRUE), stopwords("english"))
tok_trump <-unlist(tokens_ngrams(tok_trump,n=2, concatenator=" "))
df<- data.table("token"=tok_trump, "president"=names(tok_trump))
df<- df[,.N, by=token][order(N, decreasing = TRUE)]
df$N<-as.numeric(df$N)
df[1:10]

#trump bi-gram before nomination
tok_trump0 <- quanteda::removeFeatures(quanteda::tokenize(trump_0, remove_punct=TRUE), stopwords("english"))
tok_trump0 <-unlist(tokens_ngrams(tok_trump0,n=2, concatenator=" "))
df<- data.table("token"=tok_trump0, "president"=names(tok_trump0))
df<- df[,.N, by=token][order(N, decreasing = TRUE)]
df$N<-as.numeric(df$N)
df[1:10]

#trump bi-gram after nomination
tok_trump1 <- quanteda::removeFeatures(quanteda::tokenize(trump_1, remove_punct=TRUE), stopwords("english"))
tok_trump1 <-unlist(tokens_ngrams(tok_trump1,n=2, concatenator=" "))
df<- data.table("token"=tok_trump1, "president"=names(tok_trump1))
df<- df[,.N, by=token][order(N, decreasing = TRUE)]
df$N<-as.numeric(df$N)
df[1:10]

################################################################################
#8) Collocation using chi-squared
################################################################################
collocation <- collocations(tok, method="chi2", size=2)
collocation
collocation_clinton <- collocations(tok_clinton, method="chi2", size=2, punctuation="ignore")
collocation_clinton
collocation_trump <- collocations(tok_trump, method="chi2", size=2, punctuation="ignore")
collocation_trump
################################################################################
#9) 
################################################################################


