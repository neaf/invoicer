require "freshbooks"
require "services/freshbooks/invoice_manager"

module Invoicer
  class Freshbooks
    attr_reader :freshbooks
    attr_reader :invoices

    def initialize(subdomain, api_key)
      @freshbooks = ::FreshBooks::Client.new("#{ subdomain }.freshbooks.com", api_key)
      @invoices = Invoicer::FreshbooksInvoiceManager.new(self)
    end
  end
end
