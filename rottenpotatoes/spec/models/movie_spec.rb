require 'rails_helper'

describe Movie do
  before(:each) do
    @movie1 = FactoryBot.create(:movie, id: '1', title: "Interstellar", rating: "G", description: "test", release_date: "10-03-2000", director: "Christopher Nolan")
    @movie2 = FactoryBot.create(:movie, id: '2', title: "The Prestige", rating: "G", description: "test", release_date: "20-03-2002", director: "Christopher Nolan")
    @movie3 = FactoryBot.create(:movie, id: '3', title: "Batman vs Superman", rating: "G", description: "31-03-1997", release_date: "Zack Snyder")
  end

  describe 'test director methods for sad and happy path of movies in before(:each)' do
    it 'should return movies with same director' do
      Movie.same_directors(@movie1[:director]).should == [@movie1, @movie2]
    end

    it 'should return empty relation' do
      Movie.same_directors(@movie3[:director]).should == nil
    end
  end
  
  describe 'test for all_ratings' do
    it 'returns all ratings' do
      Movie.all_ratings.should == %w(G PG PG-13 NC-17 R)
    end
  end
end