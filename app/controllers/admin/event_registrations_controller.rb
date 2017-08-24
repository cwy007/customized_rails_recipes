class Admin::EventRegistrationsController < AdminController

  before_action :find_event

  def index
    @registrations = @event.registrations.includes(:ticket).order("id DESC").page(params[:page]) # NOTE includes(:ticket)

    if params[:status].present? && Registration::STATUS.include?(params[:status])
      @registrations = @registrations.by_status(params[:status])
    end

    if params[:ticket_id].present?
      @registrations = @registrations.by_ticket(params[:ticket_id])
    end

    if params[:start_on].present?
      @registrations = @registrations.where("created_at >= ?", Date.parse(params[:start_on]).beginning_of_day)
    end

    if params[:end_on].present?
      @registrations = @registrations.where("created_at <= ?", Date.parse(params[:end_on]).end_of_day)
    end

    if params[:registration_id].present?
      @registrations = @registrations.where( :id => params[:registration_id].split(",") )
    end 
  end

  def new
    @registration = @event.registrations.new
  end

  def edit
    @registration = @event.registrations.find_by_uuid(params[:id])
  end

  def create
    @registration = @event.registrations.new(registration_params)
    @registration.ticket = @event.tickets.find(params[:registration][:ticket_id])
    @registration.user = current_user
    @registration.status = "confirmed"

    if @registration.save
      flash[:notice] = "Registration 新建成功"
      redirect_to admin_event_registrations_path(@event)
    else
      render "new"
    end
  end

  def update
    @registration = @event.registrations.find_by_uuid(params[:id])

    if @registration.update(registration_params)
      flash[:notice] = "Registration 修改成功"
      redirect_to admin_event_registrations_path
    else
      render "edit"
    end
  end

  def destroy
    @registration = @event.registration.find_by_uuid(params[:id])
    @registration.destroy

    redirect_to admin_event_registrations_path(@event)
  end

  protected

  def find_event
    @event = Event.find_by_friendly_id!(params[:event_id]) # NOTE find_by_friendly_id!
  end

  def registration_params
    params.require(:registration).permit(:status, :ticket_id, :name, :email, :cellphone, :website, :bio)
  end

end
