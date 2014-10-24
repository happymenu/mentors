# -*- encoding : utf-8 -*-
class LandingPicturesController < ApplicationController
  before_action :set_landing_picture, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  caches_page :index

  def index
    @landing_pictures = LandingPicture.first(4)
    render layout: false
  end

  def admin_index
    @landing_pictures = LandingPicture.all
  end

  def show
  end

  def new
    @landing_picture = LandingPicture.new
  end

  def edit
  end

  def create
    @landing_picture = LandingPicture.new(landing_picture_params)
    @landing_picture.save
    expire_page action: 'index'
    redirect_to :back, notice: '操作成功'
  end

  def update
    @landing_picture.update(landing_picture_params)
    expire_page action: 'index'
    redirect_to :back, notice: '操作成功'
  end

  def destroy
    @landing_picture.destroy
    expire_page action: 'index'
    redirect_to :back, notice: '操作成功'
  end

  private
    def set_landing_picture
      @landing_picture = LandingPicture.find(params[:id])
    end

    def landing_picture_params
      params.require(:landing_picture).permit(:name, :logo, :landing_picture_type)
    end
end
