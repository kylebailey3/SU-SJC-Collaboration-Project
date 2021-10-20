patents=read.csv("patents_8.csv", header = TRUE)
View(patents)

# Which category has seen the highest number of patents being filed? 
table(patents$ptype)
# Utility Category 


#Country having the highest number of patent applications?
table(patents$ee_country)
# The US


# Patent with the most forward citations 
patents[which.max(patents$forward_cites),c(1,7)]
patents$forward_cites[which.max(patents$forward_cites)]
# Patent with highest forward citations is patent with patnum=12353.
#It has been cited in 893 other patents.


# Which company has filed highest number of patents? 
table(patents$ee_role_desc)
# Foreign companies and corporations have filed the highest number of patents.
# U.S. state government has applied for least number of patents.

# Country with the highest and lowest grant duration?
patents$approval_time= patents$grantyear - patents$applyear
A=aggregate(approval_time ~ ee_country,data = patents,FUN = mean)
which.min(A$approval_time)

pat_us=filter(patents,ee_country=="US")
View(pat_us)


# Which state has filed for the highest number of patents?
table(pat_us$ee_state)
# CA, California has filed for the highest number of patents.
# HI, Hawaii has filed the lowest number of patents. 


# State with extreme approval times.
X=aggregate(approval_time ~ ee_state,data = pat_us,FUN = mean)
X$ee_state[which.min(X$approval_time)]
min(X$approval_time)
# On an average Hawaii grants a patent within a year of applying.
# Hawaii is the state with lowest approval time.
X$ee_state[which.max(X$approval_time)]
max(X$approval_time)
# On an average Delaware grants a patent in about 3.3 years of applying.
# Delaware is the state with highest approval time.

# City with highest number of patents?
tail(sort(table(pat_us$ee_city)))
# Armonk city has the highest number of patents filed at 750.






