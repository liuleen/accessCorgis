# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PRODUCTS_COUNT = 100

MAX_CATEGORIES = 3

MAX_VARIANTS = 4
VARIANTS_WEIGHT = 0.53

CATEGORIES = Faker::Base.fetch_all('commerce.department').map do |title|
  Category.find_or_create_by!(title: title)
end

PRODUCTS_COUNT.times do
  title = ''

  loop do
    title = Faker::Commerce.product_name
    break unless Product.exists?(title: title)
end

product = Product.new(
  title: title,
)
