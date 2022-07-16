require 'rails_helper'

RSpec.describe 'recipe index page' do
  before :each do
    @recipe_1 = Recipe.create!(name: 'B.T.M.', complexity: 1, genre: "American")
    @recipe_2 = Recipe.create!(name: 'B.L.T.', complexity: 1, genre: "American")
  end

  it 'shows a list of recipes and there attributes' do
    visit '/recipes'

    expect(page).to have_content('B.L.T.')
    expect(page).to have_content('1')
    expect(page).to have_content('American')
  end

  it 'orders by title' do

    visit '/recipes'

    within '#recipe-0' do
      expect(page).to have_content("B.L.T.")
    end

    within '#recipe-1' do
      expect(page).to have_content("B.T.M.")
    end
  end
end
