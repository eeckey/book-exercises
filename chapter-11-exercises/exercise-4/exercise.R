# Exercise 4: practicing with dplyr

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
# install.packages("nycflights13")
library("nycflights13")
library("dplyr")

# The data frame `flights` should now be accessible to you.
# Use functions to inspect it: how many rows and columns does it have?
# What are the names of the columns?
# Use `??flights` to search for documentation on the data set (for what the 
# columns represent)
View(flights)
dim(flights)
colnames(flights)
??flights

# Use `dplyr` to give the data frame a new column that is the amount of time
# gained or lost while flying (that is: how much of the delay arriving occured
# during flight, as opposed to before departing).
flights_mutated <- mutate(flights, gained_or_lost = dep_delay - arr_delay)

# Use `dplyr` to sort your data frame in descending order by the column you just
# created. Remember to save this as a variable (or in the same one!)
flights_sorted <- arrange(flights_mutated, -gained_or_lost)

# For practice, repeat the last 2 steps in a single statement using the pipe
# operator. You can clear your environmental variables to "reset" the data frame
flights_pipe <- flights %>% 
  mutate(gained_or_lost = dep_delay - arr_delay) %>% 
  arrange(-gained_or_lost)

# Make a histogram of the amount of time gained using the `hist()` function
hist(2, flights, gained_or_lost)
?hist()

# On average, did flights gain or lose time?
# Note: use the `na.rm = TRUE` argument to remove NA values from your aggregation
average_gained_or_lost <- flights_pipe %>% 
  summarize(
    mean_gained_or_lost = mean(gained_or_lost, na.rm = TRUE)
  )

# Create a data.frame of flights headed to SeaTac ('SEA'), only including the
# origin, destination, and the "gain_in_air" column you just created
flights_to_SeaTac <- flights_pipe %>% 
  filter(dest == "SEA") %>% 
  select(origin, dest, gained_or_lost)

# On average, did flights to SeaTac gain or lose time?
SEA_gained_or_lost <- flights_to_SeaTac %>% 
  summarize(
    mean_gained_or_lost = mean(gained_or_lost, na.rm = TRUE)
  )

# Consider flights from JFK to SEA. What was the average, min, and max air time
# of those flights? Bonus: use pipes to answer this question in one statement
# (without showing any other data)!
JFK_to_SeaTac <- flights_pipe %>% 
  filter(origin == "JFK", dest == "SEA") %>% 
  select(origin, dest, arr_time) %>% 
  summarize(
  mean_arr_time = mean(arr_time, na.rm = TRUE),
  max_arr_time = max(arr_time, na.rm = TRUE),
  min_arr_time = min(arr_time, na.rm = TRUE)
  )
