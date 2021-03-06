require_relative 'spec_helper'

describe FarMar::Vendor do
  let(:all_vendors) { FarMar::Vendor.all }
  let(:vendor) { FarMar::Vendor.new(id: "14", name: "Stracke Group", num_employees: "2", market_id: "4") }

  it "exists" do
    FarMar::Vendor.wont_be_nil
  end

  describe "Vendor#self.all" do
    it "creates an array of Vendor objects" do
      all_vendors.must_be_instance_of Array
      all_vendors.last.must_be_instance_of FarMar::Vendor
    end

    it "has objects with the correct data" do
      all_vendors[13].id.must_equal "14"
      all_vendors[13].name.must_equal "Stracke Group"
      all_vendors[13].num_employees.must_equal "2"
      all_vendors[13].market_id.must_equal "4"
    end

  end

  describe "Vendor#self.find(find_id)" do
    it "returns the Vendor object with matching id" do
      this_id = all_vendors[13].id

      FarMar::Vendor.find(14).must_be_instance_of FarMar::Vendor
      FarMar::Vendor.find(14).id.must_equal this_id
      FarMar::Vendor.find(14).name.must_equal "Stracke Group"
    end
  end

  describe "Vendor#self.by_market(find_market_id)" do
    let(:market_4) { FarMar::Vendor.by_market("4") }

    it "should return an array of vendors with matching market id" do
      # uncomment the following line to see array of vendors with market_id = 4
      # ap FarMar::Vendor.by_market("4")
      market_4.must_be_instance_of Array
      market_4.last.must_be_instance_of FarMar::Vendor
      market_4[3].name.must_equal "Homenick-Kuhn"
    end
  end

  describe "Vendor#self.most_revenue" do
    it "finds the n number of highest revenue vendors in all markets" do
      skip
      # uncomment the following line to see the most_revenue(4) array, get trolled
      # ap FarMar::Vendor.most_revenue(4)
      FarMar::Vendor.most_revenue(4).length.must_equal 4
    end
  end

  describe "Vendor#market" do
    it "finds the Market that the Vendor is goes to" do
      all_vendors[13].market.must_be_instance_of FarMar::Market
    end
  end

  describe "Vendor#products" do
    it "should return all instances of Product that match the Vendor's id" do
      # uncomment the following line to see the vendor.products array
      # ap vendor.products
      vendor.products.must_be_instance_of Array
      vendor.products.length.must_equal 2
      vendor.products.last.vendor_id.must_equal "14"
    end
  end

  describe "Vendor#sales" do
    it "returns all instances of Sale that match the Vendor's id" do
      # uncomment the following line to see the vendor.sales array
      # ap vendor.sales
      vendor.sales.must_be_instance_of Array
      vendor.sales.length.must_equal 3
      vendor.sales.last.vendor_id.must_equal "14"
    end
  end

  describe "Vendor#revenue" do
    it "should sum the sale amounts of a Vendor" do
      vendor.revenue.must_equal 5311
    end
  end

end
