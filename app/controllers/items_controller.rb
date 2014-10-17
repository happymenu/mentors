# -*- encoding : utf-8 -*-
class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :admin_show]

  def index
    @items = Item
    @items = @items.where('landing_picture_id = ?', params[:landing_picture_id]) if params[:landing_picture_id]

    render layout: false
  end

  def admin_index
    @items = Item.all
  end

  def show
    render layout: false
  end

  def admin_show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to :back, notice: '操作成功'
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
