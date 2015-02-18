class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
  def new
    @post = Post.where(id: params[:post_id]).first
    @photo = @post.photos.new
  end
  def create
    # Find our user that we should attach to
    #@photo = current_user.photos.new(photo_params)
    #or the standard create:
    def create
        post = Post.where(id: params[:post_id]).first
        photo = post.photos.create(params.require(:photo).permit(:caption, :image))
        if photo.save
            redirect_to posts_path
        else
          render 'new'
        end
  end

  def show

  end

  def photo_params
    params.require(:photo).permit(:image, :photo_date)
  end
end


