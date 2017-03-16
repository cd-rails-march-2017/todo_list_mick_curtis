FactoryGirl.define do
  factory :task do
    content "MyString"
    due_date "2017-03-16 15:40:38"
    completed false
    user nil
  end
end
