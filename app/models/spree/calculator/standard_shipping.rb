module Spree
  class Calculator::StandardShipping < Calculator
    preference :free_shipping_amount,      :decimal, :default => 0.0
    preference :standard_shipping_value, :decimal, :default => 0.0
    preference :set_discount_standard_shipping_value, :decimal, :default => 0.0

    def self.description
      "Standard Shipping"
    end

    def self.available?(object)
      true
    end

    def compute(object)
      items_count = object.line_items.map(&:amount).sum

      if items_count > self.preferred_free_shipping_amount then
        sum = self.preferred_set_discount_standard_shipping_value
      else
        sum = self.preferred_standard_shipping_value
      end

      sum
    end
  end
end