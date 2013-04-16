# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lab_datum, :class => 'LabData' do
    lab_work_id 1
  end
end
