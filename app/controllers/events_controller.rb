class EventsController < ApplicationController

  def index
    @events = Event.only_public.rank( :row_order ).all
  end

  def show
    @event = Event.only_available.find_by_friendly_id!(params[:id])
    @comment = Comment.new
    comments = @event.comments
    @comments = comments.hash_tree
  end

end
