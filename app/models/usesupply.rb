class Usesupply < ActiveRecord::Base
 belongs_to :stationery
 belongs_to :issuesupply,       :class_name => 'staff', :foreign_key => 'issuedby'
 belongs_to :receivesupply,       :class_name => 'staff', :foreign_key => 'receivedby'
end