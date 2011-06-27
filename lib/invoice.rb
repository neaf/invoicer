module Invoicer
  class Invoice
    attr_accessor :attributes

    def initialize(attributes = {})
      @attributes = attributes
    end

    [:id, :number, :total_amount, :due_amount, :issued_on, :due_on, :currency, :service].each do |attr|
      define_method(attr) do
        attributes[attr]
      end
    end
  end
end
