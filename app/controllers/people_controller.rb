class PeopleController < ApplicationController

	def index
		@people = Person.all
	end

	def show
    	@person = Person.find(params[:id])
    end

	def new
    	@person = Person.new
  		@person.build_user
  		if @person.diets.first.nil?
  			@person.diets.new
  		end
	end
	
	def edit
	  @person = Person.find(params[:id])
	end

	def create
		@person = Person.new(person_params)

		if @person.save
			if params[:submit] == 'montar'
		        redirect_to edit_diet_path(@person.diets.first)
		    elsif params[:submit] == 'descobrir'
		        redirect_to list_one_food_path(@person)
		    end
		else
			render 'new'
		end
	end

	def update
	  @person = Person.find(params[:id])
	 
	  if @person.update(person_params)
	    redirect_to edit_diet_path(@person.diets.first)
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @person = Person.find(params[:id])
	  @person.destroy
	 
	  redirect_to people_path
	end

    private
	  def person_params
	    params.require(:person).permit(:name, :height, :weight, :age, :sex, user_attributes: [:email], diets_attributes: [:id, :goal])
	  end

	  def person_params_new
	    params.require(:person).permit(:name, :height, :weight, :age, :sex, user_attributes: [:email])
	  end
end
