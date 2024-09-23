class ProductChannel < ApplicationCable::Chanel

  def subscribed
    stream_from "product_#{params[:room]}"
  end
end
