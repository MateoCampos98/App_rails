require "rails_helper"
require "byebug"

feature "Products Home", :type => :feature do

  let!(:product1) { create(:product) }
  let!(:product2) { create(:product) }

  product_attributes = {
      title: 'Small Plastic Pants',
      description: 'These pants are made of small plastic.',
      price: 29
    }

  it 'allows to create a new product' do
    visit new_product_path
    expect(page).to have_http_status(:success)
    expect(page).to have_selector('form')
    fill_in 'Title', with: product_attributes[:title]
    fill_in 'Description', with: product_attributes[:description]
    fill_in 'Price', with: product_attributes[:price]
    click_button "Create Product"
    # The address you have in the controller depends on this.
    expect(page).to have_current_path(products_path)
    # Verify in BD that this product is.
    product_created = Product.all.last
    expect(product_created.title).to eq(product_attributes[:title])
    expect(product_created.description).to eq(product_attributes[:description])
    expect(product_created.price).to eq(product_attributes[:price])
  end

  it 'render an edit(update) product form' do
    updated_title = "Updated Title"
    updated_description = "Updated description"
    update_price = 19
    visit edit_product_path(product1)
    expect(page).to have_http_status(:success)
    expect(page).to have_selector('form')
    fill_in 'Title', with: updated_title
    fill_in 'Description', with: updated_description
    fill_in 'Price', with: update_price
    click_button "Update Product"
    expect(page).to have_current_path(products_path)
    product1.reload
    expect(product1.title).to eq(updated_title)
    expect(product1.description).to eq(updated_description)
    expect(product1.price).to eq(update_price)
  end

  it 'can delete products' do
    visit product_path(product1)
    expect(page).to have_http_status(:success)

    current_products = Product.all.count
    click_link "Eliminar producto"
    expect(page).to have_current_path(products_path)
    expect(Product.exists?(product1.id)).to be_falsey
    expect(current_products - 1).to eq(Product.all.count)
  end
end