require 'rails_helper'

describe MoviesController do
    
    before(:each) do
        @movie1 = FactoryBot.create(:movie, id: '1', title: "test1", rating: "G", description: "test", release_date: "test", director: "test")
        @movie2 = FactoryBot.create(:movie, id: '2', title: "test2", rating: "G", description: "test", release_date: "test", director: "test")
        @movie3 = FactoryBot.create(:movie, id: '3', title: "no director", rating: "G", description: "test", release_date: "test")
    end
    
    
end