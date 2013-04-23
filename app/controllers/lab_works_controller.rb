#encoding: utf-8

class LabWorksController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :graphs, :graph]
  

  def index
    @lab_works = LabWork.all
  end

  def graphs
    # @lab_work = LabWork.find(params[:lab_work_id])
    @lab_datas = LabData.where(:lab_work_id => 1).page(params[:page]).per(5)
  end

  def graph
    @lab_work = LabWork.find(params[:lab_work_id])
    @lab_data = @lab_work.lab_datas.sample
  end

  def show
    @lab_work = LabWork.find(params[:id])
    respond_to do |wants|
      wants.html
      wants.json { render json: @lab_work }
    end
  end

  def new
    @lab_work = LabWork.new
    authorize! :manage, @lab_work
    @lab_work.questions.build
  end

  def create
    @lab_work = LabWork.new(params[:lab_work])
    authorize! :manage, @lab_work

    if @lab_work.save
      redirect_to @lab_work, notice: "Успішно додано нову Лабораторну роботу."
    else
      render :new
    end
  end

  def edit
    @lab_work = LabWork.find(params[:id])
    authorize! :manage, @lab_work

  end

  def update
    @lab_work = LabWork.find(params[:id])
    authorize! :manage, @lab_work

    if @lab_work.update_attributes(params[:lab_work])
      redirect_to @lab_work, notice: "Успішно оновлено інформацію."
    else
      render :edit
    end
  end

  def destroy
    @lab_work = LabWork.find(params[:id])
    authorize! :manage, @lab_work

    @lab_work.destroy
    redirect_to lab_works_url, notice: "Лабораторну роботу було видалено."
  end
end

