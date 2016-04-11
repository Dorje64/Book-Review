class BooksController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = if params[:search]
               Book.where('name like ?', "%#{params[:search]}%")
             else
               Book.all
             end
    end

  # GET /books/1
  # GET /books/1.json
  def show
    @comment=Comment.new
    @like = Like.new

    if params[:text]
      speak_string(params[:text],1)
    end
  end

  # def cut_string(full_text)
  #   speak_string(full_text,1)
  # end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/editz
  def edit
  end

  # POST /books  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    if @book.comments.each do |comment|
      comment.destroy
    end
    end

      if @book.likes.each do |like|
        like.destroy
      end
      end

   if @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
      end
      else
     respond_to do |format|
       format.html { redirect_to books_url, notice: 'all the comments and likes are deleted, try again to delete the book' }
       format.json { head :no_content }
     end
     end
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :author, :description, :category,:user_id)
    end

  def speak_string( text, delay = 0 )
    #build a command
    cmd = ""
    cmd += "sleep #{delay} && " if delay
    cmd += "espeak  -a150 -s150 -g7 -ven-us+f3  \"#{text}\"" if text
    #if there is a command, run it in a new thread
    unless cmd.empty?
      Thread.new do
        IO.popen(cmd)
      end
    end
  end


