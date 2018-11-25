class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :p_name
      t.string :b_type
      t.string :b_address_0
      t.string :b_address_1
      t.string :b_address_2
      t.string :b_address_3
      t.string :b_city
      t.string :b_postcode
      t.string :o_name
      t.string :o_telephone
      t.string :o_address
      t.string :o_city
      t.string :o_postcode
      t.string :c_name
      t.string :c_accred_scheme
      t.string :c_reg_number
      t.string :c_emp_trad_name
      t.string :c_emp_trad_address
      t.string :b_loc_description
      t.datetime :b_insp_date
      t.string :c_insurer
      t.string :c_ins_pol_number
      t.datetime :c_ins_eff_date
      t.datetime :c_ins_exp_date
      t.string :c_ins_pi_limit
      t.string :path_file_interface
      t.string :c_qualifications
      t.string :uprn
      t.string :c_rel_part_disc
      t.string :nos_level
      t.string :weather
      t.string :html_dr_reports
      t.string :interface_val
      t.string :interface
      t.string :interface_version
      t.string :act_not
      t.float :building_area
      t.float :elec_power_factor
      t.float :light_metering
      t.float :build_orientation
      t.float :dh_co2f
      t.float :dh_primf
      t.string :transaction_type
      t.string :soft_comp_name
      t.integer :max_storey
      t.timestamps
    end
  end
end
