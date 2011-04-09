class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all
    redirect_to 'show'
  end

  def show
  	id = current_user.hospital_id
  	@uploads = Upload.where(["hospital_id = ?", id]).order(:created_at)
    @hospital = Hospital.find(id, :include => :uploads)
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.new(params[:hospital])
    if @hospital.save
      redirect_to @hospital, :notice => "Successfully created hospital."
    else
      render :action => 'new'
    end
  end

  def edit
    @hospital = Hospital.find(params[:id])
  end

  def update
    @hospital = Hospital.find(params[:id])
    if @hospital.update_attributes(params[:hospital])
      redirect_to @hospital, :notice  => "Successfully updated hospital."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @hospital = Hospital.find(params[:id])
    @hospital.destroy
    redirect_to hospitals_url, :notice => "Successfully destroyed hospital."
  end
end
