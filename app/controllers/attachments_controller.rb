class AttachmentsController < ApplicationController
  # before_action set_attachment, only: [:show]

  def show
    attachment = Attachment.find(params[:id])
    authorize attachment, :show?
    send_file attachment.file.path, disposition: :inline
  end

  # private
  #
  # def set_attachment
  #   @attachment = Attachment.find(params[:id])
  # end
end
