require 'rails_helper'

RSpec.describe "Apartments", type: :request do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  describe "GET /index" do
    it 'gets a list of apartments' do
      apartment = user.apartments.create(
        street: '1513 Vietnam Drive',
        unit: '1',
        city: 'Strike City',
        state: 'Delulu',
        square_footage: 2000,
        price: '4000',
        bedrooms: 3,
        bathrooms: 2,
        pets: 'yes',
        image: 'https://unsplash.com/photos/brown-wooden-house-near-green-trees-during-daytime-hEAGekaiJ8g'
      )
      get '/apartments'

      apartment = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(apartment.first['street']).to eq('1513 Vietnam Drive')
    end
  end

  # test for creating a new apartment will live here
  describe "POST /create" do
    it 'creates a new apartment' do
      apartment_params = {
        apartment: {
          street: '1513 Vietnam Drive',
          unit: '1',
          city: 'Strike City',
          state: 'Delulu',
          square_footage: 2000,
          price: '4000',
          bedrooms: 3,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://unsplash.com/photos/brown-wooden-house-near-green-trees-during-daytime-hEAGekaiJ8g',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params

      apartment = JSON.parse(response.body)

      expect(apartment['city']).to eq 'Strike City'
      expect(response).to have_http_status(200)
    end

    it 'it is not valid if street is empty' do
      apartment_params = {
        apartment: {
          street: nil ,
          unit: '1',
          city: 'Strike City',
          state: 'Delulu',
          square_footage: 2000,
          price: '4000',
          bedrooms: 3,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://unsplash.com/photos/brown-wooden-house-near-green-trees-during-daytime-hEAGekaiJ8g',
          user_id: user.id
        }
      }
      post '/apartments', params: apartment_params
      p "response", response
      # expect(response.status).to eq(422)
      # p "Response Body:", JSON.parse(response.body)
      # p "Status Code:", response.status

      apartment = JSON.parse(response.body)
      expect(apartment[:street]).to include("can't be blank")
      # # apartment.valid?
      # # p "errors", apartment.errors.full_messages
      # # expect(apartment['errors']['street']).to include("can't be blank")
    end

  end


end