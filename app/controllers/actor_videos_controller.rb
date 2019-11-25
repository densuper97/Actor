class ActorVideosController < ApplicationController
  before_action :find_actor
  def destroy
    if @actor.id == destroy_params[:id].to_i
      remove_video_at_index(destroy_params[:index].to_i)
      if @actor.save
        render 'actors/index'
      else
        #add display errors
        render 'actors/index'
      end
    end
  end

  private
  def find_actor
    @actor = Actor.find_by(user_id: @user.id) unless @actor
  end

  def destroy_params
    params.permit(:id, :index)
  end

  def remove_video_at_index(index)
    remain_videos = @actor.videos
    if index == 0 && @actor.videos.size == 1
      @actor.remove_videos!
    else
      deleted_video = remain_videos.delete_at(index) 
      deleted_video.try(:remove!)
      @actor.videos = remain_videos
    end
  end
end
