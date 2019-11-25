class CharactersController < ApplicationController
  before_action :find_manager
  before_action :find_character, only: [:edit, :update, :destroy]
  before_action :check_for_cancel, only: [:create, :update]
  def index
    @characters = Character.where(manager_id: @manager.id, open: true)
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.manager_id = @manager.id
    @character.open = true
    if @character.save!
      redirect_to characters_index_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @character.update(character_params)
      redirect_to characters_index_path
    else
      render :edit
    end
  end

  def destroy
    @character.destroy
    redirect_to characters_index_path
  end

  private
  def character_params
    puts params.inspect
    params.require(:character).permit(:id, :title, :description, :project_name, :deadline, :shooting_start, :shooting_end)
  end

  def find_manager
    @manager = @user.manager unless @manager
  end

  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to characters_index_path
    end
  end

  def find_character
    @character = Character.find(params[:id])
  end
end
