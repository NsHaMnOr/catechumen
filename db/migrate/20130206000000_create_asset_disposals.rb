class CreateAssetDisposals < ActiveRecord::Migration
  def self.up   
    create_table :asset_disposals do |t|
      t.integer  :asset_id
      t.integer  :quantity
      t.integer  :asset_defect_id
      t.text     :description
      t.integer  :running_hours
      t.integer  :mileage
      t.string   :current_condition
      t.decimal  :current_value
      t.decimal  :est_repair_cost
      t.decimal  :est_value_post_repair
      t.decimal  :est_time_next_fail
      t.string   :repair1_needed
      t.string   :repair2_needed
      t.string   :repair3_needed
      t.string   :justify1_disposal
      t.string   :justify2_disposal
      t.string   :justify3_disposal
      t.boolean  :is_checked
      t.date     :checked_on
      t.boolean  :is_verified
      t.date     :verified_on
      t.decimal  :revalue
      t.integer  :revalued_by
      t.date     :revalued_on
      t.integer  :document_id
      t.string   :disposal_type
      t.string   :type_others_desc
      t.string   :discard_options
      t.string   :receiver_name
      t.string   :documentation_no
      t.boolean  :is_disposed
      t.integer  :inform_hod
      t.integer  :disposed_by
      t.date     :disposed_on
      t.boolean  :is_discarded
      t.date     :discarded_on
      t.string   :discard_location
      t.integer  :discard_witness_1
      t.integer  :discard_witness_2
      t.integer  :checked_by
      t.integer  :verified_by
      t.string   :examiner1
      t.string   :examiner2
      t.boolean  :is_staff1
      t.boolean  :is_staff2
      t.integer  :examiner_staff1
      t.integer  :examiner_staff2
      t.string   :witness_outsider1
      t.string   :witness_outsider2
      t.boolean  :witness_is_staff1
      t.boolean  :witness_is_staff2
      t.timestamps
    end
    
    create_table :disposals do |t|
      t.integer  :asset_id
      t.boolean  :used
      t.string   :usedduration
      t.decimal  :currentvalue
      t.string   :opinion
      t.string   :recommendation
      t.boolean  :gift
      t.boolean  :status
      t.timestamps
    end
  end
  
  def self.down
  end
end

 