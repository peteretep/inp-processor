# frozen_string_literal: true

# Inp file format handler
class InpImporter
  def initialize(file_path)
    @file_path = file_path
  end

  def data
    @parsedata ||= parse
  end

  # Parses the file
  # @return [Hash] the ini file parsed into a hash using downcase underscore symbols as keys
  def parse
    @parsedata = {}
    File.foreach(@file_path) do |line|
      k, v = line.split('=', 2)
      next unless k.present? && v.present?

      key = k.strip.delete_prefix('"').delete_suffix('"')
      value = v.strip.delete_prefix('"').delete_suffix('"')
      @parsedata.store(key.underscore.to_sym, value)
    end
    @parsedata
  end

  def general
    general_keyset = %i[p_name b_type b_address_0 b_address_1 b_address_2 b_address_3 
                        b_city b_postcode o_name o_telephone o_address o_city o_postcode 
                        c_name c_accred_scheme c_reg_number c_emp_trad_name c_emp_trad_address 
                        b_loc_description b_insp_date c_insurer c_ins_pol_number c_ins_eff_date 
                        c_ins_exp_date c_ins_pi_limit path_file_interface c_qualifications
                        uprn c_rel_part_disc nos_level weather html_dr_reports interface_val
                        interface interface_version act_not building_area elec_power_factor
                        light_metering build_orientation dh_co2_f dh_primf transaction_type
                        soft_comp_name max_storey]
    data.slice(*general_keyset)
  end
end
