module Spree
  module AdvancedCart
    class Engine < Rails::Engine
      isolate_namespace Spree
      engine_name 'spree_advanced_cart'
      
      initializer "spree.advanced_cart.environment", :before => :load_config_initializers do |app|
        Spree::AdvancedCart::Config = Spree::AdvancedCartConfiguration.new
      end

      config.autoload_paths += %W(#{config.root}/lib)

      def self.activate
        Dir.glob(File.join(File.dirname(__FILE__), "../../../app/**/*_decorator*.rb")) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end
        
        Dir.glob(File.join(File.dirname(__FILE__), "../../../app/overrides/*.rb")) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end
      end

      config.to_prepare &method(:activate).to_proc

      #initializer 'spree.register.calculators', :after => "spree.register.calculators" do |app|
      #      app.config.spree.calculators.add_class('product_customization_types')
      #      app.config.spree.calculators.product_customization_types = [
      #        Spree::Calculator::StandardShipping]
      #end

      initializer "spree.register.calculators", :after => "spree.register.calculators" do |app|
        app.config.spree.calculators.shipping_methods.concat(
          [Spree::Calculator::StandardShipping]
        )
      end



    end
  end
end
