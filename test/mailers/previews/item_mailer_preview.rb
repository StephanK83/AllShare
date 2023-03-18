# Preview all emails at http://localhost:3000/rails/mailers/item_mailer
class ItemMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/item_mailer/confirmation
  def confirmation
    ItemMailer.confirmation
  end

end
