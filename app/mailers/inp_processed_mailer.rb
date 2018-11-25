class InpProcessedMailer < ApplicationMailer
  default from: "from@example.com"

  def inp_processed_email(email)
    mail(to: email, subject: 'Your INP file has been processed')
  end
end
