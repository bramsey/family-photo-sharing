class AvatarsController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:new]
  
  respond_to :html, :js
  
  # GET /avatars
  # GET /avatars.json
  def index
    @avatar = current_user.avatar
    
    if @avatar
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @avatar.to_jq_upload.to_json }
      end
    else
      redirect_to new_avatar_path
    end
  end

  # GET /avatars/1
  # GET /avatars/1.json
  def show
    @avatar = Avatar.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @avatar }
    end
  end

  # GET /avatars/new
  # GET /avatars/new.json
  def new
    @avatar = Avatar.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @avatar }
    end
  end

  # GET /avatars/1/edit
  def edit
    @avatar = Avatar.find(params[:id])
  end

  # POST /avatars
  # POST /avatars.json
  def create
    @avatar = Avatar.new(params[:avatar])

    respond_to do |format|
      if @avatar.save
       format.json { render :json => [ @avatar.to_jq_upload ].to_json }
      else
        format.json { render :json => [ @avatar.to_jq_upload.merge({ :error => "custom_failure" }) ].to_json }
      end
    end
  end

  # PUT /avatars/1
  # PUT /avatars/1.json
  def update
    @avatar = Avatar.find(params[:id])

    respond_to do |format|
      if @avatar.update_attributes(params[:avatar])
        flash[:notice] = 'Avatar was successfully updated.'
        format.html { redirect_to avatars_path, notice: 'Avatar was successfully updated.' }
        format.json { head :ok }
      else
        format.html { redirect_to avatars_path, notice: 'Error updating avatar.' }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avatars/1
  # DELETE /avatars/1.json
  def destroy
    @avatar = current_user.avatar
    @avatar.destroy

    respond_to do |format|
      format.html { redirect_to avatars_url }
      format.json { render :json => true }
    end
  end
end
