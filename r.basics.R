install.packages('neon')
install.packages('tidyverse')
install.packages('usethis')
library(dplyr)
library(readr)


# assigning a CSV to a variable
cakes <- read_csv(
  'name,cake_flavor,frosting_flavor,topping
Red Velvet Cake,chocolate,cream cheese,strawberries
Birthday Cake,vanilla,vanilla,rainbow sprinkles')

#writing a CSV object back into a csv
write_csv(cakes, 'cakes')

# the pipe operator (%>%) passes the object to the left as the first argument into the 
# function on the right)
cakes %>%
  head()
# the above function is the same as head(cakes)

# using the select function, you can return a data frame with only specified columns
cake_flavors <- 
  cakes %>%
  select(cake_flavor)
print(cake_flavors)

# the select function can also be used to explicitly remove columns from the return
toppings <-
  cakes %>%
  select(-name, -cake_flavor, -frosting_flavor)
print(toppings)

#the filter function will return a dataframe matching the specified results
birthday <-
  cakes %>%
  filter(name == 'Birthday Cake')

# using the OR operator in a filter
cream_cheese_or_rainbow_sprinkles <-
  cakes %>%
  filter(frosting_flavor == 'cream cheese' | topping == 'rainbow sprinkles')

# when using the not operator, the following conditional must be wrapped in parens
not_chocolate <-
  cakes %>%
  filter(!(cake_flavor == 'chocolate'))

# THE FOLLOWING IS AN EXAMPLE OF ARRANGING A DATAFRAME. COULD BE USED TO RANK CANDIDATES IN SMARTABSE FOR DASHBOARDS

candidate_results <- read_csv(
  'name,score,deadlift,run time
John Doe,99,405,6:05
Carl Smith,84,315,7:24
Ben Dover, 60, 225, 9:56')

ordered_results <-
  candidate_results %>%
  arrange(desc(score))
print(ordered_results)


# This is using variables that I don't have locally, but is an example of how to chain pipes.
artists <- 
  artists %>%
  select(-country, -year_founded,albums) %>%
  filter(spotify_monthly_listeners > 20000000, !(genre == 'Hip Hop'))
print(head(artists))

# Bigger example

artists <- artists %>%
  select(-country, -year_founded, -albums) %>%
  filter(spotify_monthly_listeners > 20000000, !(genre == 'Hip Hop')) %>%
  arrange(desc(youtube_subscribers))
head(artists)
