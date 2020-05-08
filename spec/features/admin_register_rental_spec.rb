require 'rails_helper'

feature 'Admin register rental' do
  scenario 'successfully' do
    customer = Customer.create!(name: 'Jon Doe', document: '779.481.088-40',
                                email: 'teste@teste.com.br')

    car_category = CarCategory.create!(name: 'A', daily_rate: 100,
                                       car_insurance: 100,
                                       third_part_insurance: 100)
    user = User.create!(email: 'teste@teste.com.br', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Locações'
    click_on 'Registrar nova locação'
    fill_in 'Data de início', with: '01/05/2030'
    fill_in 'Data de término', with: '03/05/2030'
    select customer.name, from: 'Cliente'
    select car_category.name, from: 'Categoria'
    click_on 'Enviar'

    expect(page).to have_content('Data de início: 01/05/2030')
    expect(page).to have_content('Data de término: 03/05/2030')
    expect(page).to have_content("Cliente: #{customer.name}")
    expect(page).to have_content("Categoria: #{car_category.name}")
  end

  xscenario 'and must fill in all fields' do
  end

  scenario 'and must be authenticated' do
    visit new_rental_path

    expect(current_path).to eq(new_user_session_path)
  end
end
