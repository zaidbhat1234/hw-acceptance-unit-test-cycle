require 'rails_helper'

describe MoviesController do
    
    before(:each) do
        @movie1 = FactoryBot.create(:movie, id: '1', title: "test1", rating: "G", description: "test", release_date: "test", director: "test")
        @movie2 = FactoryBot.create(:movie, id: '2', title: "test2", rating: "G", description: "test", release_date: "test", director: "test")
        @movie3 = FactoryBot.create(:movie, id: '3', title: "no director", rating: "G", description: "test", release_date: "test")
    end
    
    describe 'get #edit' do

 		it 'should render the edit html template' do
       		get :edit, :id => @movie1.id
       		expect(response).to render_template('edit')
 		end
 	end
    
    describe 'delete #destroy' do

 		it 'should delete the specific movie' do
 			delete :destroy, :id => @movie1.id
 			expect(response).to redirect_to movies_path
 		end
 	end
    describe 'get #new' do

 		it 'should render the create html template' do
       		get :new
       		expect(response).to render_template('new')
 		end
 	end
 	
 	describe 'get #' do

 		it 'should render the index html template' do
       		get :index
       		expect(response).to render_template('index')
 		end

 		it 'should assign instance variable for title header' do
 			get :index, :sort => 'title'
 			expect(assigns(:title_header)).to eql('bg-warning hilite')
 		end

 		it 'should assign instance variable for date_header' do
 			get :index, :sort => 'release_date'
 			expect(assigns(:date_header)).to eql('bg-warning hilite')
 		end
 	end
 	
    describe 'get #same_director' do

 		it 'should find similar movies' do
 			get :same_director, :id => @movie2.id
 			expect(response).to render_template('same_director')
 		end
 		
 		it 'should not find any movie'  do
 			get :same_director, :id => @movie3.id
 			expect(response).to redirect_to movies_path
 		end
 	end
end