require_relative "spec_helper"

context "Object Relationship Methods" do

  before(:context) do
    @dw1 = DogWalker.new("Duane", "Sheepdog")
    @dw2 = DogWalker.new("Liza", "Corgi")

    @d1 = Dog.new("Lucy", "Springer Spaniel", true)
    @d2 = Dog.new("Wallace", "Corgi", true)

    @w1 = Walk.new(15, @d1, @dw1)
    @w2 = Walk.new(55, @d2, @dw1)
    @w3 = Walk.new(25, @d1, @dw2)
    @w4 = Walk.new(55, @d2, @dw1)
  end

  describe Walk do

    describe "#dog" do
      it "should return the Dog instance for this Walk" do
        expect(@w1.dog).to eq(@d1)
      end
    end

    describe "#dog_walker" do
      it "should return the DogWalker instance for this Walk" do
        expect(@w1.dog_walker).to eq(@dw1)
      end
    end

  end

  describe DogWalker do

    describe "#walks" do
      it "should return an array of all the walks given by the DogWalker" do
        expect(@dw1.walks).to all(be_a(Walk))
        expect(@dw1.walks.count).to eq(3)
      end
    end

    describe "#dogs" do
      it "should return a unique array of all the dogs who been walked by the DogWalker" do
        expect(@dw1.dogs).to all(be_a(Dog))
        expect(@dw1.dogs).to include(@d1)
        expect(@dw1.dogs.count).to eq(2)
      end
    end
    
  end

  describe Dog do

    describe "#walks" do
      it "should return an array of all the walks that the Dog has taken" do
        expect(@d2.walks).to all(be_a(Walk))
        expect(@d2.walks.count).to eq(2)
      end
    end

    describe "#dog_walkers" do
      it "should return a unique array of all the dog walkers that the Dog received walks from" do
        expect(@d2.dog_walkers).to all(be_a(DogWalker))
        expect(@d2.dog_walkers).to include(@dw1)
        expect(@d2.dog_walkers.count).to eq(1)
      end
    end
    
  end

end