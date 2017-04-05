class CustomersController < ApplicationController
  before_action :increment_visit_count, except: [:remember_to_call]

  def index
    @customers = Customer.all
  end
  # Automatically load the app/views/customers/index.html.erb

  def show
    @customer = Customer.find(params[:id])
  end

  def remember_to_call
    id = params[:id].to_i
    session[:to_call_list] ||= []
    session[:to_call_list] << id unless session[:to_call_list].include?(id)
    redirect_back(fallback_location: root_path)
  end

  private

  def increment_visit_count
    session[:visit_count] = visit_count + 1
  end

  def visit_count
    session[:visit_count] || 0
  end
  helper_method :visit_count
end
