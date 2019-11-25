class ActorPhotosController < ApplicationController
  before_action :find_actor
  def destroy
    if @actor.id == destroy_params[:id].to_i
      remove_image_at_index(destroy_params[:index].to_i)
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

  def remove_image_at_index(index)
    remain_photos = @actor.photos
    if index == 0 && @actor.photos.size == 1
      @actor.remove_photos!
    else
      deleted_photo = remain_photos.delete_at(index) 
      deleted_photo.try(:remove!)
      @actor.photos = remain_photos
    end
  end
end
