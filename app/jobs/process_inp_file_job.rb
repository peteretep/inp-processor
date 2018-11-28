class ProcessInpFileJob < ApplicationJob
require 'inpImporter/inpImporter'
  queue_as :default

  def perform(file_path, email)
    parse_data = InpImporter.new(file_path).parse
    building = Building.new
    building.p_name = parse_data[:p_name]
    building.b_type = parse_data[:b_type]
    building.save
  end

end
