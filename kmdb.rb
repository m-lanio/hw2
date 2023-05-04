# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Studio.destroy_all 
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# Models generated using the rails generate model [ModelName]
# Table structure defined in the respective Model migration files.
# Overall tables and structure can be found in the schema.rb file

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

# Studio population
new_studio = Studio.new
new_studio["name"] = "Warner Bros."
new_studio.save
# Used 'puts Studio.all.inspect' to check that the studio had been succesfully created

#Movies population
b_begins = Movie.new
b_begins["title"] = "Batman Begins"
b_begins["year_released"] = "2005"
b_begins["rated"] = "PG-13"
b_begins["studio_id"] = Studio.find_by({ "name" => "Warner Bros." })["id"]
b_begins.save

# Confirmed that the Movie is being correctly associated with the proper studio by comparing puts Studio.all.inspect
# and puts Movie.all.inspect

dark_knight = Movie.new
dark_knight["title"] = "The Dark Knight"
dark_knight["year_released"] = "2008"
dark_knight["rated"] = "PG-13"
dark_knight["studio_id"] = Studio.find_by({ "name" => "Warner Bros." })["id"]
dark_knight.save

dark_rises = Movie.new
dark_rises["title"] = "The Dark Knight Rises"
dark_rises["year_released"] = "2012"
dark_rises["rated"] = "PG-13"
dark_rises["studio_id"] = Studio.find_by({ "name" => "Warner Bros." })["id"]
dark_rises.save

#Actors population
c_bale = Actor.new
c_bale["name"] = "Christian Bale"
c_bale.save

m_caine = Actor.new
m_caine["name"] = "Michael Caine"
m_caine.save

l_neeson = Actor.new
l_neeson["name"] = "Liam Neeson"
l_neeson.save

k_holmes = Actor.new
k_holmes["name"] = "Katie Holmes"
k_holmes.save

g_oldman = Actor.new
g_oldman["name"] = "Gary Oldman"
g_oldman.save

h_ledger = Actor.new
h_ledger["name"] = "Heath Ledger"
h_ledger.save

a_eckhart = Actor.new
a_eckhart["name"] = "Aaron Eckhart"
a_eckhart.save

m_gyllenhaal = Actor.new
m_gyllenhaal["name"] = "Maggie Gyllenhaal"
m_gyllenhaal.save

t_hardy = Actor.new
t_hardy["name"] = "Tom Hardy"
t_hardy.save

j_gordon = Actor.new
j_gordon["name"] = "Joseph Gordon-Levitt"
j_gordon.save

a_hathaway = Actor.new
a_hathaway["name"] = "Anne Hathaway"
a_hathaway.save

# Roles population
b_wayne = Role.new
b_wayne["movie_id"] = Movie.find_by({ "title" => "Batman Begins" })["id"]
b_wayne["actor_id"] = Actor.find_by({ "name" => "Christian Bale" })["id"]
b_wayne["character_name"] = "Bruce Wayne"
b_wayne.save

puts b_wayne.inspect

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
