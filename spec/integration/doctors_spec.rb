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
        let(:doctor) { { name: 'Iqbal', photo: 'http://example.com/avatar.jpg', about: 'I am a fake doctor', price_hour: 2} }
        run_test!
      end

      response '422', 'invalid request' do
        let(:doctor) { { name: 'Bahir', about: 'I am also a fake doctor' } }
        run_test!
      end
    end
  end

  path '/api/doctors/{id}' do

    get 'Retrieves a doctor' do
      tags 'Doctors'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string },
            photo: { type: :string },
            about: { type: :string },
            price_hour: { type: :integer }
          },
          required: [ 'id', 'name', 'photo', 'about', 'price_hour' ]

        let(:id) { Doctor.create(name: 'Iqbal', photo: 'http://example.com/avatar.jpg', about: 'I am a neurologist', price_hour: 500).id }
        run_test!
      end

      response '404', 'doctor not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end