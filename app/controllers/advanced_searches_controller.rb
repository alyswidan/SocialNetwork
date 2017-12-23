class AdvancedSearchesController < ApplicationController

  def results
    params[:advanced_search] = session[:advanced_search]

    @advanced_search = AdvancedSearch.new(advanced_search_params)

  end


  # GET /advanced_searches/new
  def new

  end


  # POST /advanced_searches
  def create
    session.delete(:advanced_search)
    session[:advanced_search] = advanced_search_params
    redirect_to advanced_search_results_path
  end


  private


  # Never trust parameters from the scary internet, only allow the white list through.
  def advanced_search_params
    params.require(:advanced_search).permit(:first_name,:simple,
                                            :last_name, :email,
                                            :city, :caption)
  end
  def empty_form?
    advanced_search_params.all? {|k,v| v.empty? }
  end
end
