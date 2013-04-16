class Question < ActiveRecord::Base
  attr_accessible :content, :lab_work_id, :answers_attributes

  belongs_to :lab_work
  has_many :answers
  accepts_nested_attributes_for :answers, allow_destroy: true
end
