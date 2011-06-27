require "services/harvest/invoice_manager"

module Invoicer
  class Harvest
    attr_reader :harvester
    attr_reader :invoices

    def initialize(*args)
      @harvester = ::Harvester::Client.new(*args)
      @invoices = Invoicer::HarvestInvoiceManager.new(self)
    end
  end
end
