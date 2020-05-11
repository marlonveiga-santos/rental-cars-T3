require 'rails_helper'

RSpec.describe Rental, type: :model do
  it 'should generate a code on create' do
    customer = Customer.create!(name: 'Jon Doe', document: '779.481.088-40',
                                email: 'teste@teste.com.br')
    car_category = CarCategory.create!(name: 'A', daily_rate: 100,
                                       car_insurance: 100,
                                       third_part_insurance: 100)
    rental = Rental.new(start_date: 1.day.from_now, end_date: 2.days.from_now,
                        customer: customer, car_category: car_category)
                  
    rental.save

    expect(rental.code).not_to be_blank
  end
end
