class Task < ActiveRecord::Base
  belongs_to :user
  validates :user, :content, :due_date, presence: true
end
