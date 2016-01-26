class CatsController < ApplicationController
  def index
    @cat = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :show
    else
      redirect_to cat_url
    end
  end

  def new
    @cat = Cat.new 
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cats_url
    else
      fail
      render text: @cat.errors.full_messages
    end
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
  end

  def update
    @cat = Cat.update(params[:id], cat_params)
    redirect_to cat_url
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :sex, :birth_date, :color, :description)
  end

end
