require "rails_helper"

feature "Products Home", :type => :feature do

  let!(:product1) { create(:product) }
  let!(:product2) { create(:product) }

  it 'renders a list of products' do
    visit products_path
    expect(page).to have_http_status(:success)
    expect(page).to have_selector('.product', count: 2)
  end

  it 'renders a detailed product page' do
    visit product_path(product1)
    expect(page).to have_http_status(:success)
    expect(page).to have_selector('h1.title', text: product1.title)
    expect(page).to have_selector('p.description', text: product1.description)
    expect(page).to have_selector('span.price', text: product1.price.to_s)
  end

  it 'render a new product form' do
    visit new_product_path
    expect(page).to have_http_status(:success)
    expect(page).to have_selector('form')
  end
end 