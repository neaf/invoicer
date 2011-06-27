module Invoicer
  class HarvestInvoice
    def self.from_harvest(harvest_invoice)
      Invoice.new(
        :id => harvest_invoice.id,
        :number => harvest_invoice.number,
        :total_amount => harvest_invoice.total_amount,
        :due_amount => harvest_invoice.due_amount,
        :issued_on => harvest_invoice.issued_on,
        :due_on => harvest_invoice.due_on,
        :currency => harvest_invoice.currency,
        :service => :harvest
      )
    end
  end
end
