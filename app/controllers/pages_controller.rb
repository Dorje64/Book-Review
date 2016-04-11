class PagesController < ApplicationController
  def home
    @book=Book.all

    #@top_book=Book.where("popularity_count").order(:likes_count).reverse_order
  end

  def categories
    @cat=params[:cat]
    @book = Book.where('category' =>@cat )
  end

  def contact_us
  end
end
