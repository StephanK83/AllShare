class ItemMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.item_mailer.confirmation.subject
  #
  def confirmation(user)
    @user = user

    mail to: user.email, subject: "New item created to AllShare"
  end

  def booking(user, booking)
    @user = user
    @booking = booking

    mail to: user.email, subject: "Booking request"
  end
end
