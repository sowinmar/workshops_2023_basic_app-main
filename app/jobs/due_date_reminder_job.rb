class DueDateReminderJob
  include Sidekiq::Job

  # def perform (book_loan_id)
  #   book_loan = BookLoan.find(book_loan_id)
  #   UserMailer.due_date_reminder_email(book_loan).deliver_now
  # end
  
  def perform
    BookLoan.where(status: 'checked_out', due_date: Date.tomorrow).each do |book_loan|
      UserMailer.due_date_reminder_email(book_loan).deliver_later
    end
  end

end