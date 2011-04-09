require 'mime/types'

class UploadsController < ApplicationController

  before_filter :load_hospital
  
  def index
    #@uploads = Upload.all
    redirect_to :root
  end

  def show
    @upload = Upload.find(params[:id])
    redirect_to "/hospitals/show"
  end

  def new
    @upload = Upload.new
  end

  def create
    newparams = coerce(params)  	
    @upload = @hospital.uploads.new(newparams[:upload])
      	
    if @upload.save
      respond_to do |format|
		format.html { redirect_to :controller => 'hospitals', :action => 'show', :notice => "Successfully created upload." }
		format.json { render :json => {:result => 'success', :upload => hospital_uploads_path(@upload)}}
	  end
    else
      render :action => 'new'
    end
  end

  def edit
    @upload = Upload.find(params[:id])
  end

  def update
    @upload = Upload.find(params[:id])
    if @upload.update_attributes(params[:upload])
      redirect_to @upload, :notice  => "Successfully updated upload."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @upload = @hospital.uploads.find(params[:id])
    @upload.destroy
    redirect_to hospital_uploads_path , :notice => "Successfully destroyed upload."
  end

  private
  def load_hospital
	@hospital = Hospital.find(params[:hospital_id])
  end
  
  def coerce(params)
	if params[:upload].nil?
		h = Hash.new
		h[:upload] = Hash.new
		h[:upload][:hospital_id] = params[:hospital_id]
		h[:upload][:doc] = params[:Filedata]
		h[:upload][:doc].content_type = MIME::Types.type_for(h[:upload][:doc].original_filename).to_s
		h
	else
		params
	end
  end

end
