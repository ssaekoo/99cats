# create_table "cats", force: :cascade do |t|
#   t.date     "birth_date",            null: false
#   t.string   "color",                 null: false
#   t.string   "name",                  null: false
#   t.string   "sex",         limit: 1, null: false
#   t.text     "description"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end

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

c1 = Cat.create!(birth_date: '2013-02-01',  sex: 'M', color: 'Black', name: 'Tim')
c2 = Cat.create!(birth_date: '2011-02-01',  sex: 'F', color: 'White', name: 'Sophie')

cr1 = CatRentalRequest.create!(cat_id: 1, start_date: '2016-01-01', end_date: '2016-02-06', status: 'APPROVED')
