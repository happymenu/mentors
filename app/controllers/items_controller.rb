# -*- encoding : utf-8 -*-
class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :admin_show, :manage_comments, :manage_thumb_ups]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item
    @items = @items.where('landing_picture_id = ?', params[:landing_picture_id]) if params[:landing_picture_id]
    @items = @items.order('position')
    render layout: 'mobile'
  end

  def admin_index
    @items = Item
    @items = @items.where 'landing_picture_id = ?',(params[:landing_picture_id] || LandingPicture.first.try(:id))
    @items = @items.order('position').page(params[:page]).per(6)
  end

  def show
    render layout: 'mobile'
  end

  def admin_show
  end

  def manage_comments
  end

  def manage_thumb_ups
  end
  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to edit_item_path(@item), notice: '操作成功'
  end

  def update
    @item.update(item_params)
    redirect_to :back, notice: '操作成功'
  end

  def destroy
    @item.destroy
    redirect_to :back, notice: '操作成功'
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:logo, :title, :introduction, :landing_picture_id)
    end
end
