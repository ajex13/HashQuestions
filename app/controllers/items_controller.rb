class ItemsController < ApplicationController
before_action :set_item, :only => [:show,:edit,:update,:destroy]

  def index
    @items = Item.all.order("created_at DESC")
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    respond_to do |response|
      if @item.save
        response.html {redirect_to @item}
        response.js
      else
        response.html {render 'new'}
        response.js
      end
    end

  end

  def edit
  end

  def update
    respond_to do |response|
      if @item.update(item_params)
        response.html {redirect_to @item}
      else
        response.html {render 'edit'}
      end
    end
  end

  def destroy
    @item.destroy_all
    respond_to do |response|
        response.html {redirect_to items_path}
    end
  end


  def show
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:question,:answer)
  end

end
