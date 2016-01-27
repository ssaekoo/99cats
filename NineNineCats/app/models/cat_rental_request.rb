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

class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING DENIED APPROVED)}
  validate :does_not_overlap_approved_request

  belongs_to :cat

  def overlapping_requests
    CatRentalRequest
      .where("(:id IS NULL) OR (id != :id)", id: self.id)
      .where(cat_id: cat_id)
      .where(<<-SQL, start_date: start_date, end_date: end_date)
       NOT( (start_date > :end_date) OR (end_date < :start_date) )
    SQL
  end

  def overlapping_approved_requests
    overlapping_requests.where("status = 'APPROVED'")
  end

  def denied?
    !overlapping_approved_requests.empty?
  end

  def does_not_overlap_approved_request
    return if self.denied?

    unless overlapping_approved_requests.empty?
      errors[:base] <<
        "Request conflicts with existing approved request"
    end
  end
end
