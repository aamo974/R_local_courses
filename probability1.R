library(combinat)
library(gtools)

# beads <- rep(c("red","blue"), time = c(2,3))
 
# B <- 10000
# events  <- replicate(B, sample(beads, replace = TRUE))
# tab <- table(events)
 
# prop.table(tab)
 
# numbers <- c("Ace","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Jack","Queen","King")
# suits <- c("Diamonds","Clubs","Hearts","Spades")
 
# deck <- expand.grid(number = numbers, suit = suits)
# deck <- paste(deck$number,deck$suit)
 
# kings <- paste("King",suits)
# mean(deck %in% kings)

# hands <- permutations(52,2,v = deck)


# all_phone_numbers <- permutations(10, 7, v = 0:9)
# n <- nrow(all_phone_numbers)
# index <- sample(n,5)
# all_phone_numbers[index,]

# first_card <- hands[,1]
# second_card <- hands[,2]
# 
# sum(first_card %in% kings & second_card %in% kings) / sum(first_card %in% kings)
# 
# aces <- paste("Ace",suits)
# 
# facecard <- c("King","Queen","Jack","Ten")
# facecard <- expand.grid(number = facecard, suit = suits)
# facecard <- paste(facecard$number,facecard$suit)
# 
# hands <- combinations(52,2,v = deck)
# mean(hands[,1] %in% aces & hands[,2] %in% facecard)
# 
# # code for B=10,000 hands of blackjack
# B <- 10000
# results <- replicate(B, {
#   hand <- sample(deck, 2)
#   (hand[1] %in% aces & hand[2] %in% facecard) | (hand[2] %in% aces & hand[1] %in% facecard)
# })
# mean(results)


# checking for duplicated bdays in one 50 person group
n <- 50
bdays <- sample(1:365, n, replace = TRUE)
any(duplicated(bdays))
# 
# 
# B <- 10000
# results <- replicate(B, {
#   bdays <- sample(1:365,n, replace = TRUE)
#   any(duplicated(bdays))
# })

mean(results)

prob <- sapply(n, compute_prob)

exact_prob <- function(n) {
  prob_unique <- seq(365,365-n+1)/365
  1 - prod(prob_unique)
}

eprob <- sapply(n, exact_prob)
plot(n,eprob)
lines(n, eprob, col = "red")





