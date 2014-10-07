require 'spec_helper'

module ChinaPcd
  RSpec.describe DataController, :type => :controller do

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
      }.map { |k, v| [v, k] }
    end

    describe "GET index" do
      it "return http success" do
        get 'index', use_route: :china_pcd
        expect(response).to be_success
      end
    end

    describe "GET show" do
      it "return http success" do
        get 'show', id: '110000', use_route: :china_pcd
        expect(response).to be_success
        expect(response.headers['Content-Type']).to match 'application/json'
      end
      it "return province list" do
        get 'show', id: '000000', use_route: :china_pcd
        expect(assigns[:province]).to eq @provinces
        expect(response.body).to have_content @provinces.to_json
      end
      it "return city list" do
        get 'show', id: '110000', use_route: :china_pcd
        expect(assigns[:province]).to match_array([['市辖区', 110100], ['县', 110200]])
        expect(response.body).to have_content "110100"
      end
    end

  end
end
