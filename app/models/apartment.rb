class Apartment < ApplicationRecord
    belongs_to :user
    validates :street, presence: true
    # validates :unit, presence: true
    # validates :city, presence: true
    # validates :state, presence: true
    # validates :square_footage, numericality: true
    # validates :price, numericality: true
    # validates :bedrooms, numericality: { only_integer: true }
    # validates :bathrooms, numericality: { only_integer: true }
    # validates :pets, inclusion: { in: ['yes', 'no'] }
end
