class Apartment < ApplicationRecord
    belongs_to :user
    validates :street, :unit, :city, :state, :price, :pets, :image, :user_id, presence: true
    validates :square_footage, numericality: true, presence: true
    validates :bedrooms, numericality: true, presence: true
    validates :bathrooms, numericality: true, presence: true
    validates :pets, inclusion: { in: ['yes', 'no'] }
end
