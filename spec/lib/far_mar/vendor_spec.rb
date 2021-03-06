require 'spec_helper'

describe FarMar::Vendor do

  describe "class methods" do
    it "responds to 'all'" do
      expect(FarMar::Vendor).to respond_to :all
    end

    it "'all' should return" do
      expect(FarMar::Vendor.all.count).to eq 2690
    end

    it "responds to 'find'" do
      expect(FarMar::Vendor).to respond_to :find
    end

    it "responds to 'by_market'" do
      expect(FarMar::Vendor).to respond_to :by_market
    end

    it "responds to 'find_by_name'" do
      expect(FarMar::Vendor).to respond_to :find_by_name
    end

    it "responds to 'find the vendor that matches a specific name'" do
      expect(FarMar::Vendor.find_by_name("Stamm Inc").name).to eq "Stamm Inc"
    end

    it "responds to 'find_all_by_name'" do
      expect(FarMar::Vendor).to respond_to :find_all_by_name
    end

    it "finds all the Vendors that match given name" do
      expect(FarMar::Vendor.find_all_by_name("windler").count).to eq 11
    end

    it "find the first vendor by market 1" do
      expect(FarMar::Vendor.by_market(100).first.name).to eq "Schiller-Ledner"
    end

    it "responds to 'most_revenue'" do
      expect(FarMar::Vendor).to respond_to :most_revenue
    end

    it "returns the vendor with the most_revenue" do
      expect(FarMar::Vendor.most_revenue(5)[3].name).to eq "Yost, Greenholt and Casper"
    end

    it "responds to 'most_items'" do
      expect(FarMar::Vendor).to respond_to :most_items
    end

    it "returns the vendors with the most items" do
      expect(FarMar::Vendor.most_items(5)[3].name).to eq "Sipes Inc"
    end

    it "responds to 'revenue(date)'" do
      expect(FarMar::Vendor).to respond_to :revenue
    end

    it "returns the revenue for all the vendors for a specific date" do
      expect(FarMar::Vendor.revenue("November 10, 2013")).to eq 9119618
    end
  end

  describe "attributes" do
    let(:vendor) { FarMar::Vendor.find(10) }
    # 10,Kertzmann LLC,11,3

    it "has the id 10" do
      expect(vendor.id).to eq 10
    end
    it "has the name" do
      expect(vendor.name).to eq "Kertzmann LLC"
    end
    it "has the no of employees 11" do
      expect(vendor.no_of_employees).to eq 11
    end
    it "has the market_id 3" do
      expect(vendor.market_id).to eq 3
    end
  end

  describe "associations" do
    let(:vendor) { FarMar::Vendor.find(1) }

    it "responds to :market" do
      expect(vendor).to respond_to :market
    end

    it "market_id matches the markets id" do
      expect(vendor.market.id).to eq vendor.market_id
    end

    it "responds to :sales" do
      expect(vendor).to respond_to :sales
    end

    it "has 7 sales" do
      expect(vendor.sales.count).to eq 7
    end

    it "responds to products" do
      expect(vendor).to respond_to :products
    end

    it "has 1 products" do
      expect(vendor.products.count).to eq 1
    end

    it "returns a sum of all the vendor's sales in cents" do
      expect(vendor.revenue).to eq 38259
    end

    it "responds to revenue_by_date" do
      expect(vendor).to respond_to :revenue_by_date
    end

    it "returns revenue for a specific date" do
      expect(vendor.revenue_by_date("November 10, 2013")).to eq 6702
    end
  end

end
