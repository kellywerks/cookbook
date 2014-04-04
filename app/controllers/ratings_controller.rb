class RatingsController < ApplicationController
  def create
    @rating = Rating.create(:rating => params[:rating], :recipe_id => params[:recipe_id])
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.star = @recipe.average_rating
    redirect_to("/recipes/#{params[:recipe_id]}")
  end
end
