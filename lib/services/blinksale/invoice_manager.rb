require "blinksale"
require "services/blinksale/invoice"

module Invoicer
  class BlinksaleInvoiceManager
    attr_reader :service

    def initialize(service)
      @service = service
    end

    def all(params = {})
      service.blinksale.all(params).map do |i|
        Invoicer::BlinksaleInvoice.from_blinksale(i)
      end
    end

    def get(id)
      Invoicer::BlinksaleInvoice.from_blinksale(service.blinksale.get(id))
    end
  end
end
