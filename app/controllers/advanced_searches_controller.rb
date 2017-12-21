class AdvancedSearchesController < ApplicationController
  before_action :set_advanced_search, only: [:show, :edit, :update, :destroy]

  def results

  end


  # GET /advanced_searches/new
  def new

    # @advanced_search = AdvancedSearch.new
  end


  # POST /advanced_searches
  def create

    @advanced_search = AdvancedSearch.new(advanced_search_params)
    render 'results'

  end


  private


  # Never trust parameters from the scary internet, only allow the white list through.
  def advanced_search_params
    params.require(:advanced_search).permit(:first_name, :last_name, :email,
                                            :hometown, :caption)

  end
end
