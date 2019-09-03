class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index

    @books = Book.paginate(:page => params[:page], :per_page => 2)

  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])
    @avg_rating = if @book.reviews.blank?
    0
    else
      @book.reviews.average(:rating).round(2)
    end
  end

  def book_author
    @author = @book.user
  end

  # GET /books/new
  def new
    @book = current_user.books.build
    @genres = Genre.all
  end

  # GET /books/1/edit
  def edit
    @genres = Genre.all 
  end

  # POST /books
  # POST /books.json
  def create
    @book = current_user.books.build(book_params)

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

  def claim
    book = Book.find(params[:id])
    book.claims << current_user unless book.claims.include?(current_user)
    redirect_to book, notice: 'Added to reading list'
  end

  def unclaim
    book = Book.find(params[:id])
    if book.claims.include?(current_user)
      book.claims.delete(current_user)
      redirect_to book, notice: 'Done reading'
    end
  end
  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to current_user_path, notice: 'Book was successfully updated.' }
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
    @book.destroy
    respond_to do |format|
      format.html { redirect_to current_user_path, notice: 'Book was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    def book_params
      params[:book][:genre_ids] = (params[:book][:genre_ids] || {}).values.map(&:to_i)
      params.require(:book).permit(:avatar, :title, :user_id, :description, genre_ids: [])
    end
end
