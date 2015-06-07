class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:update, :destroy]
  respond_to :json
  #TODO bonus authorization

  # GET /favorites.json
  def index
    @favorites = current_user.favorites
    respond_with(@favorites)
  end

  # POST /favorites.json
  def create
    @favorite = current_user.favorites.build(favorite_params)

    if @favorite.save
      respond_with(@favorite, status: :created, location: @favorite)
    else
      respond_with(@favorite.errors, status: :unprocessable_entity)
    end
  end

  # PATCH/PUT /favorites/1.json
  def update
    if @favorite.update(favorite_params)
      respond_with(@favorite, status: :ok, location: @favorite)
    else
      respond_with(@favorite.errors, status: :unprocessable_entity)
    end
  end

  # DELETE /favorites/1.json
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_params
      params.require(:favorite).permit(:title, :imdb_id)
    end
end
