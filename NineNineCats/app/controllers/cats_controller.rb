# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class CatsController < ApplicationController
  def index
    @cat = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    @catrentals = CatRentalRequest.where(cat_id: params[:id])
    if @cat
      render :show
    else
      render json: "cat doesn't exist", status: :not_found
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
    @cat = Cat.find(params[:id])
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
