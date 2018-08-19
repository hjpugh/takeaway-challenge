module Dishes
  DISHES = [{name: "Chicken Potpie", num: 1, price: 5.63},
            {name: "Grilled Shrimp Tacos", num: 2, price: 4.02},
            {name: "Pizza Margherita", num: 3, price: 8.05},
            {name: "Lemon-Shallot Scallop", num: 4, price: 8.2},
            {name: "Lemon-Basil Chicken", num: 5, price: 4.0}, 
            {name: "Ham and Egg Fried Rice", num: 6, price: 5.11}, 
            {name: "Linguine with Spicy Red Clam Sauce", num: 7, price: 5.33}, 
            {name: "Vegetarian Chili", num: 8, price:5.34}]

  def dishes
    DISHES
  end

  def formatted_menu
    arr = []
    dishes.each { |i| arr << "Name: #{i[:name]}, Price: #{i[:price]}, no: #{i[:num]}" }
    arr
  end

  def order_total(array)
    total = 0
    array.each { |i| total += price_by_no(i) }
    total.round(2)
  end

  def item_by_no(n)
    dishes.select { |i| i[:num] == n }[0]
  end

  def price_by_no(n)
    dishes.select { |i| i[:num] == n }.map { |i| i[:price] }[0].to_f
  end
end
