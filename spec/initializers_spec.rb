require "spec_helper"

context "Initializers, Readers, and Writers" do

  context DogWalker do
    
    before(:context) do
      @dw1 = DogWalker.new("Duane", "Sheepdog")
      @dw2 = DogWalker.new("Liza", "Corgi")
    end

    describe "#initialize" do
      it "initializes with a name and a favorite_breed" do
        expect { DogWalker.new("Duane", "Sheepdog") }.to_not raise_error
      end
    end

    describe "#name" do
      it "should return the name of the dog walker" do
        expect(@dw1.name).to eq("Duane")
      end

      it "should not be able to change after initialization" do
        expect{ @dw1.name = "Not Duane" }.to raise_error(NoMethodError)
      end
    end

    describe "#favorite_breed" do
      it "should return the favorite breed of the dog walker" do
        expect(@dw1.favorite_breed).to eq("Sheepdog")
      end

      it "should be able to change after initialization" do
        @dw1.favorite_breed = "Springer Spaniel"

        expect(@dw1.favorite_breed).to eq("Springer Spaniel")
      end
    end

    describe ".all" do
      it "should return an array of all DogWalker instances" do
        expect(DogWalker.all).to all(be_a(DogWalker))
      end
    end

  end

  context Dog do
    
    before(:context) do
      @d1 = Dog.new("Lucy", "Springer Spaniel", true)
      @d2 = Dog.new("Wallave", "Corgi", true)
    end
    
    describe "#initialize" do
      it "should initialize with a name (string), a breed (string), and whether or not this dog is a good dog (boolean)" do
        expect { Dog.new("Lucy", "Springer Spaniel", true) }.to_not raise_error
      end
    end

    describe "#name" do
      it "should return the name of the dog" do
        expect(@d1.name).to eq("Lucy")
      end

      it "should not be able to change after initialization" do
        expect{ @d1.name = "Not Lucy" }.to raise_error(NoMethodError)
      end
    end

    describe "#breed" do
      it "should return the breed of the dog" do
        expect(@d1.breed).to eq("Springer Spaniel")
      end

      it "should not be able to change after initialization" do
        expect{ @d1.breed = "Not Springer Spaniel" }.to raise_error(NoMethodError)
      end
    end

    describe "#good_dog" do
      it "should return the dog's good dog status" do
        expect(@d1.good_dog).to eq(true)
      end

      it "should be able to change after initialization" do
        @d1.good_dog = false

        expect(@d1.good_dog).to eq(false)
      end
    end

    describe ".all" do
      it "should return an array of all Dog instances" do
        expect(Dog.all).to all(be_a(Dog))
      end
    end

  end

  context Walk do
    
    before(:context) do
      @dw1 = DogWalker.new("Duane", "Sheepdog")
      @dw2 = DogWalker.new("Liza", "Corgi")

      @d1 = Dog.new("Lucy", "Springer Spaniel", true)
      @d2 = Dog.new("Wallave", "Corgi", true)

      @w1 = Walk.new(15, @d1, @dw1)
      @w2 = Walk.new(55, @d2, @dw1)
      @w3 = Walk.new(25, @d1, @dw2)
    end
    
    describe "#initialize" do
      it "should initialize with a length_in_minutes (integer), dog (Dog instance) and dog_walker (DogWalker instance)" do
        expect { Walk.new(15, @d1, @dw1) }.to_not raise_error
      end
    end

    describe "#length_in_minutes" do
      it "should return the length of the walk in minutes" do
        expect(@w1.length_in_minutes).to eq(15)
      end

      it "should not be able to change after initialization" do
        expect{ @w1.length_in_minutes = 10 }.to raise_error(NoMethodError)
      end
    end

    describe ".all" do
      it "should return an array of all Walk instances" do
        expect(Walk.all).to all(be_a(Walk))
      end
    end

  end

end