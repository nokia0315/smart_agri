class User::UsersController < ApplicationController
  def show
    @customer = current_customer
    # @customer = Customer.find(params[:id])
  end

  def quit
  end


  def out
    @customer = current_customer
    @customer.update(user_status: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def edit
    @customer = current_customer
    # @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_customer_path(@customer.id)
  end

  private

  def customer_params
    params.require(:user).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :postal_code, :residence, :phone_number, :email, :is_valid)
  end
end
