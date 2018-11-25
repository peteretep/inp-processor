class InpUploadController < ApplicationController
  def index
  end

  def upload
    if params[:inpFile]
      file = params[:inpFile]
      email = params[:email]
      ProcessInpFileJob.perform_now(file.path, email)
      redirect_to root_url, notice: 'File uploaded and will be processed'
    end
  end
end
