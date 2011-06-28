module Invoicer
  class FreshbooksInvoice
    def self.from_freshbooks(freshbooks_invoice)
      total = freshbooks_invoice["total_amount"].to_f
      date = Date.strptime(freshbooks_invoice["date"], "%Y-%m-%d 00:00:00")
      Invoice.new(
        :id => freshbooks_invoice["invoice_id"],
        :number => freshbooks_invoice["number"],
        :total_amount => total,
        :due_amount => total - freshbooks_invoice["paid"].to_f,
        :issued_on => Date.strptime(freshbooks_invoice["date"], "%Y-%m-%d 00:00:00"),
        :currency => freshbooks_invoice["currency_code"],
        :service => :freshbooks
      )
    end
  end
end
