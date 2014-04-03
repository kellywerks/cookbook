class RecipesController < ApplicationController
  def index
    if params[:search] != "" && !params[:search].nil?
      p params[:search]
      @recipes = Recipe.basic_search(params[:search])
    else
      @recipes = Recipe.all
    end
    render('recipes/index.html.erb')
  end

  def new
    @recipe = Recipe.new()
    render('recipes/new.html.erb')
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      redirect_to('/recipes')
    else
      @recipe.errors.full_messages.each do |message|
        flash[:alert] = "Please fix: #{message}"
      end
      render('recipes/new.html.erb')
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    render('recipes/show.html.erb')
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render('recipes/edit.html.erb')
  end

  def update
    @recipe = Recipe.find(params[:id])
    if Tag.find(params[:tag_id])
      @new_tag = Tag.find(params[:tag_id])
      p @new_tag
      @recipe.tags << Tag.find(params[:tag_id])
      redirect_to('/recipes')
    elsif @recipe.update(params[:recipe])
      redirect_to('/recipes')
    else
      @recipe.errors.full_messages.each do |message|
        flash[:alert] = "Please fix: #{message}"
      end
      render('recipes/edit.html.erb')
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to('/recipes/')
  end
end
