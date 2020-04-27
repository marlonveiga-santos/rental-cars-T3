require 'rails_helper'

feature 'Admin view car categories' do
    scenario 'successfully' do
        # Arrange
        CarCategory.create!(name: 'A', daily_rate: 50)
        CarCategory.create!(name: 'B', daily_rate: 70)

        # Act
        visit root_path
        click_on 'Categorias de Carros'

        # Assert
        expect(page).to have_content 'Categoria A'
        expect(page).to have_content 'R$ 50,00'

        expect(page).to have_content 'Categoria B'
        expect(page).to have_content 'R$ 70,00'

    end

    scenario 'and view car category details' do
        # Arrange
        CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, third_part_insurance: 30)
        CarCategory.create!(name: 'B', daily_rate: 70, car_insurance: 50, third_part_insurance: 30)

        # Act
        visit root_path
        click_on 'Categorias de Carros'
        click_on 'Categoria A'

        # Assert
        expect(page).to have_content 'Categoria A'
        expect(page).to have_content 'Diária: R$ 50,00'
        expect(page).to have_content 'Seguro do carro: R$ 50,00'
        expect(page).to have_content 'Seguro para terceiros: R$ 30,00'

    end

    scenario 'and no car categories are created' do
        visit root_path
        click_on 'Categorias de Carros'
    
        expect(page).to have_content('Nenhuma categoria de carro cadastrada')
      end
end