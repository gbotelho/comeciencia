class DietsController < ApplicationController
	
	def show
    	@diet = Diet.find(params[:id])
	end

	def edit
    	@diet = Diet.find(params[:id])
	end

	def update
	  @diet = Diet.find(params[:id])
	 
	  if @diet.update(diet_params)
	    redirect_to list_carbs_food_path(@diet.person)
	  else
	    render 'edit'
	  end
	end

	def personalize
		@person = Person.find(params[:id_person])
		@foods_person = @person.foods
		@foods_breakfast_fats = @foods_person.select{ |item| ((item[:breakfast] == true) && (item[:high_fat] == true))}
		@foods_lunch_fats = @foods_person.select{ |item| ((item[:lunch] == true) && (item[:high_fat] == true))}
		@foods_dinner_fats = @foods_person.select{ |item| ((item[:dinner] == true) && (item[:high_fat] == true))}
		@foods_snack_fats = @foods_person.select{ |item| ((item[:snack] == true) && (item[:high_fat] == true))}
		if @foods_breakfast_fats.size == 0 || @foods_lunch_fats.size == 0 || @foods_dinner_fats.size == 0 || @foods_snack_fats.size == 0
			flash[:notice] = "You have to select at least one fat per meal: #{@foods_breakfast_fats.size}, #{@foods_lunch_fats.size},
			#{@foods_dinner_fats.size}, #{@foods_snack_fats.size}, #{@foods_person.size}"
			redirect_to(:back)
			return
		end

		@foods_breakfast_carbs = @foods_person.select{ |item| ((item[:breakfast] == true) && (item[:high_carbohydrate] == true))}
		@foods_lunch_carbs = @foods_person.select{ |item| ((item[:lunch] == true) && (item[:high_carbohydrate] == true))}
		@foods_dinner_carbs = @foods_person.select{ |item| ((item[:dinner] == true) && (item[:high_carbohydrate] == true))}
		@foods_snack_carbs = @foods_person.select{ |item| ((item[:snack] == true) && (item[:high_carbohydrate] == true))}

		@foods_breakfast_proteins = @foods_person.select{ |item| ((item[:breakfast] == true) && (item[:high_protein] == true))}
		@foods_lunch_proteins = @foods_person.select{ |item| ((item[:lunch] == true) && (item[:high_protein] == true))}
		@foods_dinner_proteins = @foods_person.select{ |item| ((item[:dinner] == true) && (item[:high_protein] == true))}
		@foods_snack_proteins = @foods_person.select{ |item| ((item[:snack] == true) && (item[:high_protein] == true))}

		@diet = Diet.find(params[:id_diet])
		@person = Person.find(params[:id_person])
		@foods = @person.foods
		@diet.meals.clear

		# Breakfast
		@meal = Meal.new
		@meal.name = "Breakfast"

		@meal.calories = @diet.calories / 3
		@calories_breakfast_carbs = @meal.calories * @diet.carbohydrate_percentage
		@calories_breakfast_proteins = @meal.calories * @diet.protein_percentage
		@calories_breakfast_fats = @meal.calories * @diet.fat_percentage

		@calories_breakfast_carbs_per_food = @calories_breakfast_carbs /  @foods_breakfast_carbs.size
		@foods_breakfast_carbs.each do |food|
			@portion = Portion.new
			@portion.size = @calories_breakfast_carbs_per_food * (food.size / food.calories)
			@portion.food = food
			@meal.portions << @portion
		end

		@calories_breakfast_proteins_per_food = @calories_breakfast_proteins /  @foods_breakfast_proteins.size
		@foods_breakfast_proteins.each do |food|
			@portion = Portion.new
			@portion.size = @calories_breakfast_proteins_per_food * (food.size / food.calories)
			@portion.food = food
			@meal.portions << @portion
		end


		@calories_breakfast_fats_per_food = @calories_breakfast_fats /  @foods_breakfast_fats.size
		@foods_breakfast_fats.each do |food|
			@portion = Portion.new
			@portion.size = @calories_breakfast_fats_per_food * (food.size / food.calories)
			@portion.food = food
			@meal.portions << @portion
		end

		@meal_foods = @meal.portions.map { |item| item.food }
		@meal_carbohydrate = @meal.portions.inject(0){|sum,portion| sum + (portion.food.carbohydrate * (portion.size / portion.food.size))}
		@meal_protein = @meal.portions.inject(0){|sum,portion| sum + (portion.food.protein * (portion.size / portion.food.size))}
		@meal_fat = @meal.portions.inject(0){|sum,portion| sum + (portion.food.fat * (portion.size / portion.food.size))}
		@meal_size = @meal_carbohydrate + @meal_protein + @meal_fat
		@meal.carbohydrate_percentage = @meal_carbohydrate / @meal_size
		@meal.protein_percentage = @meal_protein / @meal_size
		@meal.fat_percentage = @meal_fat / @meal_size
		@diet.meals << @meal


		render 'show'
	end

	private
	  def diet_params
	    params.require(:diet).permit(:calories, :carbohydrate_percentage, :protein_percentage, :fat_percentage)
	  end
end
