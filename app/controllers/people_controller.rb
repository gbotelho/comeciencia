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
		        #redirect_to list_one_food_path(@person)
		        redirect_to chronic_disease_person_path(@person)
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

	def chronic_disease
		@person = Person.find(params[:id_person])
	end

	def add_chronic_disease
		@person = Person.find(params[:id_person])
		if @person.update(person_chronic_disease_params)
			if (@person.diseases.size > 0)
				redirect_to list_chronic_disease_diet_path(@person)
			else
	    		redirect_to list_one_food_path(@person)
	    	end
		else
			render 'chronic_disease'
		end
	end

    private
	  def person_params
	    params.require(:person).permit(:name, :height, :weight, :age, :sex, user_attributes: [:email, :password, :password_confirmation, :encrypted_password], diets_attributes: [:id, :goal])
	  end

	  def person_chronic_disease_params
	    params[:person].permit(disease_ids:[])
	  end

	  def person_params_new
	    params.require(:person).permit(:name, :height, :weight, :age, :sex, user_attributes: [:email, :password, :password_confirmation, :encrypted_password])
	  end
end
