module Invoicer
  class BlinksaleInvoice
    def self.from_blinksale(blinksale_invoice)
      Invoice.new(
        :id => blinksale_invoice.id,
        :number => blinksale_invoice.number,
        :total_amount => blinksale_invoice.total_amount,
        :due_amount => blinksale_invoice.due_amount,
        :issued_on => blinksale_invoice.issued_on,
        :due_on => blinksale_invoice.due_on,
        :currency => blinksale_invoice.currency,
        :service => :blinksale
      )
    end
  end
end
