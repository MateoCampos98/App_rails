namespace :import do
  desc "Import categories from CSV"
  task categories: :environment do
    require 'csv'

    CSV.foreach('db/csv/categories.csv', headers: true) do |row|
      Category.create(name: row['name'])
    end
  end

  desc "Import products from CSV"
  task products: :environment do
    require 'csv'

    CSV.foreach('db/csv/products.csv', headers: true ) do |row|
      Product.create(
        title: row['title'],
        description: row['description'],
        price: row['price'].to_i,
        category_id: row['category_id'].to_i
      )
    end
  end
end
