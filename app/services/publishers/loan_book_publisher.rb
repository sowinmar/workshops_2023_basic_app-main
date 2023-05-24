module Publishers
  class LoanBookPublisher
    def initialize (message:)
      @message = message
    end

    def publish
      ::Publishers::Application.new(
        routing_key: 'basic_app.book_loans',
        exchange_name: 'basic_app',
        message: message
      ).publish
    end

  private

  attr_reader :message

  end

end