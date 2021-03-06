class EventCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_event

  def create
    if params[:comment][:parent_id].to_i > 0
      parent = @event.comments.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params)
    else
      @comment = @event.comments.new(comment_params)
    end
    @comment.user = current_user
    @comment.event = @event
    
    if @comment.save

      flash[:notice] = "comment 新建成功"
    end
    redirect_to event_path(@event)
  end

  def update
    @comment = @event.comments.find(params[:id])

    if @comment.update(comment_params)
      flash[:notice] = "comment 修改成功"
    end
    redirect_to event_path(@event)
  end

  def destroy
    @comment = @event.comments.find(params[:id])

    @comment.destroy
    flash[:alert] = "comment 已经删除"
    redirect_to event_path(@event)
  end

  private

  def find_event
    @event = Event.find_by_friendly_id(params[:event_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
