class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'


  def destroyed_email(user)
    @user = user
    @url = "http://localhost:3000/admin/users/:id"
    mail(to: @user.email, subject: "You've been deleted from rotten mangoes!")
  end

end
