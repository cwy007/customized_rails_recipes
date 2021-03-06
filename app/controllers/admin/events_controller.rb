class Admin::EventsController < AdminController

  def index
    @events = Event.rank(:row_order).all
    @categories = Category.all

    if Array(params[:statuses]).any?
      @events = @events.by_status(params[:statuses])
    end

    if Array(params[:category_ids]).any?
      @events = @events.by_category(params[:category_ids])
    end
  end

  def show
    @event = Event.find_by_friendly_id!(params[:id])
  end

  def new
    @event = Event.new
    @event.tickets.build
    @event.attachments.build
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = "活动 #{@event.name} 新建成功"
      redirect_to admin_events_path
    else
      render "new"
    end
  end

  def edit
    @event = Event.find_by_friendly_id!(params[:id])
    @event.tickets.build if @event.tickets.empty?
    @event.attachments.build if @event.attachments.empty?
  end

  def update
    @event = Event.find_by_friendly_id!(params[:id])

    if @event.update(event_params)
      flash[:notice] = "活动 #{@event.name} 修改成功"
      redirect_to admin_events_path
    else
      render "edit"
    end
  end

  def destroy
    @event = Event.find_by_friendly_id!(params[:id])
    @event.destroy

    flash[:alert] = "活动 #{@event.name} 已删除"
    redirect_to admin_events_path
  end

  def bulk_update
    total = 0
    Array(params[:ids]).each do |event_id|  # NOTE Array() = [] 
      event = Event.find(event_id)

      if params[:commit] == I18n.t(:bulk_update)
        event.status = params[:event_status]
        if event.save
          total += 1
        end
      elsif params[:commit] == I18n.t(:bulk_delete)
        event.destroy
        total += 1
      end
    end

    case params[:commit]
    when I18n.t(:bulk_update)
      flash[:notice] = "成功完成 #{total} 笔#{params[:commit]}"
    else
      flash[:alert] = "成功完成 #{total} 笔#{params[:commit]}"
    end

    redirect_to admin_events_path
  end

  def reorder
    @event = Event.find_by_friendly_id!(params[:id])
    @event.row_order_position = params[:position]
    @event.save!

    respond_to do |format|
      format.html { redirect_to admin_events_path }
      format.json { render :json => { :message => "ok" } }
    end
  end

  protected

  def event_params           # NOTE :images => [] position
    params.require(:event).permit(:name, :logo, :remove_logo, :remote_logo_url, :remove_images,
                                  :description, :friendly_id, :status, :category_id, :images => [],
                                  :tickets_attributes => [:id, :name, :description, :price, :_destroy],
                                  :attachments_attributes => [:id, :attachment, :description, :_destroy])
  end

end
