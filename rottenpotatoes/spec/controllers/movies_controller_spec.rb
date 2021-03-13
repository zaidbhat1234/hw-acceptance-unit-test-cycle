require 'rails_helper'

describe MoviesController do
    
    before(:each) do
        @movie1 = FactoryBot.create(:movie, id: '1', title: "Interstellar", rating: "G", description: "test", release_date: "10-03-2000", director: "Christopher Nolan")
        @movie2 = FactoryBot.create(:movie, id: '2', title: "The Prestige", rating: "G", description: "test", release_date: "20-03-2002", director: "Christopher Nolan")
        @movie3 = FactoryBot.create(:movie, id: '3', title: "Batman vs Superman", rating: "G", description: "31-03-1997", release_date: "Zack Snyder")
    end
    
    describe 'get #edit' do

 		it 'should render edit template' do
       		get :edit, :id => @movie1.id
       		(response).should render_template('edit')
 		end
 	end
    
    describe 'delete #destroy' do

 		it 'should delete the specified movie' do
 			delete :destroy, :id => @movie1.id
 			(response).should redirect_to movies_path
 		end
 	end
    describe 'get #new' do

 		it 'should render the create template' do
       		get :new
       		(response).should render_template('new')
 		end
 	end
 	
 	describe 'get #' do

 		it 'should render the index html template' do
       		get :index
       		(response).should render_template('index')
 		end

 		"""it 'should assign instance variable for title header' do
 			get :index, :sort => 'title'
 			expect(assigns(:title_header)).to eql('bg-warning hilite')
 		end

 		it 'should assign instance variable for date_header' do
 			get :index, :sort => 'release_date'
 			expect(assigns(:date_header)).to eql('bg-warning hilite')
 		end"""
 		
 		
 	end
 	
    describe 'get #same_director' do

 		it 'should find similar movies' do
 			get :same_director, :id => @movie2.id
 			(response).should render_template('same_director')
 		end
 		
 		it 'should not find any movie'  do
 			get :same_director, :id => @movie3.id
 			(response).should redirect_to movies_path
 		end
 	end
end