class Api::RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :update, :destroy]

  # GET /rentals
  def index
    @rentals = Rental.all

    render jsonapi: @rentals
  end

  # GET /rentals/1
  def show
    render jsonapi: @rental
  end

  # POST /rentals
  def create
    @rental = Rental.new(rental_params)

    if @rental.save
      render jsonapi: @rental, status: :created, location: @rental
    else
      render jsonapi: @rental.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rentals/1
  def update
    if @rental.update(rental_params)
      render jsonapi: @rental
    else
      render jsonapi: @rental.errors
    end
  end

  # DELETE /rentals/1
  def destroy
    @rental.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_rental
    @rental = Rental.find_by url_slug: params[:id]
  end

  # Only allow a list of trusted parameters through.
  def rental_params
    params.require(:rental).permit(
      :title, :owner, :city, :lat, :lng, :category,
      :bedrooms, :image, :description, :url_slug
    )
  end
end
