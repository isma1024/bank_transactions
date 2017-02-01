class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(accounts_params)
    if @category.save
      redirect_to categories_path
    else
      render :action => 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(accounts_params)
      redirect_to categories_path
    else
      render :action => :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  def show
    @category = Category.find(params[:id])
  end

  private
  def accounts_params
    params.require(:category).permit(:name)
  end
end
