if Rails.env.test?
  require 'factory_bot'

  module FactoryBot
    module Syntax
      module Methods
        def find_or_create(name, attributes = {}, &block)
          first = FactoryBot::Internal.factory_by_name(name).build_class.first
          first || FactoryBot.create(name, attributes, &block)
        end
      end
    end
  end
end
