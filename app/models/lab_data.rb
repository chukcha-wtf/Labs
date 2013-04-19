class LabData < ActiveRecord::Base
  attr_accessible :title, :lab_work_id, :data

  belongs_to :lab_work

  mount_uploader :data, LabDataUploader

end
