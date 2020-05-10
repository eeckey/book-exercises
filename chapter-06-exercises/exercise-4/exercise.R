# Exercise 4: functions and conditionals

# Define a function `is_twice_as_long` that takes in two character strings, and 
# returns whether or not (e.g., a boolean) the length of one argument is greater
# than or equal to twice the length of the other.
# Hint: compare the length difference to the length of the smaller string
is_twice_as_long <- function(char1, char2) {
  count1 <- nchar(char1)
  count2 <- nchar(char2)
  difference <- abs(count1 - count2)
  min_length <- min(count1, count2)
  boolean <- difference >= min_length * 2
  return(boolean)
}

# Call your `is_twice_as_long` function by passing it different length strings
# to confirm that it works. Make sure to check when _either_ argument is twice
# as long, as well as when neither are!
is_twice_as_long("my name is emi", "hey")
is_twice_as_long("pear", "grapefruit")
is_twice_as_long("kiwi", "banana")

# Define a function `describe_difference` that takes in two strings. The
# function should return one of the following sentences as appropriate
#   "Your first string is longer by N characters"
#   "Your second string is longer by N characters"
#   "Your strings are the same length!"
describe_difference <- function(string1, string2) {
  difference <- nchar(string1) - nchar(string2)
  if (difference > 0) {
    output <- paste( "Your first string is longer by", difference, "characters")
  } else if (difference < 0) {
    output <- paste("Your second string is longer by", difference, "characters")
  } else {
    output <- "Your strings are the same length!"
  }
  return(output)
}

# Call your `describe_difference` function by passing it different length strings
# to confirm that it works. Make sure to check all 3 conditions1
describe_difference("my name is emi", "hey")
describe_difference("pear", "grapefruit")
describe_difference("papaya", "banana")


