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

    it 'it is not valid if unit is empty' do
      apartment_params = {
        apartment: {
          street: '1513 Vietnam Drive' ,
          unit: nil,
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
      expect(response.status).to eq(422)
     
      apartment = JSON.parse(response.body)
      expect(apartment['unit']).to include("can't be blank")
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
      # p 'response', response
      expect(response.status).to eq(422)
      # p "Response Body:", JSON.parse(response.body)
   
      apartment = JSON.parse(response.body)
      expect(apartment['street']).to include("can't be blank")
    end
    it 'it is not valid if city is empty' do
      apartment_params = {
        apartment: {
          street: '1513 Vietnam Drive' ,
          unit: '1',
          city: nil,
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
        # p 'response', response
        expect(response.status).to eq(422)
        # p "Response Body:", JSON.parse(response.body)
      
        apartment = JSON.parse(response.body)
        expect(apartment['city']).to include("can't be blank")
    end
    
    it 'it is not valid if state is empty' do
      apartment_params = {
        apartment: {
          street: '1513 Vietnam Drive',
          unit: '1',
          city: 'Strike City',
          state: nil,
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
        # p 'response', response
        expect(response.status).to eq(422)
        # p "Response Body:", JSON.parse(response.body)
      
        apartment = JSON.parse(response.body)
        expect(apartment['state']).to include("can't be blank")
    end
    it 'it is not valid if square_footage is empty' do
      apartment_params = {
        apartment: {
          street: '1513 Vietnam Drive',
          unit: '1',
          city: 'Strike City',
          state: 'Delulu',
          square_footage: nil,
          price: '4000',
          bedrooms: 3,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://unsplash.com/photos/brown-wooden-house-near-green-trees-during-daytime-hEAGekaiJ8g',
          user_id: user.id
        }
      }
        post '/apartments', params: apartment_params
        # p 'response', response
        expect(response.status).to eq(422)
        # p "Response Body:", JSON.parse(response.body)
      
        apartment = JSON.parse(response.body)
        expect(apartment['square_footage']).to include("can't be blank")
    end
    it 'it is not valid if price is empty' do
      apartment_params = {
        apartment: {
          street: '1513 Vietnam Drive',
          unit: '1',
          city: 'Strike City',
          state: 'Delulu',
          square_footage: 2000,
          price: nil,
          bedrooms: 3,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://unsplash.com/photos/brown-wooden-house-near-green-trees-during-daytime-hEAGekaiJ8g',
          user_id: user.id
        }
      }
        post '/apartments', params: apartment_params
        # p 'response', response
        expect(response.status).to eq(422)
        # p "Response Body:", JSON.parse(response.body)
      
        apartment = JSON.parse(response.body)
        expect(apartment['price']).to include("can't be blank")
    end
    it 'it is not valid if bedrooms is empty' do
      apartment_params = {
        apartment: {
          street: '1513 Vietnam Drive',
          unit: '1',
          city: 'Strike City',
          state: 'Delulu',
          square_footage: 2000,
          price: '4000',
          bedrooms: nil,
          bathrooms: 2,
          pets: 'yes',
          image: 'https://unsplash.com/photos/brown-wooden-house-near-green-trees-during-daytime-hEAGekaiJ8g',
          user_id: user.id
        }
      }
        post '/apartments', params: apartment_params
        # p 'response', response
        expect(response.status).to eq(422)
        # p "Response Body:", JSON.parse(response.body)
      
        apartment = JSON.parse(response.body)
        expect(apartment['bedrooms']).to include("can't be blank")
    end
    it 'it is not valid if bathrooms is empty' do
      apartment_params = {
        apartment: {
            street: '1513 Vietnam Drive',
            unit: '1',
            city: 'Strike City',
            state: 'Delulu',
            square_footage: 2000,
            price: '4000',
            bedrooms: 3,
            bathrooms: nil,
            pets: 'yes',
            image: 'https://unsplash.com/photos/brown-wooden-house-near-green-trees-during-daytime-hEAGekaiJ8g',
            user_id: user.id
          }
        }
          post '/apartments', params: apartment_params
          # p 'response', response
          expect(response.status).to eq(422)
          # p "Response Body:", JSON.parse(response.body)
        
          apartment = JSON.parse(response.body)
          expect(apartment['bathrooms']).to include("can't be blank")
    end
    it 'it is not valid if pets is empty' do
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
        pets: nil,
        image: 'https://unsplash.com/photos/brown-wooden-house-near-green-trees-during-daytime-hEAGekaiJ8g',
        user_id: user.id
        }
      }
        post '/apartments', params: apartment_params
        # p 'response', response
        expect(response.status).to eq(422)
        # p "Response Body:", JSON.parse(response.body)
      
        apartment = JSON.parse(response.body)
        expect(apartment['pets']).to include("can't be blank", "is not included in the list")
    end
    it 'it is not valid if image is empty' do
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
          image: nil,
          user_id: user.id
        }
      }
        post '/apartments', params: apartment_params
        # p 'response', response
        expect(response.status).to eq(422)
        # p "Response Body:", JSON.parse(response.body)
      
        apartment = JSON.parse(response.body)
        expect(apartment['image']).to include("can't be blank")
    end
  end              
end




