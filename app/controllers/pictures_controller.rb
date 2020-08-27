class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    Picture.create(picture_params)
    redirect_to pictures_path
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "投稿を編集しました"
    else
      render :edit
    end
  end

  private

  def picture_params
    params.require(:picture).permit(:content)
  end
end
