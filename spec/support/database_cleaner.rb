# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    FactoryBot.rewind_sequences

    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
