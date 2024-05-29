require 'rails_helper'

describe "Dono de Pousada registra uma reserva" do
  it "com sucesso" do
    inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida', 
                                  document: '53783222001', email: 'joao@email.com', password: '123456')
    inn = inn_owner.create_inn!(name: 'Pousada do Almeidinha', registration_number: '30638898000199', description: 'Um bom lugar', 
                                address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})

    login_as inn_owner, scope: :inn_owner
    visit root_path
    click_on 'Gestão de Pousadas'
    click_on 'Cadastrar Reserva'
    fill_in "Nome do grupo",	with: "Turma Treina Dev 12" 
    fill_in "Data de início", with: 2.weeks.from_now
    fill_in "Data do fim", with: 3.weeks.from_now
    click_on 'Cadastrar'

    expect(page).to have_content 'Reserva cadastrada com sucesso!'
    expect(page).to have_content 'Nome da reserva: Turma Treina Dev 12'
    expect(page).to have_content 'Início: '
    expect(page).to have_content 'Fim: '
  end
  
end
