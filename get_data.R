library(tidyverse)
library(tidycensus)


x <- get_acs(
  geography = "tract",
  variables = c(total = "B15003_001", 
                bachelor = "B15003_022", 
                masters = "B15003_023",
                professional = "B15003_024", 
                doctorate = "B15003_025"),
  county = "Los Angeles",
  state = "CA",
  year = 2022,
  geometry = TRUE,
  output = "wide"
) |> 
  mutate(pct_bachelors_or_higher = 100 * (
    bachelorE + mastersE + professionalE + doctorateE) / totalE)

write_rds(x, "la.rds")
