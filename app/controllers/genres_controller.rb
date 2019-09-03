class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end
  def show
    @genre = Genre.find(params[:id])
    @gbooks = @genre.books.paginate(:page => params[:page], :per_page => 2)
  end
end
