require 'rails_helper'

describe "Inn Rooms API" do
  context "GET /api/v1/inn_rooms/1" do
    it "success" do
      inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida', 
                                  document: '53783222001', email: 'joao@email.com', password: '123456')
      inn = inn_owner.create_inn!(name: 'Pousada do Almeidinha', registration_number: '30638898000199', description: 'Um bom lugar', 
                                  address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})
      room = inn.inn_rooms.create!(name: 'Quarto Térreo', size: 30, guest_limit: 3, daily_rate_cents: 500)
      
      get("api/v1/inn_rooms/#{room.id}")

      expect(response.status).to eq 200
      expect(response.content_type).to include 'application/json'
      json_response = JSON.parse(response.body)
      expect(json_response[:name]).to eq 'Quarto Térreo'
      expect(json_response[:size]).to eq 30
      expect(json_response[:guest_limit]).to eq 3
      expect(json_response[:daily_rate_cents]).to eq 500
    end
  end
end
