require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET index,  type: categories" do
    it "renders the index template" do
      get '/categories'
      expect(response).to render_template('index')
    end
  end
  
  describe "Categories", type: :request do
    describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates the category' do
        post :create, category: attributes_for(:category)
        expect(Category.count).to eq(1)
      end
    end
  end
end

 
  # describe "GET #new" do
  #   it "assigns a new Category to @category"
  #   it "renders the :new template"
  # end

# describe "DELETE categories#destroy" do
#   it "should delete a category" do
#     visit category_url
#     page.should have_link("Delete")
#     expect { click_link "Delete" }.to change(Category, :count).by(-1)
#   end
# end
end