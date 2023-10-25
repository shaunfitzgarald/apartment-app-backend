class Apartment < ApplicationRecord
    belongs_to :user
    validates :street, presence: true
    validates :unit, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :square_footage, numericality: true, presence: true
    validates :price, presence: true
    validates :bedrooms, numericality: true, presence: true
    validates :bathrooms, numericality: true, presence: true
    validates :pets, presence: true
    validates :pets, inclusion: { in: ['yes', 'no'] }
    validates :image, presence: true

end
