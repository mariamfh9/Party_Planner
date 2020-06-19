class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.uniq
  end 
  
  def new
  end

  def create
    @category = current_user.categories.build(category_params)

        if @category.valid?
            @category.save
            redirect_to @category
        else
            redirect_to new_category_path
        end 
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
  end

  def update
  end

  def category_params
    params.require(:category).permit(:name)
  end


end