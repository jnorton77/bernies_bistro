require_relative('bistro.rb')

bistro = Bistro.new
p bistro.find_recipe_by_id(2) == "Poodle Cake (For your puppy!)"


