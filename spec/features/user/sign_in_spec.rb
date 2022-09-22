require 'rails_helper'


feature 'user sign in', js: true do
  Company.create(name: "Empresax", email: "empresax@empresa.com.br", domain: 'Emprsa', cnpj: "11123321000822")
  scenario '1' do
    visit new_user_session_path
    
    fill_in 'E-mail', with: 'fulano@empresa.com.br'
    fill_in 'Senha', with: '123456'
    click_button 'Entrar'

    expect(current_path).to eq account_root_path
  end


end