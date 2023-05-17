class UserMailer < ApplicationMailer

  def loan_created_email (book_loan)
    @title = book_loan.book.title
    @due_date = book_loan.due_date

    mail(to: book_loan.user.email, subject: 'Loan created successfully')

  end
  
  def due_date_reminder_email (book_loan)
    @title = book_loan.book.title
    @due_date = book_loan.due_date

    mail(to: book_loan.user.email, subject: 'Loan due date reminder')
  end

end
  