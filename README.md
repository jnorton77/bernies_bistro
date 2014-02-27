# P7 OO And CSV Bernie S Bistro

##Learning Competencies

* Infer the behavior and structure of code variables, methods, and objects accessed from test code
* Build test methods with descriptive output and clear indicators of passing tests
* Translate between different modes of modeling a problem (user stories, diagrams, pseudocode, etc.)
* Choose the appropriate method to store data in a file.
* Create well-defined classes with a single responsibility
* Identify and implement classes based on real world requirements

##Summary

Congratulations! Your hard work modeling an orange grove for Fran the Farmer has paid off! She's referred you to her friend Bernie, owner of the popular cafe, Bernie's Bistro.

Bernie hired another programmer to build a computerized recipe system for the Bistro, but they didn't finish the job before moving on to an "exciting stealth mode opportunity in the virtual unicorn party space." Bernie wants you to finish the Bistro's recipe system.


#### Recipe System Use Cases:

Bernie needs you to meet the following objectives. Be wary of over-designing the program - your job is to solve *these* problems, not to find other problems to solve.

1. Load recipes from a file
2. List all recipes
3. Display a recipes name, description, and ingredients

Listing all recipes should print something like this to the console:

```
1. Kale Burger
2. Poodle Cake (For your puppy!)
3. Peanut Butter Coffee Brownie
```

Displaying a single recipe should print something like this to the console:

```
1 - Kale Burger
The Kale Burger is one of our best selling dishes!
it combines the nutritional value of kale with
the taste of cow!

Ingredients:
Kale, Cow

Preparation Instructions:
Preheat the oven to 500 degrees. Put in a cow. Wait 10 minutes.
Put in some kale. Take out cow and kale. Put on bun Serve HOT!
```

##Releases

###Release 0: Find the edges

The existing code is dirty and incomplete; you may have to clean it up. Determine what is working by interacting with the program from the command line.  What works, what raises errors?  Be systematic in your approach. Write down what you tried, what you thought would happen, and what actually happened.

### Write the code how you want to use it

Write down the main use cases for this program.

Then write tests that exercise those use cases--write the tests in `bistro_test.rb`.

For example, if you want a method that allows you to look up a recipe, you might write some code like this:

```ruby
p bistro.find_recipe_by_id(2).name == "Peanut Butter Coffee Brownie"
```

###Release 1: Implement the MVP

MVP == Minimum Viable Product.

Implement the use cases that were not completed or completed incorrectly by the previous consultant, as revealed by the errors you got the program to raise or the driver code you wrote.


###Release 2: Order Recipes in Alphabetical Order

When you list the recipes now, the display should be:

```
1. Kale Burger
2. Peanut Butter Coffee Brownie
3. Poodle Cake (For your puppy!)
```

**Note:**  The display number for a recipe is not necessarily the same as the value of the recipe's id attribute.  How can you accommodate this new listing format?
