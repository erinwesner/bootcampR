################################################################################
#                                                                              #
#                      Erdos Institute Code Bootcamp for R                     #
#                                 ------------                                 #
#                   Day 5 - Tidy Data with Tibbles and Tidyr                   #
#                                 ------------                                 #
#                 Collin McCabe | collinmichaelmccabe@gmail.com                #
#                                                                              #
################################################################################

# All examples in this session are taken directly from Garrett Grolemund and 
# Hadley Wickham's online book, R for Data Science, specifically, the chapter on
# Tidy Data (http://r4ds.had.co.nz/tidy-data.html). We will be referring to this
# material throughout lecture today.

# Today, we'll talk about cleaning our data once we have read it into R. For 
# this, we will first discuss storing data in tibbles vs. data frames, as well
# as a new class of data which can be very useful for data analysis, the factor
library("tibble")

# Before we get really into the package functionality today, 

# CRAN page for a package
url("https://cran.r-project.org/web/packages/tibble/")

# User manual for the package
url("https://cran.r-project.org/web/packages/tibble/tibble.pdf")

# Vignettes are great for seeing a package "in action"
url("https://cran.r-project.org/web/packages/tibble/vignettes/tibble.html")

# Make a tibble using vertices and names
A <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
B <- c(TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE)
C <- c("M", "F", "M", "M", "O", "F", "F", "M", "M", "O")
tibble(number = A, bool = B, sex = C)

# Tibbles will not be created if any column is shorter than another
D <- c("x", "y", "z")
tibble(number = A, bool = B, sex = C, letters = D)

# Factors are really just strings with a defined set of possible values
sexfac <- factor(C)
sexfac <- factor(C, levels = c("F", "M", "O", "Prefer not to say"))
class(sexfac)
levels(sexfac)
tibble(number = A, bool = B, `User sex` = sexfac)

# By default, characters are imported as factors in base R, but a lot of times,
# this isn't what you want, so tidyverse functions by default import all 
# character strings as non-factors, which means you have to explicity change 
# them back to factors...

# You can also coerce regular data frames into tibbles
as_tibble(mtcars)

# Now for data cleaning with R - today we will do a lot of this learning outside
# of R or Rstudio
library("tidyr")

# If you want to learn more about a package, the best place to start is with
# vignettes on the CRAN site
url("https://cran.r-project.org/web/packages/tidyr/vignettes/tidy-data.html")

# But instead, let's actually use Hadley Wickham's online book to learn tidyr :)
url("http://r4ds.had.co.nz/tidy-data.html")






### LEARNING FROM TEH INTERWEBZ TODAY ###






# Now, let's practice tidying with the who dataset, a very non-tidy set included
#  with tidyr. To check it out in an interactive editor, use the function View()
View(who)

# And since this dataset is already included with the package, we can find out 
# more about it with the single ? help command
?who

# Now- make who tidy!

who1 <- gather(who, "code", "value", 5:60)
who1 <- separate(who1, code, c("new", "var", "sexage"))
who1 <- View(separate(who1, sexage, c("sex", "age"), sep = 1))
who1 <- spread(who1, var, value)