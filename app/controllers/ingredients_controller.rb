class IngredientsController < ApplicationController
  
  # def index
  #   @ingredients = Ingredient.all
  # end
  
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(params[:ingredient])
    if @ingredient.save
      redirect_to "show" 
    else
      flash[:error] = @ingredient.errors.empty? ? "Error" : @ingredient.errors.full_messages.to_sentence
      render "new"
    end
  end
  
  # def show
  #   @ingredient = Ingredient.find(params[:id])
  # end
  
  # def edit
  #   @ingredient = Ingredient.find(params[:id])
  # end
  
  # def update
  #   @ingredient = Ingredient.find(params[:id])
  #   @ingredient.update_attributes(params[:ingredient])
  # end
  
  # def destroy
  # end
  
end
