class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :public?, except: %i[private_page]
 #create body of the method -> show
  def show 
    @profile = Profile.find(params[:id])
      respond_to do | format |
        format.html
      end

  end

  def new
    @profile = Profile.new
  end

  def create 
    @profile = Profile.create(profile_params)
    @profile.user = current_user
    current_user.profile_id = @profile.id
    if @profile.save
      flash[:notice] = 'Profile Created!'
      redirect_to @profile
    else
      render :new
    end
  end

  def edit 
  end
#fix update profile
  def update
    if @profile.update(profile_params)
      flash[:notice] = 'Profile Updated!'
      redirect_to @profile
    else
      render :edit
    end 
  end
#fix change provacy. was not receiving the ID.
  def change_privacy
    @profile = Profile.find(params[:id])
    @profile.update(privacy_params)
    redirect_to @profile
  end

  def private_page 
  end

  private 
#define params of Profile
  def profile_params
    params.require(:profile).permit(:nickname, :bio, :share)
  end 

  def privacy_params
    params.require(:profile).permit(:share)
  end

  def find_profile
    @profile = Profile.find(params[:id])
  end
#alther 
  def public?
    if (current_user.profile == @profile)
      if @profile.share
        redirect_to private_page_profile_path(@profile)
      end
    end
  end

end
  
