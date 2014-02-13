class IngredientsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @ingredients = Ingredient.all
  end
  
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(params[:ingredient])
    if @ingredient.save
      redirect_to new_ingredient_path, flash: {success: "Ingredient added."}
    else
      flash[:error] = @ingredient.errors.empty? ? "Error" : @ingredient.errors.full_messages.to_sentence
      render new_ingredient_path
    end
  end
  
  def show
    @ingredient = Ingredient.find(params[:id])
  end
  
  def edit
    @ingredient = Ingredient.find(params[:id])
  end
  
  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update_attributes(params[:ingredient])
      redirect_to ingredient_path(@ingredient), flash: {success: "Ingredient updated."}
    else
      redirect_to edit_ingredient_path
    end
  end
  
  def destroy  
    @ingredient = Ingredient.find(params[:id])  
    @ingredient.destroy  
    redirect_to ingredients_path, flash: {success: "Successfully deleted ingredient."}
  end
end
