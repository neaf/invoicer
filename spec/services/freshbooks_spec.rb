require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Invoicer::Freshbooks do
  let(:service) { Invoicer::Freshbooks.new('test-subdomain', 'test-apikey') }

  describe "#invoices" do
    it "returns invoice manager instance" do
      service.invoices.should be_an_instance_of(Invoicer::FreshbooksInvoiceManager)
    end
  end
end

describe Invoicer::FreshbooksInvoiceManager do
  let(:manager) { Invoicer::Freshbooks.new('test', 'test').invoices }

  describe "#all" do
    before(:each) do
      invoices = { "invoices"=>
        { "invoice"=>
          [
            {
              "invoice_id"=>"0000000001",
              "number"=>"0000001",
              "amount"=>"24.00",
              "paid"=>"0.00",
              "date"=>"2011-06-27 00:00:00",
              "terms"=>"15 days",
              "currency_code"=>"USD",
            },
            {
              "invoice_id"=>"0000000002",
              "number"=>"0000002",
              "amount"=>"24.00",
              "paid"=>"0.00",
              "date"=>"2011-06-27 00:00:00",
              "terms"=>"15 days",
              "currency_code"=>"USD"
            }
          ]
        }
      }

      FreshBooks::Client::NamespaceProxy.any_instance.stubs(:list).returns(invoices)
    end

    it "returns collection of invoices" do
      manager.all.should_not be_empty
    end

    describe "invoice" do
      let(:invoice) { manager.all.first }

      it "is an Invoicer::Invoice instance" do
        invoice.should be_an_instance_of(Invoicer::Invoice)
      end

      it "has proper attributes set" do
        invoice.number.should eql("0000001")
        invoice.currency.should eql("USD")
        invoice.service.should eql(:freshbooks)
      end
    end
  end

  describe "#get" do
    before(:each) do
      invoice = {"invoice"=>
        {"invoice_id"=>"00000000001",
         "number"=>"0000001",
         "client_id"=>"3",
         "recurring_id"=>nil,
         "organization"=>"Test Client",
         "first_name"=>nil,
         "last_name"=>nil,
         "p_street1"=>nil,
         "p_street2"=>nil,
         "p_city"=>nil,
         "p_state"=>nil,
         "p_country"=>nil,
         "p_code"=>nil,
         "po_number"=>nil,
         "status"=>"draft",
         "amount"=>"24.00",
         "amount_outstanding"=>"24",
         "paid"=>"0.00",
         "date"=>"2011-06-27 00:00:00",
         "notes"=>nil,
         "terms"=>"15 days",
         "discount"=>"0",
         "url"=>"https://xteamtest.freshbooks.com/view/3M3n7nNhEC44NTKD",
         "auth_url"=>"https://xteamtest.freshbooks.com/invoices/7095",
         "links"=>
          {"client_view"=>"https://xteamtest.freshbooks.com/view/3M3n7nNhEC44NTKD",
           "view"=>"https://xteamtest.freshbooks.com/invoices/7095",
           "edit"=>"https://xteamtest.freshbooks.com/invoices/7095/edit"},
         "return_uri"=>nil,
         "updated"=>"2011-06-27 10:27:02",
         "currency_code"=>"USD",
         "language"=>"en",
         "vat_name"=>nil,
         "vat_number"=>nil,
         "folder"=>"active",
         "staff_id"=>"1",
         "lines"=>
          {"line"=> []}}}

      FreshBooks::Client::NamespaceProxy.any_instance.stubs(:get).returns(invoice)
    end

    let(:invoice) { manager.get(1) }

    it "returns invoice instance" do
      invoice.should be_an_instance_of(Invoicer::Invoice)
    end

    describe "invoice" do
      it "is an Invoicer::Invoice instance" do
        invoice.should be_an_instance_of(Invoicer::Invoice)
      end

      it "has proper attributes set" do
        invoice.number.should eql("0000001")
        invoice.currency.should eql("USD")
        invoice.service.should eql(:freshbooks)
      end
    end
  end
end
