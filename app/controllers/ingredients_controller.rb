class IngredientsController < ApplicationController
  
  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.create(params[:ingredient])
    if @ingredient.save
      redirect_to ingredient_path(@ingredient) 
    else
      flash[:error] = @ingredient.errors.empty? ? "Error" : @ingredient.errors.full_messages.to_sentence
      render new_ingredient_path
    end
  end
  
end
