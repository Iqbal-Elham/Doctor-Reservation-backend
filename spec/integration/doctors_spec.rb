require 'swagger_helper'

describe 'Doctors API' do

  path '/api/doctors' do

    post 'Creates a doctor' do
      tags 'Doctors'
      consumes 'application/json'
      parameter name: :doctor, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          photo: { type: :string },
          about: { type: :string },
          price_hour: { type: :integer }
        },
        required: [ 'name', 'photo', 'about', 'price_hour' ]
      }

      response '201', 'doctor created' do
        let(:doctor) { { name: 'Iqbal', photo: 'available', about: 'I am a fake doctor', price_hour: 2} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:doctor) { { name: 'Bahir', about: 'I am also a fake doctor' } }
        run_test!
      end
    end
  end