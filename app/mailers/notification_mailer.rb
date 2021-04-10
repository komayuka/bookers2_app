class NotificationMailer < ApplicationMailer
  default from: "no-replay@gmail.com"

  def send_confilm_to_user
    @user = params[:user]
    mail(to: @user.email, subject: "会員登録が完了しました。")
  end
end
