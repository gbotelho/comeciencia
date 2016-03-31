class FoodsController < ApplicationController

	def index
		@foods = Food.all
	end

	def list
		@foods = Food.all
		@person = Person.find(params[:id_person])
		@foods_person = @person.foods
	end

	def list_carbs
		@foods = Food.where(:high_carbohydrate => true)
		@person = Person.find(params[:id_person])
		@foods_person = @person.foods
	end

	def list_proteins
		@person = Person.find(params[:id_person])
		@foods_person = @person.foods
		@foods_breakfast_carbs = @foods_person.select{ |item| ((item[:breakfast] == true) && (item[:high_carbohydrate] == true))}
		@foods_lunch_carbs = @foods_person.select{ |item| ((item[:lunch] == true) && (item[:high_carbohydrate] == true))}
		@foods_dinner_carbs = @foods_person.select{ |item| ((item[:dinner] == true) && (item[:high_carbohydrate] == true))}
		@foods_snack_carbs = @foods_person.select{ |item| ((item[:snack] == true) && (item[:high_carbohydrate] == true))}
		if @foods_breakfast_carbs.size == 0 || @foods_lunch_carbs.size == 0 || @foods_dinner_carbs.size == 0 || @foods_snack_carbs.size == 0
			flash[:notice] = "You have to select at least one carb per meal: #{@foods_breakfast_carbs.size}, #{@foods_lunch_carbs.size},
			#{@foods_dinner_carbs.size}, #{@foods_snack_carbs.size}, #{@foods_person.size}"
			redirect_to(:back)
		end
		@foods = Food.where('(protein / size) > (1.0/3)')
	end

	def list_fats
		@person = Person.find(params[:id_person])
		@foods_person = @person.foods
		@foods_breakfast_proteins = @foods_person.select{ |item| ((item[:breakfast] == true) && (item[:high_protein] == true))}
		@foods_lunch_proteins = @foods_person.select{ |item| ((item[:lunch] == true) && (item[:high_protein] == true))}
		@foods_dinner_proteins = @foods_person.select{ |item| ((item[:dinner] == true) && (item[:high_protein] == true))}
		@foods_snack_proteins = @foods_person.select{ |item| ((item[:snack] == true) && (item[:high_protein] == true))}
		if @foods_breakfast_proteins.size == 0 || @foods_lunch_proteins.size == 0 || @foods_dinner_proteins.size == 0 || @foods_snack_proteins.size == 0
			flash[:notice] = "You have to select at least one protein per meal: #{@foods_breakfast_proteins.size}, #{@foods_lunch_proteins.size},
			#{@foods_dinner_proteins.size}, #{@foods_snack_proteins.size}, #{@foods_person.size}"
			redirect_to(:back)
		end
		@foods = Food.where('(fat / size) > (1.0/3)')
	end

	def select
		@food = Food.find(params[:id_food])
		@person = Person.find(params[:id_person])
		@person.foods << @food
		redirect_to(:back)
	end

	def unselect
		@food = Food.find(params[:id_food])
		@person = Person.find(params[:id_person])
		@person.foods.delete(@food)
		redirect_to(:back)
	end
end
