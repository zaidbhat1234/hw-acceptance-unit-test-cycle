# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the (RottenPotatoes )?home\s?page$/ then '/movies'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    when /^the home\s?page$/
       '/movies'
       
    when /^the edit page for "([^"]+)"$/
      id = Movie.find_by_title($1).id
      edit_movie_path(id)
      
    when /^the details page for "(.*)"$/
      path = Movie.find_by_title($1)
 	    movie_path path

     when /^the Similar Movies page for "(.*)"$/
      path = Movie.find_by_title($1)
 	    same_director_path path

     when /^the RottenPotatoes home page$/ then '/movies'

     when /^the movies page?/ then '/movies'


    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
