= ChinaPcd

中国省市区 的rails engine
大量借鉴参考了 https://github.com/saberma/china_city
也是我的第一个rails plugin engine

## 安装

### Gemfile

    gem 'china_pcd', github: 'godfox2012/china_pcd'

### app/assets/javascripts/application.js

    //= require 'jquery'
    //= require 'china_pcd/jquery.china_pcd'

### config/routes.rb

```ruby
  mount ChinaPcd::Engine => '/china_pcd'
```

## 使用

在页面中加入选择框

```html
  <div class="ajax-helper china-pcd-group">
    <select class='city-select city-province'>
      <option>--省份--</option>
      <%= options_for_select(ChinaPcd.fetch) %>
    </select>
    <select class='city-select city-city'>
      <option>--城市--</option>
    </select>
    <select class='city-select city-district'>
      <option>--地区--</option>
    </select>
  </div>
```

This project rocks and uses MIT-LICENSE.
