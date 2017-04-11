class ItemsController < ApplicationController
before_action :authenticate_user!, except: [:index,:show]
before_action :set_item, :only => [:show,:edit,:update,:destroy]

  def index
    @items = Item.paginate(:page => params[:page], :per_page => 10).order("created_at DESC")
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
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
        response.js
      else
        response.html {render 'edit'}
        response.js
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |response|
        response.html {redirect_to items_path}
        response.js
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
