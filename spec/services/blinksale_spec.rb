require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Invoicer::Blinksale do
  let(:service) { Invoicer::Blinksale.new('test', 'test', 'test') }

  describe "#invoices" do
    it "returns invoice manager instance" do
      service.invoices.should be_an_instance_of(Invoicer::BlinksaleInvoiceManager)
    end
  end
end

describe Invoicer::BlinksaleInvoiceManager do
  let(:manager) { Invoicer::Blinksale.new('test', 'test', 'test').invoices }

  describe "#all" do
    before(:each) do
      invoices = [
        mock('invoice',
          :id => 1,
          :number => "00001",
          :total_amount => 20,
          :due_amount => 10,
          :issued_on => Date.today,
          :due_on => Date.today + 30,
          :currency => "USD"
        ),
        mock('invoice',
          :id => 2,
          :number => "00002",
          :total_amount => 20,
          :due_amount => 10,
          :issued_on => Date.today,
          :due_on => Date.today + 30,
          :currency => "USD"
        ),
        mock('invoice',
          :id => 3,
          :number => "00003",
          :total_amount => 20,
          :due_amount => 10,
          :issued_on => Date.today,
          :due_on => Date.today + 30,
          :currency => "USD"
        )
      ]

      manager.service.blinksale.stub!(:all).and_return(invoices)
    end

    it "passes params to Blinksale client" do
      params = { :status => "draft" }
      manager.service.blinksale.should_receive(:all).with(params).once
      manager.all(params)
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
        invoice.number.should eql("00001")
        invoice.currency.should eql("USD")
        invoice.service.should eql(:blinksale)
      end
    end
  end

  describe "#get" do
    before(:each) do
      invoice = mock('invoice',
        :id => 1,
        :number => "00001",
        :total_amount => 20,
        :due_amount => 10,
        :issued_on => Date.today,
        :due_on => Date.today + 30,
        :currency => "USD"
      )

      manager.service.blinksale.stub!(:get).and_return(invoice)
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
        invoice.number.should eql("00001")
        invoice.currency.should eql("USD")
        invoice.service.should eql(:blinksale)
      end
    end
  end
end
