class Admin::EventAttachmentsController < AdminController

  before_action :find_event

  def index
    @attachments = @event.attachments.order("id DESC")
  end

  def show
    @attachment = @event.attachments.find(params[:id])
  end

  def new
    @attachment = @event.attachments.new
  end

  def edit
    @attachment = @event.attachments.find(params[:id])
  end

  def create
    @attachment = @event.attachments.new(attachment_params)

    if @attachment.save
      flash[:notice] = "图片上传成功"
      redirect_to admin_event_attachments_path(@event)
    else
      render "new"
    end
  end

  def update
    @attachment = @event.attachments.find(params[:id])

    if @attachment.update(attachment_params)
      redirect_to admin_event_attachment_path(@event, @attachment)
    else
      render "new"
    end
  end

  def destroy
    @attachment = @event.attachments.find(params[:id])

    @attachment.destroy
    flash[:alert] = "图片已删除"
    redirect_to admin_event_attachments_path(@event)
  end

  private

  def find_event
    @event = Event.find_by_friendly_id(params[:event_id])
  end

  def attachment_params
    params.require(:event_attachment).permit(:attachment, :description)
  end
end
