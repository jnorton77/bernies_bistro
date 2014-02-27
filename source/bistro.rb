require 'csv'

class Recipe

  attr_reader :id, :name, :description, :ingredients, :directions

  def initialize(id, name, description, ingredients, directions)
    @id = id
    @name = name
    @description = description
    @ingredients = ingredients
    @directions = directions
  end

  def display
    "#{@id} - #{@name}\n#{@description}\n\nIngredients:\n#{@ingredients}\n\nPreparation Instructions:\n#{@directions}"
  end
end

class Bistro

  attr_reader :filename, :recipes

  def initialize
    @filename = filename
    @recipes = []
  end

  def load_recipes(filename)
    CSV.foreach(filename, headers: true) do |row|
      @recipes << Recipe.new(row["id"], row["name"], row["description"], row["ingredients"], row["directions"])
    end
    @recipes
  end

  def find_recipe_by_id(recipe_id)
    @recipes.find { |recipe| recipe.id == recipe_id }
    # if @recipes.empty?
    #   raise "Can't find a recipe with an id of #{recipe_id.inspect}"
    # end
  end

  def list
    recipe_names = @recipes.map(&:name)
    recipe_names_sorted = recipe_names.sort
    recipe_names_sorted.each_with_index {|name, index| puts "#{(index+1)}. #{name}"}
  end
end




if ARGV.any?

  bistro = Bistro.new
  bistro.load_recipes("recipes.csv")

  if ARGV[0] == "list"
    all_recipes = bistro.list

  elsif ARGV[0] == "display"
    recipe = bistro.find_recipe_by_id(ARGV[1])
    puts recipe.display
  end
end


