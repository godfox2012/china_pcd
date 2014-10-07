module ChinaPcd
  class Engine < ::Rails::Engine
    isolate_namespace ChinaPcd

    config.generators do |g|
      g.test_framework      :rspec,        fixture: false
      g.assets false
      g.helper false
      g.view_specs false
    end
  end
end
