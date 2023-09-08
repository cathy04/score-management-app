# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Team.create([
	{name: "Alpha", details: "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page es"},
	{name: "Omega", details: "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum"},
    {name: "Beta", details: "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum"},
    {name: "Gamma", details: "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum"},
])

Player.create([
	{team_id: 1, age: "20", fullname: "Jon Doe", post: "attaquant"},
    {team_id: 1, age: "12", fullname: "Jon Doe", post: "attaquant"},
    {team_id: 1, age: "14", fullname: "Jon Doe", post: "attaquant"},
    {team_id: 1, age: "16", fullname: "Jon Doe", post: "attaquant"},
	{team_id: 2, age: "12", fullname: "Jon Doe", post: "attaquant"},
	{team_id: 2, age: "17", fullname: "Jon Doe", post: "attaquant"},
	{team_id: 2, age: "16", fullname: "Jon Doe", post: "attaquant"},
	{team_id: 2, age: "19", fullname: "Jon Doe", post: "attaquant"},
    {team_id: 3, age: "23", fullname: "Jon Doe", post: "attaquant"},
    {team_id: 3, age: "22", fullname: "Jon Doe", post: "attaquant"},
    {team_id: 3, age: "26", fullname: "Jon Doe", post: "attaquant"},
    {team_id: 3, age: "20", fullname: "Jon Doe", post: "attaquant"},
    {team_id: 4, age: "12", fullname: "Jon Doe", post: "attaquant"},
    {team_id: 4, age: "19", fullname: "Jon Doe", post: "attaquant"},
    {team_id: 4, age: "18", fullname: "Jon Doe", post: "attaquant"},
    {team_id: 4, age: "17", fullname: "Jon Doe", post: "attaquant"},
])
