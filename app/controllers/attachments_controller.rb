class AttachmentsController < ApplicationController
  # before_action set_attachment, only: [:show]
  skip_after_action :verify_authorized, only: [:new]

  def new
    @index = params[:index].to_i
    @ticket = Ticket.new
    @ticket.attachments.build
    render layout: false
  end

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
