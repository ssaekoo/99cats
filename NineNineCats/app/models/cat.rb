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

require 'Date'

class Cat <ActiveRecord::Base

  validates :birth_date, :color, :name, :sex, presence: true
  validates :sex, inclusion: { in: %w(M F)}
  validates :color, inclusion: { in: %w(Black White Orange Yellow)}

  def age
    DateTime.now.year - birth_date.year
  end

  has_many :cat_rental_requests,
    :dependent => :destroy
end
