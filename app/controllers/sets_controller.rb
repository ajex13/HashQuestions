class SetsController < ApplicationController
  def index
  end

  def upload_file
    uploadedFile = params[:upload][:file]
    File.open(Rails.root.join('saved_files',uploadedFile.original_filename), 'wb') do |f|
      f.write(uploadedFile.read)
    end

    redirect_to sets_index_path
  end

  def download_file
    fileName = params[:download][:fileName]
    send_file Rails.root.join('saved_files',fileName)
  end
end
