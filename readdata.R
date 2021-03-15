library(tidyverse)
library(readxl)
dat_sad <- read_excel ("dat_sad.xlsx")
attach(dat_sad)
dat_sad$citation <- paste(author, pub_year)
dat_sad$study_diag <- with(dat_sad, interaction(study, diag_id))
dat_sad$citation_diag <- with(dat_sad, interaction(citation, diag_id))
detach(dat_sad)
# aggregate by individidual studies
dat_sad <- group_by(dat_sad, citation_diag)
dat_sad1 <- filter(dat_sad, row_number()==1 )


dat_sad2 <- ungroup(dat_sad1)
table1 <- select(dat_sad2, pub_year, crop,  pathogen, pathogen_group, organ,  citation, link1, link, link2)
table1 <- arrange(table1, -pub_year)
table1 <- unite(table1, weblink, link1, link, link2, sep = "")
