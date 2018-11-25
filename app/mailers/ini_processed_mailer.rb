class IniProcessedMailer < ApplicationMailer
  default from: "from@example.com"

  def ini_processed_email
    mail(to: 'peteretep@gmail.com', subject: 'Your INI file has been processed')
  end
end
