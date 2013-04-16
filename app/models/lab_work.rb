class LabWork < ActiveRecord::Base
  attr_accessible :description, :title, :questions_attributes, :lab_datas_attributes

  validates_presence_of :title, :description
  validates_uniqueness_of :title

  has_many :questions
  has_many :lab_datas

  accepts_nested_attributes_for :questions, allow_destroy: true
  accepts_nested_attributes_for :lab_datas, allow_destroy: true

end
