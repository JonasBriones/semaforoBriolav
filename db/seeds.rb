# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

State.delete_all

state = State.create!([
  { id: 1, nombre: 'bien', descripcion: 'Buen Humor', imagen: '001-sonrisa.png' },
  { id: 2, nombre: 'mas_o_menos', descripcion: 'Mas o Menos', imagen: '003-esceptico.png' },
  { id: 3, nombre: 'mal', descripcion: 'Mal Humor', imagen: '002-triste.png'},
])
