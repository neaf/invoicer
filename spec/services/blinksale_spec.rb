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
    it "returns collection of all invoices"
  end

  describe "#get" do
    it "returns invoice with given id"
  end
end
