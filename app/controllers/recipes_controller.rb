class RecipesController < ApplicationController
  def index
    if params[:search] != "" && !params[:search].nil?
      @recipes = Recipe.basic_search(params[:search])
    elsif params[:asc_desc] != nil
      p params[:asc_desc]
      p params[:field]
      @recipes = Recipe.order(params[:field].to_sym => params[:asc_desc].to_sym)
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
    if params[:tag_id]
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
