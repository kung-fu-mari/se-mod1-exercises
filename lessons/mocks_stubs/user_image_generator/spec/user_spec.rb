require 'rspec'
require './lib/image_generator'
require './lib/user'

RSpec.describe User do
  describe '#initialize' do
    it 'exists' do
      # I pass a real image generator object - this is potentially slow and costly
      # Lets mock this object whenever possible

      image = ImageGenerator.new(20)
      user = User.new("t@gmail.com", image)
      expect(user).to be_a User
    end

    it 'has attributes' do
      #I don't need an actual ImageGenerator object. I use a mock instead.
      mock_image_generator = instance_double("Image", max_image_size: 45)
      user = User.new("t@gmail.com", mock_image_generator)

      expect(user.email).to eq "t@gmail.com"
      expect(user.image_generator).to eq mock_image_generator
    end
  end
  describe '#methods' do
    let(:mock_image_generator) { instance_double("Image", max_image_size: 45)}
    let(:user) { User.new("t@gmail.com", mock_image_generator) }

    it 'changes_its_id' do
      id = user.id
      expect(user.id).to eq(id)    
      user.change_id_via_user_input
      expect(user.id).not_to eq(id)
    end

    it 'stores images' do
      allow(mock_image_generator).to receive(:generate_images).and_return(["image0","image1", "image2"])
      allow(mock_image_generator).to receive(:random_image).and_return(["imageRand"])

      expect(user.add_image_generators("imageA")).to eq ['imageA'] 
      expect(user.assign_new_random_image).to eq ["imageA", "imageRand"]

      expect(user.create_images).to eq ["image0","image1", "image2"]
    end
  end
end
