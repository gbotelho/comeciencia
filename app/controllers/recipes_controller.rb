class RecipesController < ApplicationController
	http_basic_authenticate_with name: "gabi", password: "gabi", except: [:index, :show, :blog]
	skip_before_filter :verify_authenticity_token, :only => [:update_portion]

	def index
		@recipes = Recipe.all
	end

	def show
    	@recipe = Recipe.find(params[:id])
    end

	def new
		@recipe = Recipe.new
	end

	def edit
	  @recipe = Recipe.find(params[:id])
	  @foods = Food.all
	end

	def create
	  @recipe = Recipe.new(recipe_params)
	 
	  if @recipe.save
	    redirect_to @recipe
	  else
	    render 'new'
	  end
	end
	 
	def update
	  @recipe = Recipe.find(params[:id])
	 
	  if @recipe.update(recipe_params)
	    redirect_to @recipe
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @recipe = Recipe.find(params[:id])
	  @recipe.destroy
	 
	  redirect_to welcome_admin_path
	end

	def blog
		@recipes = Recipe.all
	end

	def update_portion
	  @recipe = Recipe.find(params[:id_recipe])
	  @portion = Portion.find(params[:id_portion])
	  @portion.update(portion_params)
	  @recipe.save
	  @foods = Food.all

	  respond_to do |format|
	    format.js 
	    format.html
	  end
	end


	def add_food_recipe
		@recipe = Recipe.find(params[:id_recipe])
		food = Food.find(params[:id_food])
		@portion = Portion.new
		@portion.size = food.size
		@portion.food = food
		@recipe.portions << @portion
		@recipe.save
		@foods = Food.all

		respond_to do |format|
	    	format.js 
	    	format.html
	  	end
	end

	def remove_portion_recipe
		@recipe = Recipe.find(params[:id_recipe])
		@portion = Portion.find(params[:id_portion])
		food = @portion.food
		@recipe.portions.delete(@portion)
		@recipe.save
		@foods = Food.all

		respond_to do |format|
	    	format.js 
	    	format.html
	  	end
	end

	private
	  def recipe_params
	    params.require(:recipe).permit(:title, :description, :image)
	  end

	  def portion_params
	    params.require(:portion).permit(:size)
	  end
	
end
