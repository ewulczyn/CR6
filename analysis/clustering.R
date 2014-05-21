k = 10
sig = 0.5

c1 = 1:k
c2 = k:1
ts = 1:k
  
t1=sample(ts, k, replace = FALSE, prob = NULL)
t2=sample(ts, k, replace = FALSE, prob = NULL)
t2=t1
d1 = data.frame(c1, t1)

d2 = data.frame (c2, t2)

dall = merge(x=d1, y=d2, by=NULL)

dall$w = dnorm(dall$t1-dall$t2, sd=sig)

sp <- ggplot(dall, aes(x=c1, y=c2))
sp + geom_point(alpha=dall$w/dnorm(0, sd = sig))

dcor = dall[dall$t1==dall$t2, ]

p2 <-ggplot(dcor, aes(x=c1, y=c2))
p2 + geom_point()

print(cor(dcor$c1, dcor$c2))

print(corr(dall[, c("c1", "c2")], dall$w))


if(F){
  dall = merge(x=di[, c(ci, "date", "WID")], y=dj[, c(j2, "date", "WID")], by=c("WID", "date"))
  dall$dt = as.numeric(dall$date.x - dall$date.y)
  dall[, c1 ] = log(dall[, c1 ])
  dall[, c2] = log(dall[, c2])
  is.na(dall) <- do.call(cbind,lapply(dall, is.infinite))
  dall = na.omit(dall)
  dall$w = dnorm(dall$t1-dall$t2, sd=sig)
  print(corr(dall[, c("c1", "c2")], dall$w))
}

