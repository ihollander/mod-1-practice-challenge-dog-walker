require_relative "spec_helper"

context "Object Relationship Methods" do

  before(:example) do
    @dw2 = DogWalker.new("Liza", "Corgi")
    @dw1 = DogWalker.new("Duane", "Sheepdog")

    @d1 = Dog.new("Lucy", "Springer Spaniel", true)
    @d2 = Dog.new("Wallace", "Corgi", true)

    @w1 = Walk.new(15, @d1, @dw1)
    @w2 = Walk.new(55, @d2, @dw1)
    @w3 = Walk.new(25, @d2, @dw2)
    @w4 = Walk.new(50, @d2, @dw1)
  end

  after(:example) do
    DogWalker.class_variable_set(:@@all, [])
    Dog.class_variable_set(:@@all, [])
    Walk.class_variable_set(:@@all, [])
  end

  describe Walk do

    describe "#happy_walker?" do
      it "should return true if the favorite_breed of the dog walker for this walk matches the breed of the dog for this walk, and false if it doesn't match" do
        expect(@w1.happy_walker?).to eq(false)
        expect(@w3.happy_walker?).to eq(true)
      end
    end

    describe "#print_details" do
      it "should `puts` to the terminal a string representing this walk" do
        expect{ @w1.print_details }.to output("Duane walked Lucy for 15 minutes\n").to_stdout
      end
    end

  end

  describe DogWalker do

    describe "#give_walk" do
      it "creates a new `Walk` instance associated with this dog walker and the given dog" do
        new_walk = @dw1.give_walk(20, @d1)

        expect(new_walk).to be_a(Walk)
        expect(new_walk.length_in_minutes).to eq(20)
        expect(new_walk.dog).to eq(@d1)
        expect(new_walk.dog_walker).to eq(@dw1)
      end
    end

    describe "#length_of_all_walks" do
      it "returns an integer for the total length of all walks this dog walker has given" do
        expect(@dw1.length_of_all_walks).to eq(120)
        expect(@dw2.length_of_all_walks).to eq(25)
      end
    end

    describe ".most_walks" do
      it "should return an instance of `DogWalker` which has given the most walks" do 
        expect(DogWalker.most_walks).to eq(@dw1)
      end
    end

  end

  describe Dog do

    describe "#take_walk" do
      it "creates a new `Walk` instance associated with this dog and the given dog_walker" do
        new_walk = @d1.take_walk(20, @dw1)

        expect(new_walk).to be_a(Walk)
        expect(new_walk.length_in_minutes).to eq(20)
        expect(new_walk.dog).to eq(@d1)
        expect(new_walk.dog_walker).to eq(@dw1)
      end
    end

    describe "#print_walk_details" do
      it "should `puts` to the terminal a string for each of the dog's walks" do
        expect{ @d1.print_walk_details }.to output("Duane walked Lucy for 15 minutes\n").to_stdout
      end
    end

    describe ".good_dogs" do
      it "returns an array of all dog instances whose are good dogs" do
        good_dogs = Dog.good_dogs
        
        expect(good_dogs).to all(be_a(Dog))
        expect(good_dogs).to include(@d1)
        expect(good_dogs).to include(@d2)
      end
    end

  end

# #### Dog

# - `Dog.good_dogs`
# - returns an array of all dog instances whose are good dogs


end