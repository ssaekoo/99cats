# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime
#  updated_at :datetime
#

class CatRentalRequestsController < ApplicationController
  def new
    @catrentals = Cat.all
    render :new
  end

  def create
    @catrentals = CatRentalRequest.new(cat_rental_params)
    if @catrentals.save
      redirect_to cats_url
    else
      fail
      render text: @catrentals.errors.full_messages
    end
  end

  private
  def cat_rental_params
    params.require(:cat_rental_requests).permit(:cat_id, :start_date, :end_date)
  end

end
