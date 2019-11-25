class ResumesController < ApplicationController
  before_action :find_resume, only: [:show, :edit, :update, :destroy]
  before_action :check_for_cancel, :only => [:create, :update]
  def new
    @user = current_user
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)
    @resume.user_id = @user.id
    if @resume.save
      flash[:success] =  'You have successfully created a resume!'
      redirect_to account_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @resume.update(resume_params)
      redirect_to account_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @resume.destroy
    redirect_to account_path
  end
  
  def check_for_cancel
    puts params
    if params[:commit] == "Cancel"
      redirect_to account_path
    end
  end

  private
  def resume_params
    params.require(:resume).permit(:title, :description, :salary, :employment_type, :experience)
  end
  
  def find_resume
    @resume = Resume.find(params[:id])
  end
end
