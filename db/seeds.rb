# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Paint.destroy_all
Artist.destroy_all

coyote = Artist.create!(name: 'Criminal Coyote', sponsored: false, rank: 9) 
lava = coyote.paints.create!(name: 'Lava Orange', 
                      brand: 'MTN 94', 
                      high_pressure: false, 
                      opacity: 3) 
black = coyote.paints.create!(name: 'Black', 
                      brand: 'Montana', 
                      high_pressure: true, 
                      opacity: 5) 
malachite = coyote.paints.create!(name: 'Malachite', 
                                  brand: 'Molotow', 
                                  high_pressure: false, 
                                  opacity: 4)

graves = Artist.create!(name: 'Mike Graves', sponsored: true, rank: 7) 
toffee = graves.paints.create!(name: 'Toffee', 
                      brand: 'Montana', 
                      high_pressure: false, 
                      opacity: 3) 
latte = graves.paints.create!(name: 'Latte', 
                              brand: 'Montana', 
                              high_pressure: false, 
                              opacity: 4) 
hazel = graves.paints.create!(name: 'Hazelnut', 
                              brand: 'Molotow', 
                              high_pressure: true, 
                              opacity: 5) 
      
mars = Artist.create!(name: 'Farris Mars', sponsored: true, rank: 8)
shrimp = mars.paints.create!(name: 'Shrimp', 
                             brand: 'Montana', 
                             high_pressure: false, 
                             opacity: 5)
beast = mars.paints.create!(name: 'Beast', 
                            brand: 'Mtn 94', 
                            high_pressure: true, 
                            opacity: 2)