Spree::Core::Engine.routes.append do
  get "/estimate_shipping_cost", :to => 'orders#estimate_shipping_cost', :as => :estimate_shipping_cost
  get "/remove_coupon", :to => 'orders#remove_coupon', :as => :remove_coupon
end

