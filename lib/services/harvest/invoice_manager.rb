require "harvester"
require "services/harvest/invoice"

module Invoicer
  class HarvestInvoiceManager
    attr_reader :service

    def initialize(service)
      @service = service
    end

    def all(params = {})
      service.harvester.all(params).map do |i|
        Invoicer::HarvestInvoice.from_harvest(i)
      end
    end

    def get(id)
      Invoicer::HarvestInvoice.from_harvest(service.harvester.get(id))
    end
  end
end
