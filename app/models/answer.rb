class Answer < ActiveRecord::Base
  attr_accessible :content, :question_id, :wright_answer

  belongs_to :question
end
