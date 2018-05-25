# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Language.create!([
  {name: "Deutsch", abbreviation: "de"},
  {name: "English", abbreviation: "en"},
  {name: "Francais", abbreviation: "fr"}
])

q1 = Question.create!(
  {question: "Why not eat meat?", language: "en", slug: "why-not-eat-meat", published: true}
)
Argument.create!(
  {argument: "<p>Because the meat industry <strong>is mostly cruel to animals</strong>. The meat industry <strong>isn't interested in animal welfare</strong>, it is <strong>interested in making profit</strong>. Making profit and treating animals well are often <strong>incompatible</strong> because treating animals well is demanding.</p>\r\n<p>What do you think does the meat industry care more about? Good salaries or animal welfare?</p>\r\n<p>In case you need proof that the meat industry isn't \"animal-friendly\", take a look at this link: <a href=\"https://www.rollingstone.com/feature/belly-beast-meat-factory-farms-animal-activists\">https://www.rollingstone.com/feature/belly-beast-meat-factory-farms-animal-activists</a></p>", slug: "because-the-meat-industry-is-mostly-cruel-to-animals", published: true, question_id: q1.id, language: "en", author: "Sandro Räss", url: "https://www.rollingstone.com/feature/belly-beast-meat-factory-farms-animal-activists", title: "Because the meat industry is mostly cruel to animals."}
)
