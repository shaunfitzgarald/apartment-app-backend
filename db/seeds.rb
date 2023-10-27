user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")
user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

apt1 = [
  {
    street: '124 Laptop Street',
    unit:'101',
    city: 'Meta Bottom', 
    state: 'Encrypted Ocean',
    square_footage: 1200,
    price: '$1,200',
    bedrooms: 2, 
    bathrooms: 2, 
    pets: 'yes',
    image: 'https://cdn1.epicgames.com/ue/product/Screenshot/R4-1920x1080-46e077232c634246fed48c6d346f9a5d.jpg?resize=1&w=1920'
  },
  {
    street: '456 Connection Lane',
    unit:'B2',
    city: 'Network City', 
    state: 'Pixel Ocean',
    square_footage: 800,
    price: '$2,000',
    bedrooms: 1, 
    bathrooms: 1, 
    pets: 'no',
    image: 'https://cdn1.epicgames.com/ue/product/Screenshot/R3-1920x1080-7eff10a3cb2075e4c4b3acd5e9360b0f.jpg?resize=1&w=1920'
  }
]

apt2 = [
  {
    street: '223 Circuit Lane',
    unit:'7',
    city: 'HardwareVille', 
    state: 'Chip State',
    square_footage: 3000,
    price: '$1,000',
    bedrooms: 3, 
    bathrooms: 2, 
    pets: 'yes',
    image: 'https://cdn1.epicgames.com/ue/product/Screenshot/Shot011-1920x1080-3299b942194992ebe4c9e25cd664d00b.jpg?resize=1&w=1920'
  },
  {
    street: '123 Wire Way',
    unit:'C4',
    city: 'Internet Town', 
    state: 'LAN Bay',
    square_footage: 1500,
    price: '$4,000',
    bedrooms: 1, 
    bathrooms: 2, 
    pets: 'no',
    image: 'https://blenderartists.org/uploads/default/original/4X/9/c/6/9c6c7e4bdec39cba1e2b6be19f01ab38d5d8e118.jpeg
    '
  }
]

apt1.each do |apartment|
  user1.apartments.create!(apartment)
  p "creating #{apartment}"
end

apt2.each do |apartment|
  user2.apartments.create!(apartment)
  p "creating #{apartment}"
end