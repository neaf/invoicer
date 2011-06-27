require "services/blinksale/invoice_manager"

module Invoicer
  class Blinksale
    attr_reader :service
    attr_reader :invoices

    def initialize(*args)
      @service = ::Blinksale::Client.new(*args)
      @invoices = Invoicer::BlinksaleInvoiceManager.new(self)
    end
  end
end
