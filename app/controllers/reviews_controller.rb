class ReviewsController < ApplicationController
  before_action :set_book, only: [:create, :update, :edit, :destroy]
  before_action :set_review, only: [:edit, :update, :destroy, :helpful, :unhelpful]
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.find(params[:id])
  end

  def helpful
    @review.helpful = true
    @review.save
    redirect_to request.referrer
  end

  def unhelpful
    @review.unhelpful = true
    @review.save
    redirect_to request.referrer
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.book_id = @book.id

    respond_to do |format|
      if  @review.save!
        Notification.create(recipient: @book.user, actor: current_user, action: "reviewed", notifiable: @review )
        format.html { redirect_to @book, notice: 'Thanks for the review!' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:comment, :rating, :user_id, :book_id)
    end
end
