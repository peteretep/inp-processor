class IniUploadController < ApplicationController
  def index
  end

  def upload
    if params[:iniFile]
      file = params[:iniFile]
      puts file
      ProcessIniFileJob.perform_now file
      redirect_to root_url, notice: 'File uploaded and will be processed'
    end
  end
end
