require 'matrix'
require 'rational' 

class DietsController < ApplicationController

	def show
    	@diet = Diet.find(params[:id])
	end

	def createDefaultMeals (diet)
		meal_breakfast = Meal.new
		meal_breakfast.name = "Refeicao 1 - Café da manhã"
		diet.meals << meal_breakfast

		meal_breakfast = Meal.new
		meal_breakfast.name = "Refeicao 2 - Almoco"
		diet.meals << meal_breakfast

		meal_breakfast = Meal.new
		meal_breakfast.name = "Refeicao 3 - Lanche"
		diet.meals << meal_breakfast

		meal_breakfast = Meal.new
		meal_breakfast.name = "Refeicao 4 - Jantar"
		diet.meals << meal_breakfast
	end

	def edit
    	@diet = Diet.find(params[:id])
    	if (@diet.meals.size == 0)
    		createDefaultMeals(@diet)
    	end
    	@foods = Food.all
	end

	def update
	  @diet = Diet.find(params[:id])
	  @diet.update(diet_params)
	  @foods = Food.all
	  render 'edit'
	end

	def calculateMealProperties(meal)
		carbs   = 0.0
		protein = 0.0
		fat     = 0.0
		meal.calories = 0
		meal.portions.each do |portion|
			food = portion.food
			portion_size = portion.size
			carbs   += food.carbohydrate * (portion_size / food.size)
			protein += food.protein * (portion_size / food.size)
			fat     += food.fat * (portion_size / food.size)
			meal.calories += food.calories * (portion_size / food.size)
		end
		meal.carbohydrate_percentage = 100 * carbs   / (carbs + protein + fat)
		meal.protein_percentage      = 100 * protein / (carbs + protein + fat)
		meal.fat_percentage          = 100 * fat     / (carbs + protein + fat)
	end

	def calculateDietProperties(diet)
		carbs   = 0.0
		protein = 0.0
		fat     = 0.0
		diet.calories = 0 
		diet.meals.each do |meal| 
			meal.portions.each do |portion|
				food = portion.food
				portion_size = portion.size
				carbs   += food.carbohydrate * (portion_size / food.size)
				protein += food.protein * (portion_size / food.size)
				fat     += food.fat * (portion_size / food.size)
				diet.calories += food.calories * (portion_size / food.size)
			end
		end
		diet.carbohydrate_percentage = 100 * carbs   / (carbs + protein + fat)
		diet.protein_percentage      = 100 * protein / (carbs + protein + fat)
		diet.fat_percentage          = 100 * fat     / (carbs + protein + fat)
	end

	def update_portion
	  @diet = Diet.find(params[:id_diet])
	  meal = Meal.find(params[:id_meal])
	  @portion = Portion.find(params[:id_portion])
	  @portion.update(portion_params)
	  calculateMealProperties(meal)
	  calculateDietProperties(@diet)
	  meal.save
	  @diet.save
	  @foods = Food.all

	  respond_to do |format|
	    format.js 
	    format.html
	  end
	end


	def add_food_meal
		@diet = Diet.find(params[:id_diet])
		@meal = Meal.find(params[:id_meal])
		food = Food.find(params[:id_food])
		@portion = Portion.new
		@portion.size = food.size
		@portion.food = food
		@meal.portions << @portion
		calculateMealProperties(@meal)
		calculateDietProperties(@diet)
		@meal.save
		@diet.save
		@foods = Food.all

		respond_to do |format|
	    	format.js 
	    	format.html
	  	end
	end

	def remove_portion_meal
		@diet = Diet.find(params[:id_diet])
		@portion = Portion.find(params[:id_portion])
		meal = Meal.find(params[:id_meal])
		food = @portion.food
		meal.portions.delete(@portion)
		calculateMealProperties(meal)
		calculateDietProperties(@diet)
		meal.save
		@diet.save
		@foods = Food.all

		respond_to do |format|
	    	format.js 
	    	format.html
	  	end
	end

	def discover
		@person = Person.find(params[:id_person])
		@foods_person = @person.foods.select{|food| FoodsPerson.find_by_food_id_and_person_id(food.id,@person.id).like == true} 
		
		if (@person.diets.first.goal == "lose_weight")
			@diets = Diet.all.select {|diet| diet.goal == "emagrecimento"} 
		else
			@diets = Diet.all
		end

		if(@person.sex != "female")
			@diets.delete(Diet.find(goal: "ovulacao"))
		end

		intersections = @diets.map { |diet| diet.foods.size > 0 ? (diet.foods & @foods_person).size / diet.foods.size.to_f : 0} 
		index_max = intersections.index(intersections.max)
		@diet = @diets[index_max]

	end

	# def solveMatrix
	# 	# 11 =  121 p_carb + 02  c_prot + 01 c_fat
	# 	# 20 =  01  p_carb + 200 c_prot + 14 c_fat    
	# 	# 10 =  01  p_carb + 02  c_prot + 64 c_fat

	# 	coefficients = [[121, 2, 1], [1, 200, 14], [1, 2, 64]].collect! do |row|
	# 	  row.collect! { |x| Rational(x) }
	# 	end
	# 	coefficients = Matrix[*coefficients]
	# 	# => Matrix[[Rational(2, 1), Rational(10, 1), Rational(8, 1)],
	# 	# =>        [Rational(0, 1), Rational(7, 1), Rational(4, 1)],
	# 	# =>        [Rational(5, 1), Rational(5, 1), Rational(5, 1)]]

	# 	constants = Matrix[[Rational(11)], [Rational(20)], [Rational(10)]]
	# 	solutions = coefficients.inverse * constants
	# 	solutions.
	# 	# => Matrix[[Rational(1, 1)], [Rational(2, 1)], [Rational(4, 1)]]
	# end

	def solveMatrix (c_carb, p_carb, f_carb, c_protein, p_protein, f_protein, c_fat, p_fat, f_fat, carb_grams, protein_grams, fat_grams)
		# 11 =  121 p_carb + 02  c_prot + 01 c_fat
		# 20 =  01  p_carb + 200 c_prot + 14 c_fat    
		# 10 =  01  p_carb + 02  c_prot + 64 c_fat

		coefficients = [[c_carb, c_protein, c_fat], 
						[p_carb, p_protein, p_fat], 
						[f_carb, f_protein, f_fat]].collect! do |row|
		  row.collect! { |x| Rational(x) }
		end
		coefficients = Matrix[*coefficients]
		# => Matrix[[Rational(2, 1), Rational(10, 1), Rational(8, 1)],
		# =>        [Rational(0, 1), Rational(7, 1), Rational(4, 1)],
		# =>        [Rational(5, 1), Rational(5, 1), Rational(5, 1)]]

		constants = Matrix[[Rational(carb_grams)], [Rational(protein_grams)], [Rational(fat_grams)]]
		solutions = coefficients.inverse * constants
		carb_portion_size    = solutions[0,0].to_f
		protein_portion_size = solutions[1,0].to_f
		fat_portion_size     = solutions[2,0].to_f
		portions = [carb_portion_size, protein_portion_size, fat_portion_size]
		return portions
		# => Matrix[[Rational(1, 1)], [Rational(2, 1)], [Rational(4, 1)]]
	end

	def createMealPortion (size, food, meal)
		portion = Portion.new
		portion.size = size * food.size
		portion.food = food
		meal.portions << portion
	end

	def createMeal (diet, foods, name, calories, carb_percentage=34, protein_percentage=33, fat_percentage=33)
		meal = Meal.new
		meal.name = name
		meal.calories = calories
		meal.carbohydrate_percentage = carb_percentage
		meal.protein_percentage = protein_percentage
		meal.fat_percentage = fat_percentage

		carb_calories    = calories * carb_percentage / 100
		protein_calories = calories * protein_percentage / 100
		fat_calories     = calories * fat_percentage / 100

		carb_grams 	  = carb_calories    / 4.to_f
		protein_grams = protein_calories / 4.to_f
		fat_grams     = fat_calories     / 9.to_f

		foods_carbs   = foods.select{ |item| ((item[:high_carbohydrate] == true))}
		foods_protein = foods.select{ |item| ((item[:high_protein] == true))}
		foods_fat     = foods.select{ |item| ((item[:high_fat] == true))}

		carb    = foods_carbs.first
		protein = foods_protein.first
		fat     = foods_fat.first

		c_carb = carb.carbohydrate
		p_carb = carb.protein
		f_carb = carb.fat

		c_protein = protein.carbohydrate
		p_protein = protein.protein
		f_protein = protein.fat

		c_fat = fat.carbohydrate
		p_fat = fat.protein
		f_fat = fat.fat

		portions_sizes = solveMatrix(c_carb, p_carb, f_carb, c_protein, p_protein, f_protein, c_fat, p_fat, f_fat, carb_grams, protein_grams, fat_grams)
		portion_carb_size    = portions_sizes[0]
		portion_protein_size = portions_sizes[1]
		portion_fat_size     = portions_sizes[2]

		createMealPortion(portion_carb_size, carb, meal)
		createMealPortion(portion_protein_size, protein, meal)
		createMealPortion(portion_fat_size, fat, meal)

		diet.meals << meal
	end
	
	def createDiet (person, calories=1200, carb_percentage=34, protein_percentage=33, fat_percentage=33)
		if person.diets.first.nil?
			person.diets.new
		end
		diet = @person.diets.first
		diet.meals.clear

		foods = person.foods
		foods_breakfast = foods.select{ |item| ((item[:breakfast] == true))}
		foods_lunch = foods.select{ |item| ((item[:lunch] == true))}
		foods_snack = foods.select{ |item| ((item[:snack] == true))}
		foods_dinner = foods.select{ |item| ((item[:dinner] == true))}

	   	createMeal(diet, foods_breakfast, "Café da Manhã", (2.to_f/8) * calories, carb_percentage, protein_percentage, fat_percentage)
	   	createMeal(diet, foods_lunch, "Almoco", (3.to_f/8) * calories, carb_percentage, protein_percentage, fat_percentage)
	   	createMeal(diet, foods_snack, "Lanche", (2.to_f/8) * calories, carb_percentage, protein_percentage, fat_percentage)
	   	createMeal(diet, foods_dinner, "Jantar", (3.to_f/8) * calories, carb_percentage, protein_percentage, fat_percentage)
	end

	def personalize
		@person = Person.find(params[:id_person])
		base_diet = Diet.find(params[:id_diet])
		#createDiet(@person)
		@diet = @person.diets.first
		@diet.meals.clear
		@diet.meals << base_diet.meals
		@diet.meals.each do |meal|
			calculateMealProperties(meal)
			meal.save
		end
		calculateDietProperties(@diet)
		@diet.save
		redirect_to edit_diet_path(@diet)

		# @foods_person = @person.foods
		# @foods_breakfast_fats = @foods_person.select{ |item| ((item[:breakfast] == true) && (item[:high_fat] == true))}
		# @foods_lunch_fats = @foods_person.select{ |item| ((item[:lunch] == true) && (item[:high_fat] == true))}
		# @foods_dinner_fats = @foods_person.select{ |item| ((item[:dinner] == true) && (item[:high_fat] == true))}
		# @foods_snack_fats = @foods_person.select{ |item| ((item[:snack] == true) && (item[:high_fat] == true))}
		# if @foods_breakfast_fats.size == 0 || @foods_lunch_fats.size == 0 || @foods_dinner_fats.size == 0 || @foods_snack_fats.size == 0
		# 	flash[:notice] = "Você precisa avaliar mais alimentos para sua dieta ser personalizada."
		# 	redirect_to list_one_food_path(@person)
		# 	return
		# end

		# @foods_breakfast_carbs = @foods_person.select{ |item| ((item[:breakfast] == true) && (item[:high_carbohydrate] == true))}
		# @foods_lunch_carbs = @foods_person.select{ |item| ((item[:lunch] == true) && (item[:high_carbohydrate] == true))}
		# @foods_dinner_carbs = @foods_person.select{ |item| ((item[:dinner] == true) && (item[:high_carbohydrate] == true))}
		# @foods_snack_carbs = @foods_person.select{ |item| ((item[:snack] == true) && (item[:high_carbohydrate] == true))}

		# @foods_breakfast_proteins = @foods_person.select{ |item| ((item[:breakfast] == true) && (item[:high_protein] == true))}
		# @foods_lunch_proteins = @foods_person.select{ |item| ((item[:lunch] == true) && (item[:high_protein] == true))}
		# @foods_dinner_proteins = @foods_person.select{ |item| ((item[:dinner] == true) && (item[:high_protein] == true))}
		# @foods_snack_proteins = @foods_person.select{ |item| ((item[:snack] == true) && (item[:high_protein] == true))}


		# if @person.diets.first.nil?
  # 			@person.diets.new
  # 		end
		# @diet = @person.diets.first
		# @diet.calories = 1200
		# @diet.carbohydrate_percentage = 34
		# @diet.protein_percentage = 33
		# @diet.fat_percentage = 33
		# @person = Person.find(params[:id_person])
		# @foods = @person.foods
		# @diet.meals.clear

		# # Breakfast
		# @meal_breakfast = Meal.new
		# @meal_breakfast.name = "Breakfast"

		# @meal_breakfast.calories = @diet.calories / 3
		# @calories_breakfast_carbs = @meal_breakfast.calories * @diet.carbohydrate_percentage / 100
		# @calories_breakfast_proteins = @meal_breakfast.calories * @diet.protein_percentage / 100
		# @calories_breakfast_fats = @meal_breakfast.calories * @diet.fat_percentage / 100

		# @foods_breakfast_carbs.each do |food|
		# 	if ((@diet.meals.size>0) && !(@diet.meals.foods.include? food))
		# 	 	@carb_breakfast = food
		# 	end
		# end
		# if @carb_breakfast.nil?
		# 	@carb_breakfast = @foods_breakfast_carbs.first
		# end
		# @portion = Portion.new
		# @portion.size = @calories_breakfast_carbs * (@carb_breakfast.size / @carb_breakfast.calories)
		# @portion.food = @carb_breakfast
		# @meal_breakfast.portions << @portion

		# # @calories_breakfast_carbs_per_food = @calories_breakfast_carbs /  @foods_breakfast_carbs.size
		# # @foods_breakfast_carbs.each do |food|
		# # 	@portion = Portion.new
		# # 	@portion.size = @calories_breakfast_carbs_per_food * (food.size / food.calories)
		# # 	@portion.food = food
		# # 	@meal_breakfast.portions << @portion
		# # end

		# @calories_breakfast_proteins_per_food = @calories_breakfast_proteins /  @foods_breakfast_proteins.size
		# @foods_breakfast_proteins.each do |food|
		# 	@portion = Portion.new
		# 	@portion.size = @calories_breakfast_proteins_per_food * (food.size / food.calories)
		# 	@portion.food = food
		# 	@meal_breakfast.portions << @portion
		# end


		# @calories_breakfast_fats_per_food = @calories_breakfast_fats /  @foods_breakfast_fats.size
		# @foods_breakfast_fats.each do |food|
		# 	@portion = Portion.new
		# 	@portion.size = @calories_breakfast_fats_per_food * (food.size / food.calories)
		# 	@portion.food = food
		# 	@meal_breakfast.portions << @portion
		# end

		# @meal_foods = @meal_breakfast.portions.map { |item| item.food }
		# @meal_carbohydrate = @meal_breakfast.portions.inject(0){|sum,portion| sum + (portion.food.carbohydrate * (portion.size / portion.food.size))}
		# @meal_protein = @meal_breakfast.portions.inject(0){|sum,portion| sum + (portion.food.protein * (portion.size / portion.food.size))}
		# @meal_fat = @meal_breakfast.portions.inject(0){|sum,portion| sum + (portion.food.fat * (portion.size / portion.food.size))}
		# @meal_size = @meal_carbohydrate + @meal_protein + @meal_fat
		# @meal_breakfast.carbohydrate_percentage = @meal_carbohydrate / @meal_size * 100
		# @meal_breakfast.protein_percentage = @meal_protein / @meal_size * 100
		# @meal_breakfast.fat_percentage = @meal_fat / @meal_size * 100
		# @diet.meals << @meal_breakfast

		# # Lunch
		# @meal_lunch = Meal.new
		# @meal_lunch.name = "Lunch"

		# @meal_lunch.calories = @diet.calories * (4 / 9.0)
		# @calories_lunch_carbs = @meal_lunch.calories * @diet.carbohydrate_percentage / 100
		# @calories_lunch_proteins = @meal_lunch.calories * @diet.protein_percentage / 100
		# @calories_lunch_fats = @meal_lunch.calories * @diet.fat_percentage / 100

		# @calories_lunch_carbs_per_food = @calories_lunch_carbs /  @foods_lunch_carbs.size
		# @foods_lunch_carbs.each do |food|
		# 	@portion = Portion.new
		# 	@portion.size = @calories_lunch_carbs_per_food * (food.size / food.calories)
		# 	@portion.food = food
		# 	@meal_lunch.portions << @portion
		# end

		# @calories_lunch_proteins_per_food = @calories_lunch_proteins /  @foods_lunch_proteins.size
		# @foods_lunch_proteins.each do |food|
		# 	@portion = Portion.new
		# 	@portion.size = @calories_lunch_proteins_per_food * (food.size / food.calories)
		# 	@portion.food = food
		# 	@meal_lunch.portions << @portion
		# end


		# @calories_lunch_fats_per_food = @calories_lunch_fats /  @foods_lunch_fats.size
		# @foods_lunch_fats.each do |food|
		# 	@portion = Portion.new
		# 	@portion.size = @calories_lunch_fats_per_food * (food.size / food.calories)
		# 	@portion.food = food
		# 	@meal_lunch.portions << @portion
		# end

		# @meal_foods = @meal_lunch.portions.map { |item| item.food }
		# @meal_carbohydrate = @meal_lunch.portions.inject(0){|sum,portion| sum + (portion.food.carbohydrate * (portion.size / portion.food.size))}
		# @meal_protein = @meal_lunch.portions.inject(0){|sum,portion| sum + (portion.food.protein * (portion.size / portion.food.size))}
		# @meal_fat = @meal_lunch.portions.inject(0){|sum,portion| sum + (portion.food.fat * (portion.size / portion.food.size))}
		# @meal_size = @meal_carbohydrate + @meal_protein + @meal_fat
		# @meal_lunch.carbohydrate_percentage = @meal_carbohydrate / @meal_size * 100
		# @meal_lunch.protein_percentage = @meal_protein / @meal_size * 100
		# @meal_lunch.fat_percentage = @meal_fat / @meal_size * 100
		# @diet.meals << @meal_lunch


		# # Dinner
		# @meal_dinner = Meal.new
		# @meal_dinner.name = "Dinner"

		# @meal_dinner.calories = @diet.calories * (2 / 9.0)
		# @calories_dinner_carbs = @meal_dinner.calories * @diet.carbohydrate_percentage / 100
		# @calories_dinner_proteins = @meal_dinner.calories * @diet.protein_percentage / 100
		# @calories_dinner_fats = @meal_dinner.calories * @diet.fat_percentage / 100

		# @calories_dinner_carbs_per_food = @calories_dinner_carbs /  @foods_dinner_carbs.size
		# @foods_dinner_carbs.each do |food|
		# 	@portion = Portion.new
		# 	@portion.size = @calories_dinner_carbs_per_food * (food.size / food.calories)
		# 	@portion.food = food
		# 	@meal_dinner.portions << @portion
		# end

		# @calories_dinner_proteins_per_food = @calories_dinner_proteins /  @foods_dinner_proteins.size
		# @foods_dinner_proteins.each do |food|
		# 	@portion = Portion.new
		# 	@portion.size = @calories_dinner_proteins_per_food * (food.size / food.calories)
		# 	@portion.food = food
		# 	@meal_dinner.portions << @portion
		# end


		# @calories_dinner_fats_per_food = @calories_dinner_fats /  @foods_dinner_fats.size
		# @foods_dinner_fats.each do |food|
		# 	@portion = Portion.new
		# 	@portion.size = @calories_dinner_fats_per_food * (food.size / food.calories)
		# 	@portion.food = food
		# 	@meal_dinner.portions << @portion
		# end

		# @meal_foods = @meal_dinner.portions.map { |item| item.food }
		# @meal_carbohydrate = @meal_dinner.portions.inject(0){|sum,portion| sum + (portion.food.carbohydrate * (portion.size / portion.food.size))}
		# @meal_protein = @meal_dinner.portions.inject(0){|sum,portion| sum + (portion.food.protein * (portion.size / portion.food.size))}
		# @meal_fat = @meal_dinner.portions.inject(0){|sum,portion| sum + (portion.food.fat * (portion.size / portion.food.size))}
		# @meal_size = @meal_carbohydrate + @meal_protein + @meal_fat
		# @meal_dinner.carbohydrate_percentage = @meal_carbohydrate / @meal_size * 100
		# @meal_dinner.protein_percentage = @meal_protein / @meal_size * 100
		# @meal_dinner.fat_percentage = @meal_fat / @meal_size * 100
		# @diet.meals << @meal_dinner


		#render 'show'
	end

	def list_chronic_disease
		@person = Person.find(params[:id_person])
		@diets = Diet.all
		@selected_diets = @diets.select {|diet| @person.diseases.map { |disease| disease.name}.include?(diet.goal)}
	end

	private
	  def diet_params
	    params.require(:diet).permit(:name, :calories, :carbohydrate_percentage, :protein_percentage, :fat_percentage, meals_attributes: [:id, portions_attributes:[:id, :size]])
	  end

	  def portion_params
	    params.require(:portion).permit(:size)
	  end
end
