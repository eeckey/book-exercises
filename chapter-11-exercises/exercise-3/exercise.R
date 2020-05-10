# Exercise 3: using the pipe operator

# Install (if needed) and load the "dplyr" library
#install.packages("dplyr")
library("dplyr")

# Install (if needed) and load the "fueleconomy" package
#install.packages('devtools')
#devtools::install_github("hadley/fueleconomy")
library("fueleconomy")

# Which 2015 Acura model has the best hwy MPG? (Use dplyr, but without method
# chaining or pipes--use temporary variables!)
filtered <- filter(vehicles, year == 2015, make == "Acura")
max_hwy <- filter(filtered, hwy == max(hwy))
temporary_variables_best_hwy <- select(max_hwy, "model")

# Which 2015 Acura model has the best hwy MPG? (Use dplyr, nesting functions)
nesting_functions_best_hwy <- select(
  filter(
    filter(
      vehicles, 
      year == 2015, 
      make == "Acura"
    ),
    hwy == max(hwy)
  ),
  model
)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr and the pipe operator)
pipe_operator_best_hwy <- vehicles %>%
  filter(year == 2015, make == "Acura") %>%
  filter(hwy == max(hwy)) %>% 
  select(model)

### Bonus

# Write 3 functions, one for each approach.  Then,
# Test how long it takes to perform each one 1000 times
