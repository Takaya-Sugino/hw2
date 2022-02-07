# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy
# - Movie data includes the movie title, year released, MPAA rating,
#   and director
# - A movie has a single director
# - A person can be the director of and/or play a role in a movie
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Execute the migration files to create the tables in the database. Add the
#   relevant association methods in each model. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids and
#   delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through it to display output similar to the following
#   sample "report". (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time, before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Christopher Nolan
# The Dark Knight        2008           PG-13  Christopher Nolan
# The Dark Knight Rises  2012           PG-13  Christopher Nolan

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
# TODO!

# Generate models and tables, according to the domain model
# TODO!

# Insert data into your database that reflects the sample data shown above
# Do not use hard-coded foreign key IDs.
# TODO!

# Prints a header for the movies output

# Query the movies data and loop through the results to display the movies output
# TODO!

# Prints a header for the cast output

# Query the cast data and loop through the results to display the cast output for each movie
# TODO!

Movie.destroy_all
Person.destroy_all
Role.destroy_all

# Adding Batman Begins data to Movie table 
values = {title: "Batman Begins", year_released: 2005, rated: "PG-13" }
movie = Movie.new(values)
movie.save

role = Role.new({character_name: "Bruce Wayne", movie_id: movie.id} )
role.save
role = Role.new({character_name:"Alfred", movie_id: movie.id})
role.save
role = Role.new({character_name:"Ra's AL Ghul", movie_id: movie.id})
role.save
role = Role.new({character_name:"Rachel Dawes", movie_id: movie.id})
role.save
role = Role.new({character_name:"Commissioner Gordon", movie_id: movie.id})
role.save

# Adding The Dark Knight data to Movie table 
values = { title: "The Dark Knight", year_released: 2008, rated: "PG-13" }
movie = Movie.new(values)
movie.save

role = Role.new({character_name: "Bruce Wayne", movie_id: movie.id})
role.save
role = Role.new({character_name: "Joker", movie_id: movie.id})
role.save
role = Role.new({character_name: "Harvey Dent", movie_id: movie.id})
role.save
role = Role.new({character_name: "Alfred", movie_id: movie.id})
role.save
role = Role.new({character_name: "Rachel Dawes", movie_id: movie.id})
role.save

# Adding The Dark Knight Rises data to movies table
values = { title: "The Dark Knight Rises", year_released: 2012, rated: "PG-13" }
movie = Movie.new(values)
movie.save

role = Role.new({character_name: "Bruce Wayne", movie_id: movie.id})
role.save
role = Role.new({character_name: "Commissioner Gordon", movie_id: movie.id})
role.save
role = Role.new({character_name: "Bane", movie_id: movie.id})
role.save
role = Role.new({character_name: "John Blake", movie_id: movie.id})
role.save
role = Role.new({character_name:"Selina Kyle", movie_id: movie.id})
role.save

# Linking Christopher Nolan with three movies 
person = Person.new({name: "Christopher Nolan"})
person.save

movie = Movie.where({title: "Batman Begins"})[0]
movie.person_id = person.id
movie.save

movie = Movie.where({title: "The Dark Knight"})[0]
movie.person_id = person.id
movie.save

movie = Movie.where({title: "The Dark Knight Rises"})[0]
movie.person_id = person.id
movie.save

# Adding actors to people table and linking them with Batman Begins movie
movie = Movie.where({title: "Batman Begins"})[0]

person = Person.new({name: "Christian Bale"})
person.save
role = Role.new({character_name: "Bruce Wayne", movie_id: movie.id, person_id: person.id})
role.save

person = Person.new({name: "Michael Caine"})
person.save
role = Role.new({character_name: "Alfred", movie_id: movie.id, person_id: person.id})
role.save

person = Person.new({name: "Liam Neeson"})
person.save
role = Role.new({character_name: "Ra's Al Ghul", movie_id: movie.id, person_id: person.id})
role.save

person = Person.new({name: "Katie Holmes"})
person.save
role = Role.new({character_name: "Rachel Dawes", movie_id: movie.id, person_id: person.id})
role.save

person = Person.new({name: "Gary Oldman"})
person.save
role = Role.new({character_name: "Commissioner Gordon", movie_id: movie.id, person_id: person.id})
role.save

# Adding actors to people table and linking them with The Dark Knight movie
movie = Movie.where({title: "The Dark Knight"})[0]

person = Person.where({name: "Christian Bale"})[0]
role = Role.new({character_name: "Bruce Wayne", movie_id: movie.id, person_id: person.id})
role.save

person = Person.new({name: "Heath Ledger"})
person.save
role = Role.new({character_name: "Joker", movie_id: movie.id, person_id: person.id})
role.save

person = Person.new({name: "Aaron Eckhart"})
person.save
role= Role.new({character_name: "Harvey Dent", movie_id: movie.id, person_id: person.id})
role.save

person = Person.where({name: "Michael Caine"})[0]
role= Role.new({character_name: "Alfred", movie_id: movie.id, person_id: person.id})
role.save

person = Person.new({name: "Maggie Gyllenhaal"})
person.save
role= Role.new({character_name: "Rachel Dawes", movie_id: movie.id, person_id: person.id})
role.save

# Adding actors to people table and linking them with The Dark Knight Rises movie
movie = Movie.where({title: "The Dark Knight Rises"})[0]

person = Person.where({name: "Christian Bale"})[0]
role = Role.new({character_name: "Bruce Wayne", movie_id: movie.id, person_id: person.id})
role.save

person = Person.where({name: "Gary Oldman"})[0]
role = Role.new({character_name: "Commissioner Gordon", movie_id: movie.id, person_id: person.id})
role.save

person = Person.new({name: "Tom Hardy"})
person.save
role= Role.new({character_name: "Bane", movie_id: movie.id, person_id: person.id})
role.save

person = Person.new({name: "Joseph Gordon-Levitt"})
person.save
role= Role.new({character_name: "John Blake", movie_id: movie.id, person_id: person.id})
role.save

person = Person.new({name: "Ann Hathaway"})
person.save
role= Role.new({character_name: "Selina Kyle", movie_id: movie.id, person_id: person.id})
role.person_id = person.id
role.save

puts "Movies"
puts "======"
puts ""

for movie in Movie.all
    puts "#{movie.title} #{movie.year_released} #{movie.rated} #{movie.director}"
end

puts ""
puts "Top Cast"
puts "========"
puts ""

for movie in Movie.all
    for role in movie.roles
        puts "#{movie.title} #{role.actor} #{role.character_name}"
    end
end
