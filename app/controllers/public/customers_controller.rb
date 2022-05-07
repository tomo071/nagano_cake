class Public::CustomersController < ApplicationController
  def show
    @customer=Customer.find(current_customer.id)
  end

  def edit
    @customer=Customer.find(current_customer.id)
  end

  def update
    @customer=Customer.find(current_customer.id)
    @customer.update(customers_params)
    redirect_to public_customers_my_page_path(current_customer)
  end

  def unsubscribe
    @customer=Customer.find(current_customer.id)
  end

  def withdraw
    @customer=current_customer
    @customer.update(customers_params)
    reset_session
    redirect_to root_path
  end

  private

  def customers_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,
    :postal_code,:address,:telephone_number,:is_deleted,:email)
  end
end
