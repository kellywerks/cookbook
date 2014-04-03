class ClassificationsController < ApplicationController
  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @tag = Tag.find(params[:tag_id])
    @tag.recipes.delete( @recipe )
    redirect_to("/tags/#{@tag.id}")
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @tag = Tag.find(params[:tag_id])
    @tag.recipes << @recipe
    redirect_to("/recipes/#{@recipe.id}")
  end
end
