#Week 4: dplyr package

install.packages("bslib")


#Task: Write the function to get a dataset from Base R: Titanic
#and give the dataframe a new name of your choice
#(hint: you will want your data to be a dataframe. Use the function: as.data.frame(Titanic))

data(Titanic)
titanic_as_data_frame <- as.data.frame(Titanic)


#See the top rows of the data
#TASK: Write the function to see the top rows of the data

head(Titanic)


#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr

install.packages("dplyr")


#Let's just see the Survived and Sex columns
#Task: Write the function to 'select' the Survived and Sex columns 
#(hint: use the 'select' function)

titanic_as_data_frame_subset <- select(titanic_as_data_frame, Survived, Sex)
print(titanic_as_data_frame_subset)


#Let's name the dataset with just the two columns, Survived and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name

titanic_surv_sex <- titanic_as_data_frame_subset


#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)

titanic_surv_sex_no_sex <- select(titanic_surv_sex, -Sex)


#Let's rename a column name
#TASK: Write the function that renames 'Sex' to 'Gender'

titanic_surv_sex <- rename(titanic_surv_sex, Gender = Sex)


#Let's make a new dataframe with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column

titanic_df_renamed <- titanic_surv_sex


#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'

male_df <- filter(titanic_df_renamed, Gender == "Male")


#Let's 'arrange' our data by gender (not the data you just filtered)
#TASK: Write the function to group the data by gender (hint: arrange())

titanic_df_arranged <- arrange(titanic_df_renamed, Gender)


#Let's see how many people were examined in the dataset (total the frequency in the original dataframe)
#TASK: Sum the Freq column

sum(titanic_as_data_frame$Freq)


#TASK: After you run it, write the total here:____2201

2201


#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'

female_df <- filter(titanic_df_renamed, Gender == "Female")


#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')

union(male_df, female_df)
checkifmerged <- bind_rows(male_df, female_df)


#Optional Task: add any of the other functions 
#you learned about from the dplyr package

help("dplyr")
titanic_mutated <- mutate(titanic_as_data_frame, MF = ifelse(Sex == "Male", "Ga", "Gb")) #adds new variables that are functions of existing variables
summarise(titanic_as_data_frame, MF = "Guga") #reduces multiple values down to a single summary.
arrange(titanic_mutated, desc(MF)) #changes the ordering of the rows.
