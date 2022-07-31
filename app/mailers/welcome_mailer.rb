class WelcomeMailer < ApplicationMailer
  def notify
    @user = params[:user]
    mail(to: <EMAIL_USERNAME>, subject: "Bienvenido(a)")
  end
end
