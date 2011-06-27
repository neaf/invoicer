require "services/blinksale/invoice_manager"

module Invoicer
  class Blinksale
    attr_reader :blinksale
    attr_reader :invoices

    def initialize(*args)
      @blinksale = ::Blinksale::Client.new(*args)
      @invoices = Invoicer::BlinksaleInvoiceManager.new(self)
    end
  end
end
