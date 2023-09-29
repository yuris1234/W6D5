# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ApplicationRecord.transaction do
    # Destroy tables (not necessary if using rails db:seed:replant)
    puts 'Destroying tables...'
    Cat.destroy_all

    puts 'Resetting id sequences...'
    %w(cats).each do |table_name|
        ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end

    puts 'Seeding database...'
    Cat.create!(name: 'Yuri', birth_date: Date.new(2001,2,1), color: "Red", sex: "F")
    Cat.create!(name: 'Jacob', birth_date: Date.new(2000,3,1), color: "Blue", sex: "M", description: "Sick")
    puts "Done!"
end