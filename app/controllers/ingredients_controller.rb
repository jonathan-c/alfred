class IngredientsController < ApplicationController
  
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
  
end
