require "china_pcd/engine"

module ChinaPcd
  CHINA = '000000' # 全国
  PATTERN = /(\d{2})(\d{2})(\d{2})/

  class << self

    def list(parent_id = '000000')
      if parent_id == CHINA
        return provinces
      end
      id_match = match parent_id
      cities = {}
      data['city'].each do |k, v|
        cities[k] = {name: v, children: districts(k.to_s)} if k.to_s.start_with?(id_match[1])
      end
      cities
    end

    def fetch(code = '000000')
      return [] if code.blank?
      if code == CHINA
        return provinces true
      elsif province?(code)
        return cities code, true
      elsif city?(code)
        return districts code, true
      end
    end

    def provinces(for_select = false)
      for_select ? (data['province'].map { |k, v| [v, k] }) : data['province']
    end

    # code 省
    def cities(code, for_select = false)
      id_match = match code
      cities = {}
      data['city'].each do |k, v|
        cities[k] = v if k.to_s.start_with?(id_match[1])
      end
      return for_select ? (cities.map { |k, v| [v, k] }) : cities
    end

    # 市 code
    def districts(code, for_select = false)
      id_match = match code
      districts = {}
      data['district'].each do |k, v|
        districts[k] = v if k.to_s.start_with?("#{id_match[1]}#{id_match[2]}")
      end
      return for_select ? (districts.map { |k, v| [v, k] }) : districts
    end

    def get(code, prepend_parent=false)
      return '' if code.blank?
      id_match = match code
      if code.end_with?('0000')
        return data['province'][code.to_i]
      elsif code.end_with?('00')
        c = data['city'][code.to_i]
        c = "#{get province_id(code)}#{c}" if prepend_parent
        return c
      else
        d = data['district'][code.to_i]
        d = "#{get province_id(code)}#{get city_id(code)}#{d}" if prepend_parent
        return d
      end
    end

    def province_id(code)
      match(code)[1].ljust 6, '0'
    end

    def city_id(code)
      id_match = match code
      "#{id_match[1]}#{id_match[2]}".ljust 6, '0'
    end

    def province?(code)
      code != CHINA && code.end_with?('0000')
    end

    def city?(code)
      !code.end_with?('0000') && code.end_with?('00')
    end

    private

      def data
        unless @list
          @list = {}
          @list = YAML.load_file "#{Engine.root}/config/pcds.yml"
        end
        @list
      end

      def match(code)
        code.match(PATTERN)
      end
  end

end
