require 'csv'

class Recipe

  attr_reader :id, :name, :description, :ingredients, :directions

  def initialize(attributes)
    @id = attributes['id']
    @name = attributes['name']
    @description = attributes['description']
    @ingredients = attributes['ingredients']
    @directions = attributes['directions']
  end

  def display
    "#{id} - #{name}\n#{description}\n\nIngredients:\n#{ingredients}\n\nPreparation Instructions:\n#{directions}"
  end
end

class Bistro

  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def load_recipes(filename)
    CSV.foreach(filename, headers: true) do |row|
      @recipes << Recipe.new(row)
    end
  end

  def find_recipe_by_id(recipe_id)
    recipe = @recipes.find { |recipe| recipe.id == recipe_id }
    recipe_error(recipe_id) unless recipe
    recipe
  end

  def recipe_error(recipe_id)
    raise "Can't find a recipe with an id of #{recipe_id.inspect}"
  end

  def alphabetize
    @recipes.sort_by { |recipe| recipe.name }
  end

  def list
    alphabetize.map.with_index(1) {|recipe, index| "#{(index)}. #{recipe.name}"}
  end
end




if ARGV.any?

  bistro = Bistro.new
  bistro.load_recipes("recipes.csv")

  if ARGV[0] == "list"
    puts bistro.list

  elsif ARGV[0] == "display"
    recipe = bistro.find_recipe_by_id(ARGV[1])
    puts recipe.display
  end
end


