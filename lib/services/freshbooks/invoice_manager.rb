require "services/freshbooks/invoice"

module Invoicer
  class FreshbooksInvoiceManager
    attr_reader :service

    def initialize(service)
      @service = service
    end

    def all
      service.freshbooks.invoice.list["invoices"]["invoice"].map do |i|
        Invoicer::FreshbooksInvoice.from_freshbooks(i)
      end
    end

    def get(id)
      hash = service.freshbooks.invoice.get(:invoice_id => id)["invoice"]
      Invoicer::FreshbooksInvoice.from_freshbooks(hash)
    end
  end
end
