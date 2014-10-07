require 'spec_helper'

describe ChinaPcd do

  before do
    @provinces = {
      110000 => '北京市',
      120000 => '天津市',
      130000 => '河北省',
      140000 => '山西省',
      150000 => '内蒙古自治区',
      210000 => '辽宁省',
      220000 => '吉林省',
      230000 => '黑龙江省',
      310000 => '上海市',
      320000 => '江苏省',
      330000 => '浙江省',
      340000 => '安徽省',
      350000 => '福建省',
      360000 => '江西省',
      370000 => '山东省',
      410000 => '河南省',
      420000 => '湖北省',
      430000 => '湖南省',
      440000 => '广东省',
      450000 => '广西壮族自治区',
      460000 => '海南省',
      500000 => '重庆市',
      510000 => '四川省',
      520000 => '贵州省',
      530000 => '云南省',
      540000 => '西藏自治区',
      610000 => '陕西省',
      620000 => '甘肃省',
      630000 => '青海省',
      640000 => '宁夏回族自治区',
      650000 => '新疆维吾尔自治区',
      710000 => '台湾省',
      810000 => '香港特别行政区',
      820000 => '澳门特别行政区',
    }
  end

  describe "description" do
    
    it "should be provinces" do
      expect(ChinaPcd.provinces).to eq @provinces
    end

    it "should be cities" do
      expect(ChinaPcd.cities('110000')).to eq({110100 => '市辖区', 110200 => '县'})
    end

    it "should be districts" do
      expect(ChinaPcd.districts('110200')).to eq({110228 => '密云县', 110229 => '延庆县'})
    end

  end

  it "should be parse" do
    expect(ChinaPcd.province_id('440000')).to eq '440000' # 省
    expect(ChinaPcd.city_id('440000')).to eq '440000'
    expect(ChinaPcd.province_id('440300')).to eq '440000' # 市
    expect(ChinaPcd.city_id('440300')).to eq '440300'
    expect(ChinaPcd.province_id('440305')).to eq '440000' # 区
    expect(ChinaPcd.city_id('440305')).to eq '440300'
  end
  
  it "should be get" do
    expect(ChinaPcd.get('440000')).to eq '广东省'
    expect(ChinaPcd.get('440300')).to eq '深圳市'
    expect(ChinaPcd.get('440305')).to eq '南山区'
    expect(ChinaPcd.get('440000', true)).to eq '广东省'
    expect(ChinaPcd.get('440300', true)).to eq '广东省深圳市'
    expect(ChinaPcd.get('440305', true)).to eq '广东省深圳市南山区'
  end

  it "should be list" do
    expect(ChinaPcd.list('110000')[110200]).to eq({:name=>"县", :children=>{110228=>"密云县", 110229=>"延庆县"}})
    expect(ChinaPcd.list('000000')).to eq(@provinces)
  end

  it "test fetch" do
    expect(ChinaPcd.fetch('000000')).to match_array(@provinces.map { |k, v| [v, k] })
    expect(ChinaPcd.fetch('110000')).to match_array([['市辖区', 110100], ['县', 110200]])
    expect(ChinaPcd.fetch('110200')).to match_array([['密云县', 110228], ['延庆县', 110229]])
  end

end