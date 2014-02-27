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
end

class Bistro
  attr_reader :filename, :recipes
  attr_accessor :found_recipes

  def initialize
    @filename = filename
    @recipes = []
    @found_recipes = []
  end

  def load_recipes(filename)
    CSV.foreach(filename, headers: true) do |row|
      @recipes << Recipe.new(row["id"], row["name"], row["description"], row["ingredients"], row["directions"])
    end
    @recipes
  end

  def find_recipe_by_id(recipe_id)
    found_recipes = []
    @recipes.each do |recipe|
      found_recipes << recipe if recipe.id == recipe_id
    end

    raise "Can't find a recipe with an id of #{recipe_id.inspect}" unless found_recipes
    display(found_recipes)
  end

  def display(found_recipes)
    found_recipes.each do |recipe|
      puts "#{recipe.id} - #{recipe.name}"
      puts  "#{recipe.description}"
      puts
      puts "Ingredients:"
      puts "#{recipe.ingredients}"
      puts
      puts "Preparation Instructions:"
      puts "#{recipe.directions}"
    end
  end

  def list
    name_array = @recipes.map(&:name)
    alphabetized = name_array.sort
    counter = 1
    alphabetized.each do |name|
      puts "#{counter}. #{name}"
      counter += 1
    end
  end
end




if ARGV.any?

  # I wonder if I could clean this up...
  bistro = Bistro.new
  bistro.load_recipes("recipes.csv")

  if ARGV[0] == "list"
    bistro.list
  elsif ARGV[0] == "display"
    puts bistro.find_recipe_by_id(ARGV[1])
  end
end


