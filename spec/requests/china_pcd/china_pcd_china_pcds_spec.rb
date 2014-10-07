require 'spec_helper'

RSpec.describe "ChinaPcds", :type => :request do
  describe "GET /china_pcd" do
    it "works! (now write some real specs)" do
      visit '/china_pcd'
      within '.rails-helper' do
        select '广东省'
        select '深圳市'
        select '南山区'
      end
    end

    context 'ajax test' do
      before do
        visit '/china_pcd'
        within '.ajax-helper' do
          select '广东省'
          select '深圳市'
          select '南山区'
        end
      end

      context 'select empty parent' do
        it "city and district" do
          within '.ajax-helper' do
            # select '', :from => '--省份--'
            # expect(find('.city-city').value).to be_blank
            # expect(find('.city-district').value).to be_blank
            # sleep 2
            # expect(all('.city-city option').size).to eql 1
            # expect(all('.city-district option').size).to eql 1
          end
        end
      end
    end
  end
end
