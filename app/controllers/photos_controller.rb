class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end
  def show
    @current_photo = Photo.find_by({ :id => params["id"]})

  end
  def new_form
  end
  def create_row
    i = Photo.new
    i.source = params["the_source"]
    i.caption = params["the_caption"]
    i.save
    redirect_to("http://localhost:3000/photos")
  end
  def destroy
    i = Photo.find(params["id"])
    i.destroy
     redirect_to("http://localhost:3000/photos")
  end
  def edit_form
    @id = params["id"]
    @current_photo = Photo.find_by(@id)
  end
  def update_photo
      i = Photo.find(params["id"])
    i.source = params["the_source"]
    i.caption = params["the_caption"]
    i.save
    redirect_to("http://localhost:3000/photos/"+@id.to_s)
  end
end
