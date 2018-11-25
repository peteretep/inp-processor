class ProcessIniFileJob < ApplicationJob
  queue_as :default

  def perform(file)
    data = File.read(file.path)

    building = Building.new
    building.p_name = /P-NAME\s*=\s*"(?<pname>.+)"/.match(data)[1]
    # TODO: There is a strict list of building types. Use enums?
    building.b_type = /B-TYPE\s*=\s*(?<btype>.+)/.match(data)[1]

    building.save
    # IniProcessedMailer.ini_processed_email.deliver_now
  end
end
