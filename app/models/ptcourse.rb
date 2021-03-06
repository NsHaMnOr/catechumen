class Ptcourse < ActiveRecord::Base
  belongs_to :provider, :class_name => 'AddressBook', :foreign_key => 'provider_id'
  has_many :ptschedules, :dependent => :destroy
  
  validates_presence_of :name, :provider
  
  
  
  def rendered_course_type
    (Ptcourse::COURSE_TYPE.find_all{|disp, value| value == course_type }).map {|disp, value| disp}
  end
  
  def rendered_course_duration
    (Ptcourse::DUR_TYPE.find_all{|disp, value| value == duration_type }).map {|disp, value| disp}
  end
  
  COURSE_TYPE = [
       #  Displayed       stored in db
       [ "In-House",              5 ],
       [ "External Short Course",10 ],
       [ "Seminar",              15 ],
       [ "Certificate",          20 ],
       [ "Diploma/Others",       25 ],
  ]
  
  DUR_TYPE = [
       #  Displayed       stored in db
       [ I18n.t("time.days"),  1 ],
       [ I18n.t("time.months"),2 ],
       [ I18n.t("time.years"), 3 ],
  ]
end
