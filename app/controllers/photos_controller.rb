class PhotosController < ApplicationController
  layout 'layouts/manage'
  before_filter :manage_login_required
	# GET /photos
  # GET /photos.xml
  def index
    @photos = Photo.paginate :page=>params[:page]||1,:per_page=>20,:order=>"created_at DESC"
    tag_cloud
    @albums = Album.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.xml
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.xml
  def new
    @photo = Photo.new
		@photo.table_name = params[:table]
		@photo.parent_id = params[:table_id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.xml
  def create
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        flash[:notice] = '图片添加成功.'
        if params[:album_id]
          AlbumPhoto.create(:album_id=>params[:album_id],:photo_id=>@photo.id)
        end
        format.html { redirect_to(params[:redirect_url] || photos_path) }
        format.xml  { render :xml => @photo, :status => :created, :location => @photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        flash[:notice] = 'Photo was successfully updated.'
        format.html { redirect_to(@photo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    @photo = Photo.find(params[:id])
    @album_photo = AlbumPhoto.find(:first,:conditions=>["photo_id = ?",@photo.id])
    @album_photo.destroy if @album_photo
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to(photos_url) }
      format.xml  { head :ok }
    end
  end

	 def tag_cloud
      @tags = Photo.tag_counts
    end
	def tag
		@photos=  Photo.find_tagged_with(params[:id])
	end
end
