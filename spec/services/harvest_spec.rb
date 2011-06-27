require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Invoicer::Harvest do
  let(:service) { Invoicer::Harvest.new('test', 'test', 'test') }

  describe "#invoices" do
    it "returns invoice manager instance" do
      service.invoices.should be_an_instance_of(Invoicer::HarvestInvoiceManager)
    end
  end
end

describe Invoicer::HarvestInvoiceManager do
  let(:manager) { Invoicer::Harvest.new('test', 'test', 'test').invoices }

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

      manager.service.harvester.stub!(:all).and_return(invoices)
    end

    it "passes params to Harvesb client" do
      params = { :status => "draft" }
      manager.service.harvester.should_receive(:all).with(params).once
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
        invoice.service.should eql(:harvest)
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

      manager.service.harvester.stub!(:get).and_return(invoice)
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
        invoice.service.should eql(:harvest)
      end
    end
  end
end
