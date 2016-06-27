class MoviesController < ApplicationController
  include MoviesHelper
  def index
    @movie = Movie.new
    @movies = Movie.all
    if params[:term].present?
      @movies = @movies.title_or_director_filter(params[:term])
    end
    if params[:duration].to_i > 0
      @movies = @movies.duration_filter(params[:duration])
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      respond_to do |format|
        format.html { redirect_to movies_path}
        # format.json {render json: @movie}
        format.json do
          @json_movie = @movie.as_json(methods: :average_review)
          @json_movie[:formatted_date] = formatted_date(@movie.release_date)
          @json_movie[:image_src] = @movie.poster_image_url_url(:thumb) 
        #   # 2) slap a bunch of extra data on there, like 
        #   #      @movie.average_review
        #   #      link_to image_tag(movie.poster_image_url_url(:thumb))
        #   #       etc
        #   # 3) send that json thing back to the client
          render json: @json_movie
        end
      end
    else
      render json: {message: "Not created successfully"}.to_json
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description, :remote_poster_image_url_url
    )
  end

end
