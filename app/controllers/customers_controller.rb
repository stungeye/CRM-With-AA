class CustomersController < ApplicationController
  before_action :initialize_session

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def remember_to_call
    id = params[:id].to_i
    session[:to_call_list] << id unless session[:to_call_list].include?(id)
    flash[:notice] = "Customer added to the to call list."
    redirect_back(fallback_location: root_path)
  end

  def mark_as_called
    id = params[:id].to_i
    session[:to_call_list].delete(id)
    flash[:notice] = "Marked customer as called."
    redirect_back(fallback_location: root_path)
  end

  private

  def initialize_session
    session[:to_call_list] ||= []
  end

  def customers_to_call
    Customer.find(session[:to_call_list])
  end
  helper_method :customers_to_call
end
