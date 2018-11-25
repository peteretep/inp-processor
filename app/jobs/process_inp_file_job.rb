class ProcessInpFileJob < ApplicationJob
  queue_as :default

  def perform(file_path, email)
    data = File.read(file_path)

    building = Building.new
    building.p_name = /P-NAME\s*=\s*"(?<pname>.+)"/.match(data)[1]
    # TODO: There is a strict list of building types. Use enums?
    building.b_type = /B-TYPE\s*=\s*(?<btype>.+)/.match(data)[1]

    building.save
    InpProcessedMailer.inp_processed_email(email).deliver_now
  end
end
