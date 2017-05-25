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