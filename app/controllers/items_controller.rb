class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
  end

  def create
  end

  private
  def item_params
    # params.requite().permit()
  end
end
