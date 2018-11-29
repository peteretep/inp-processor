class ProcessInpFileJob < ApplicationJob
require 'inpImporter/inpImporter'
  queue_as :default

  def perform(file_path, email)
    inp_importer = InpImporter.new(file_path)
    building = Building.new(inp_importer.general)
    building.save
  end
end
