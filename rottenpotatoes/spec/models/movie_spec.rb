require 'rails_helper'

describe Movie do
  before(:each) do
    @movie1 = FactoryBot.create(:movie, id: 1, title: "test1", rating: "G", description: "test", release_date: "test", director: "test")
    @movie2 = FactoryBot.create(:movie, id: 2, title: "test2", rating: "G", description: "test", release_date: "test", director: "test")
    @movie3 = FactoryBot.create(:movie, id: 3, title: "no director", rating: "G", description: "test", release_date: "test")
  end

  describe 'director methods test for model in before(:each)' do
    it 'should return similar movie' do
      Movie.same_directors(@movie1[:director]).should == [@movie1, @movie2]
    end
  end
end