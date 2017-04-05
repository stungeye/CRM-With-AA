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
    redirect_back(fallback_location: root_path)
  end

  private

  def initialize_session
    session[:visit_count] ||= 0
    session[:to_call_list] ||= []
  end

  def customers_to_call
    Customer.find(session[:to_call_list])
  end
  helper_method :customers_to_call

  def visit_count
    session[:visit_count]
  end
  helper_method :visit_count
end
