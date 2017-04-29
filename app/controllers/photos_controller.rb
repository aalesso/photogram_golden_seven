class PhotosController < ApplicationController

  def new_form
    render("photos/new_form.html.erb")
  end

  def create_row
    url = params[:the_source]
    cap = params[:the_caption]
    new_photo = Photo.new
    new_photo.source = url
    new_photo.caption = cap
    new_photo.save
    # render("photos/create_row.html.erb") WE DONT USE RENDER, BECAUSE WE DONT WANT TO RENDER A NEW HTML, BUT RE DIRECT TO ANOTHER ACTION
    # redirect_to("/photos/#{new_photo.id}")
    redirect_to("/photos")
  end

  def index
    @list_of_all_my_photos=Photo.all
    render("photos/index.html.erb")
  end



  def show
    the_id=params[:id]
    @my_photo=Photo.find(the_id)
    render("photos/show.html.erb")

  end

  def edit_form
    # @the_id=params[:id]
    the_id=params[:id]
    @id_to_edit = the_id
    @my_photo=Photo.find(the_id)
    new_caption=params[:the_caption2]
    new_source=params[:the_source2]


    render("photos/edit_form.html.erb")
  end

  def update_row
    the_id=params[:id]
    url2 = params[:the_source2]
    cap2 = params[:the_caption2]
    edited_photo = Photo.find(the_id)
    edited_photo.source = url2
    edited_photo.caption = cap2
    edited_photo.save
    # render("photos/create_row.html.erb") WE DONT USE RENDER, BECAUSE WE DONT WANT TO RENDER A NEW HTML, BUT RE DIRECT TO ANOTHER ACTION
    redirect_to("/photos/#{edited_photo.id}")

  end

  def destroy_row
    the_id=params[:id]
    Photo.find(the_id).destroy
    redirect_to("/photos")
  end


end
