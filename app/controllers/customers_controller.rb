class CustomersController < ApplicationController
  before_action :initialize_session
  before_action :increment_visit_count

  def index
    @customers = Customer.all
  end
  # Automatically load the app/views/customers/index.html.erb

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

  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end
end
