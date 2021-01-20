class ContactController < ApplicationController
  def index
    @contact = Contact.new
    render :action => 'index'
  end

  def confirm
    @contact = Contact.new(params[:contact].permit(:name, :email, :message))
    if @contact.valid?
      # OK。確認画面を表示
      render :action => 'confirm'
    else
      # NG。入力画面を再表示
      render :action => 'index'
    end
  end

  def thanks
    @contact = Contact.new(params[:contact].permit(:name, :email, :message))    
    ContactMailer.received_email(@contact).deliver

    # 完了画面を表示
    render :action => 'thanks'
  end
end
