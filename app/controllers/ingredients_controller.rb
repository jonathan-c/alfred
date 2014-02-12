class IngredientsController < ApplicationController
  before_filter :authenticate_user!
  
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
  
end
