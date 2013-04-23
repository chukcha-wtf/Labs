class QuestionsController < ApplicationController

  def index
    @lab_work = LabWork.find(params[:lab_work_id])
    @questions = @lab_work.questions
  end

  def result
    @lab_work = LabWork.find(params[:lab_work_id])
    result_array = params[:quest]
    wright_answers = 0
    wrong_answers = 0
    
    (0...result_array.length).step(2) do |i|
      q_id = result_array[i].to_i
      a_id = result_array[i+1][:answer].first.to_i
      if Answer.where('id = ? AND question_id = ?', a_id, q_id).first.wright_answer
        wright_answers += 1
      else
        wrong_answers += 1
      end
    end

    @good_boy = true if wright_answers >= 1 #(result_array.length * 0.6)
  end

end
