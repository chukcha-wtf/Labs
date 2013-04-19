# encoding: utf-8

class LabDatasController < ApplicationController
    before_filter :authenticate_user!, except: [:index, :show]


  def index
    @lab_datas = LabData.page(params[:page]).per(5)
  end

  def show
  end

  def new
    @lab_data = LabData.new
    authorize! :manage, @lab_data
  end

  def create
    @lab_data = LabData.new(params[:lab_data])
    authorize! :manage, @lab_data

    if @lab_data.save
      redirect_to @lab_data, notice: "Успішно додано нову Лабораторну роботу."
    else
      render :new
    end
  end

  def edit
    @lab_data = LabData.find(params[:id])
    authorize! :manage, @lab_data

  end

  def update
    @lab_data = LabData.find(params[:id])
    authorize! :manage, @lab_data

    if @lab_data.update_attributes(params[:lab_data])
      redirect_to @lab_data, notice: "Успішно оновлено інформацію."
    else
      render :edit
    end
  end

  def destroy
    @lab_data = LabData.find(params[:id])
    authorize! :manage, @lab_data

    @lab_data.destroy
    redirect_to lab_datas_url, notice: "Лабораторну роботу було видалено."
  end
end
