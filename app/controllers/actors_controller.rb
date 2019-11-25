class ActorsController < ApplicationController
  before_action :setup_mode
  before_action :find_actor, only: [:index, :edit, :update, :destroy, :update_confirmation]
  skip_before_action :verify_authenticity_token

  def index
    @languages = Language.all
    @accents = AccentType.all
  end

  def update                                                                                                                               
    @actor.append_videos(actor_params) if actor_params[:videos]
    @actor.append_photos(actor_params) if actor_params[:photos]
    puts "=============="
    puts actor_params.inspect
    puts "=============="
    @actor.parse_name(actor_params[:full_name]) if actor_params[:full_name]
    @actor.height = actor_params[:height].to_i if actor_params[:height]
    @actor.location = actor_params[:location] if actor_params[:location]
    @actor.birth_date = Date.parse(actor_params[:birth_date]) if actor_params[:birth_date]  
    @actor.phone = actor_params[:phone] if actor_params[:phone]                
    if @actor.save
      render :index                                                  
    else
      render :index 
      #need to add display errors                                                                          
    end                                                                          
  end

  def update_confirmation
    case actor_params[:action].to_sym
    when :send_to_confirmation
      @actor.confirmed = 'P'
    when :cancel_confirmation
      @actor.confirmed = 'N'
    when :approve_confirmation
      @actor.confirmed = 'Y' if @mode == :manager
    end
    if @actor.save!
      render :index 
    else
      render :index 
    end
  end

  private
  def setup_mode
    @manager = @user.manager unless @manager
    @mode = @manager ? :manager : :actor
  end

  def find_actors_manager
    @actors_manager = Manager.find_by(id: @actor.manager_id) unless @actors_manager
  end

  def find_actor
    if @mode == :manager
      @actor = Actor.find_by(id: actor_params[:id].to_i) unless @actor
    elsif @mode == :actor
      unless @actor
        @actor = @user.actor
        @actor ||= Actor.new(user_id: @user.id, manager_id: get_new_manager_for_actor)
        @actor.save!
      end
    end  
    find_actors_manager
  end

  def get_new_manager_for_actor
    Manager.first.id
  end
  
  def actor_params
    params.require(:actor).permit(:id, :location, :birth_date, :height, :full_name, :phone, :action, {photos: []}, {videos: []})
  end

  def actor_params_without_videos_photos                                                                
    params.require(:actor).permit(:id)   
  end
end
