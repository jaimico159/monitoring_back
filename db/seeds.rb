# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Engineer.create!([
                   {
                     first_name: 'Barbara',
                     last_name: 'Aliaga',
                     display_name: 'Barbara A.'
                   },
                   {
                     first_name: 'Lennart',
                     last_name: 'Sönke',
                     display_name: 'Lennart S.'
                   },
                   {
                     first_name: 'Benjamin',
                     last_name: 'Cuadros',
                     display_name: 'Benjamin C.'
                   }
                 ])
