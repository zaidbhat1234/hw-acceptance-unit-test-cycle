class Movie < ActiveRecord::Base
    def self.same_directors director
        if director.nil? or director.empty? then
            #flash[:notice] = "'#{@movie.title}' has no director info"
            #redirect_to movies_path
            
        else
            Movie.where(:director => director)
        end
    end
    def self.all_ratings
        %w(G PG PG-13 NC-17 R)
    end
    
    

end
