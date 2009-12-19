class AlbumPhotosController < ApplicationController
  layout 'layouts/manage'
  before_filter :manage_login_required
  # GET /album_photos
  # GET /album_photos.xml
  def index
    @album_photos = AlbumPhoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @album_photos }
    end
  end

  # GET /album_photos/1
  # GET /album_photos/1.xml
  def show
    @album_photo = AlbumPhoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @album_photo }
    end
  end

  # GET /album_photos/new
  # GET /album_photos/new.xml
  def new
    @album_photo = AlbumPhoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @album_photo }
    end
  end

  # GET /album_photos/1/edit
  def edit
    @album_photo = AlbumPhoto.find(params[:id])
  end

  # POST /album_photos
  # POST /album_photos.xml
  def create
    @album_photo = AlbumPhoto.new(params[:album_photo])

    respond_to do |format|
      if @album_photo.save
        flash[:notice] = 'AlbumPhoto was successfully created.'
        format.html { redirect_to(@album_photo) }
        format.xml  { render :xml => @album_photo, :status => :created, :location => @album_photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @album_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /album_photos/1
  # PUT /album_photos/1.xml
  def update
    @album_photo = AlbumPhoto.find(params[:id])

    respond_to do |format|
      if @album_photo.update_attributes(params[:album_photo])
        flash[:notice] = 'AlbumPhoto was successfully updated.'
        format.html { redirect_to(@album_photo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album_photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /album_photos/1
  # DELETE /album_photos/1.xml
  def destroy
    @album_photo = AlbumPhoto.find(params[:id])
    @album_photo.destroy

    respond_to do |format|
      format.html { redirect_to(album_photos_url) }
      format.xml  { head :ok }
    end
  end
end
