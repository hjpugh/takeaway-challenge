require 'dishes'

describe Dishes do
  let(:dummy_class) { Class.new { include Dishes } }
  let(:subject) { dummy_class.new }

  describe '#format' do
    it 'returns a formatted list dishes' do
      expect(subject.format).to eq ['Name: Chicken Potpie, Price: 5.63, no: 1',
                                    'Name: Grilled Shrimp Tacos, Price: 4.02, no: 2',
                                    'Name: Pizza Margherita, Price: 8.05, no: 3',
                                    'Name: Lemon-Shallot Scallop, Price: 8.2, no: 4',
                                    'Name: Lemon-Basil Chicken, Price: 4.0, no: 5',
                                    'Name: Ham and Egg Fried Rice, Price: 5.11, no: 6',
                                    'Name: Linguine with Spicy Red Clam Sauce, Price: 5.33, no: 7',
                                    'Name: Vegetarian Chili, Price: 5.34, no: 8']
    end
  end

  describe '#order_total' do
    it 'returns the order total given an array of order numbers' do
      expect(subject.order_total([1, 2])).to eq 9.65
    end
  end

  describe '#item_by_no' do
    it 'returns the appropriate dish given its menu no.' do
      expect(subject.item_by_no(3)).to eq({name: "Pizza Margherita", num: 3, price: 8.05})
    end
  end

  describe '#price_by_no' do
    it 'returns the appropriate price given a dish no.' do
      expect(subject.price_by_no(3)).to eq 8.05
    end
  end
end