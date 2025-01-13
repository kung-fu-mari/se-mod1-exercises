require 'rspec'
require './lib/image_generator'

RSpec.describe ImageGenerator do
  describe '#initialize' do
    it 'exists' do
      image_generator = ImageGenerator.new(2500)
      expect(image_generator).to be_a ImageGenerator
    end

    it 'has attributes' do
      image_generator = ImageGenerator.new(2500)
      expect(image_generator.max_image_size).to eq 2500
    end

    # Using stubs write the tests to confirm the functionality
    # that exists in ./lib/image_generator.rb

    it 'generates an array of images' do
      image_generator = ImageGenerator.new(2500)
      allow(image_generator).to receive(:generate_images).and_return(["image0", "image1"])
      images = image_generator.generate_images
      expect(images).to be_instance_of(Array)

      expect(images[0]).to be_instance_of(String)
      expect(images[0]).to eq("image0")
    end

    it 'changes its max image size' do
      image_generator = ImageGenerator.new(2500)
      expect(image_generator.max_image_size).to eq 2500

      allow(image_generator).to receive(:change_max_size).and_return(1500) 
      expect(image_generator.change_max_size).to eq(1500)
    end
  end
end
