class HomeController < ApplicationController
  def index
  end

  def admin
    @labs = LabWork.all
    
  end
end
