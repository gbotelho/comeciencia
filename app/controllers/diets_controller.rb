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

	def discover
		@person = Person.find(params[:id_person])
		@foods_person = @person.foods
		@diets = Diet.all

		intersections = @diets.map { |diet| diet.foods.size > 0 ? (diet.foods & @foods_person).size / diet.foods.size.to_f : 0} 
		index_max = intersections.index(intersections.max)
		@diet = @diets[index_max]

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
		@meal_breakfast = Meal.new
		@meal_breakfast.name = "Breakfast"

		@meal_breakfast.calories = @diet.calories / 3
		@calories_breakfast_carbs = @meal_breakfast.calories * @diet.carbohydrate_percentage / 100
		@calories_breakfast_proteins = @meal_breakfast.calories * @diet.protein_percentage / 100
		@calories_breakfast_fats = @meal_breakfast.calories * @diet.fat_percentage / 100

		@foods_breakfast_carbs.each do |food|
			if (!(@diet.meals.foods.include? food) || (@foods_breakfast_carbs.last == food))
				@portion = Portion.new
				@portion.size = @calories_breakfast_carbs_per_food * (food.size / food.calories)
				@portion.food = food
				@meal_breakfast.portions << @portion			 
			end
		end

		# @calories_breakfast_carbs_per_food = @calories_breakfast_carbs /  @foods_breakfast_carbs.size
		# @foods_breakfast_carbs.each do |food|
		# 	@portion = Portion.new
		# 	@portion.size = @calories_breakfast_carbs_per_food * (food.size / food.calories)
		# 	@portion.food = food
		# 	@meal_breakfast.portions << @portion
		# end

		@calories_breakfast_proteins_per_food = @calories_breakfast_proteins /  @foods_breakfast_proteins.size
		@foods_breakfast_proteins.each do |food|
			@portion = Portion.new
			@portion.size = @calories_breakfast_proteins_per_food * (food.size / food.calories)
			@portion.food = food
			@meal_breakfast.portions << @portion
		end


		@calories_breakfast_fats_per_food = @calories_breakfast_fats /  @foods_breakfast_fats.size
		@foods_breakfast_fats.each do |food|
			@portion = Portion.new
			@portion.size = @calories_breakfast_fats_per_food * (food.size / food.calories)
			@portion.food = food
			@meal_breakfast.portions << @portion
		end

		@meal_foods = @meal_breakfast.portions.map { |item| item.food }
		@meal_carbohydrate = @meal_breakfast.portions.inject(0){|sum,portion| sum + (portion.food.carbohydrate * (portion.size / portion.food.size))}
		@meal_protein = @meal_breakfast.portions.inject(0){|sum,portion| sum + (portion.food.protein * (portion.size / portion.food.size))}
		@meal_fat = @meal_breakfast.portions.inject(0){|sum,portion| sum + (portion.food.fat * (portion.size / portion.food.size))}
		@meal_size = @meal_carbohydrate + @meal_protein + @meal_fat
		@meal_breakfast.carbohydrate_percentage = @meal_carbohydrate / @meal_size * 100
		@meal_breakfast.protein_percentage = @meal_protein / @meal_size * 100
		@meal_breakfast.fat_percentage = @meal_fat / @meal_size * 100
		@diet.meals << @meal_breakfast

		# Lunch
		@meal_lunch = Meal.new
		@meal_lunch.name = "Lunch"

		@meal_lunch.calories = @diet.calories * (4 / 9.0)
		@calories_lunch_carbs = @meal_lunch.calories * @diet.carbohydrate_percentage / 100
		@calories_lunch_proteins = @meal_lunch.calories * @diet.protein_percentage / 100
		@calories_lunch_fats = @meal_lunch.calories * @diet.fat_percentage / 100

		@calories_lunch_carbs_per_food = @calories_lunch_carbs /  @foods_lunch_carbs.size
		@foods_lunch_carbs.each do |food|
			@portion = Portion.new
			@portion.size = @calories_lunch_carbs_per_food * (food.size / food.calories)
			@portion.food = food
			@meal_lunch.portions << @portion
		end

		@calories_lunch_proteins_per_food = @calories_lunch_proteins /  @foods_lunch_proteins.size
		@foods_lunch_proteins.each do |food|
			@portion = Portion.new
			@portion.size = @calories_lunch_proteins_per_food * (food.size / food.calories)
			@portion.food = food
			@meal_lunch.portions << @portion
		end


		@calories_lunch_fats_per_food = @calories_lunch_fats /  @foods_lunch_fats.size
		@foods_lunch_fats.each do |food|
			@portion = Portion.new
			@portion.size = @calories_lunch_fats_per_food * (food.size / food.calories)
			@portion.food = food
			@meal_lunch.portions << @portion
		end

		@meal_foods = @meal_lunch.portions.map { |item| item.food }
		@meal_carbohydrate = @meal_lunch.portions.inject(0){|sum,portion| sum + (portion.food.carbohydrate * (portion.size / portion.food.size))}
		@meal_protein = @meal_lunch.portions.inject(0){|sum,portion| sum + (portion.food.protein * (portion.size / portion.food.size))}
		@meal_fat = @meal_lunch.portions.inject(0){|sum,portion| sum + (portion.food.fat * (portion.size / portion.food.size))}
		@meal_size = @meal_carbohydrate + @meal_protein + @meal_fat
		@meal_lunch.carbohydrate_percentage = @meal_carbohydrate / @meal_size * 100
		@meal_lunch.protein_percentage = @meal_protein / @meal_size * 100
		@meal_lunch.fat_percentage = @meal_fat / @meal_size * 100
		@diet.meals << @meal_lunch


		# Dinner
		@meal_dinner = Meal.new
		@meal_dinner.name = "Dinner"

		@meal_dinner.calories = @diet.calories * (2 / 9.0)
		@calories_dinner_carbs = @meal_dinner.calories * @diet.carbohydrate_percentage / 100
		@calories_dinner_proteins = @meal_dinner.calories * @diet.protein_percentage / 100
		@calories_dinner_fats = @meal_dinner.calories * @diet.fat_percentage / 100

		@calories_dinner_carbs_per_food = @calories_dinner_carbs /  @foods_dinner_carbs.size
		@foods_dinner_carbs.each do |food|
			@portion = Portion.new
			@portion.size = @calories_dinner_carbs_per_food * (food.size / food.calories)
			@portion.food = food
			@meal_dinner.portions << @portion
		end

		@calories_dinner_proteins_per_food = @calories_dinner_proteins /  @foods_dinner_proteins.size
		@foods_dinner_proteins.each do |food|
			@portion = Portion.new
			@portion.size = @calories_dinner_proteins_per_food * (food.size / food.calories)
			@portion.food = food
			@meal_dinner.portions << @portion
		end


		@calories_dinner_fats_per_food = @calories_dinner_fats /  @foods_dinner_fats.size
		@foods_dinner_fats.each do |food|
			@portion = Portion.new
			@portion.size = @calories_dinner_fats_per_food * (food.size / food.calories)
			@portion.food = food
			@meal_dinner.portions << @portion
		end

		@meal_foods = @meal_dinner.portions.map { |item| item.food }
		@meal_carbohydrate = @meal_dinner.portions.inject(0){|sum,portion| sum + (portion.food.carbohydrate * (portion.size / portion.food.size))}
		@meal_protein = @meal_dinner.portions.inject(0){|sum,portion| sum + (portion.food.protein * (portion.size / portion.food.size))}
		@meal_fat = @meal_dinner.portions.inject(0){|sum,portion| sum + (portion.food.fat * (portion.size / portion.food.size))}
		@meal_size = @meal_carbohydrate + @meal_protein + @meal_fat
		@meal_dinner.carbohydrate_percentage = @meal_carbohydrate / @meal_size * 100
		@meal_dinner.protein_percentage = @meal_protein / @meal_size * 100
		@meal_dinner.fat_percentage = @meal_fat / @meal_size * 100
		@diet.meals << @meal_dinner


		render 'show'
	end

	private
	  def diet_params
	    params.require(:diet).permit(:calories, :carbohydrate_percentage, :protein_percentage, :fat_percentage)
	  end
end
