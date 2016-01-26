# create_table "cats", force: :cascade do |t|
#   t.date     "birth_date",            null: false
#   t.string   "color",                 null: false
#   t.string   "name",                  null: false
#   t.string   "sex",         limit: 1, null: false
#   t.text     "description"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
c1 = Cat.create!(birth_date: '2013-02-01',  sex: 'M', color: 'Black', name: 'Tim')
c2 = Cat.create!(birth_date: '2011-02-01',  sex: 'F', color: 'White', name: 'Sophie')
