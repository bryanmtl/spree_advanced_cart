Deface::Override.new(:virtual_path => "spree/orders/edit",
                     :name => "remove_cart_buttons",
                     :remove => "[data-hook='cart_buttons']")

Deface::Override.new(:virtual_path => "spree/orders/edit",
                     :name => "remove_empty_buttons",
                     :remove => "#empty-cart")

Deface::Override.new(:virtual_path => "spree/orders/edit",
                     :name => "replace_cart_buttons",
                     :insert_after => "#subtotal",
                     :partial => "spree/orders/cart_buttons")

Deface::Override.new(:virtual_path => "spree/orders/edit",
                     :name => "remove_subtotal",
                     :remove => "#subtotal")

Deface::Override.new(:virtual_path => "spree/orders/edit",
                     :name => "replace_subtotal",
                     :insert_before => "[data-hook='cart_buttons']",
                     :partial => "spree/orders/subtotal")




