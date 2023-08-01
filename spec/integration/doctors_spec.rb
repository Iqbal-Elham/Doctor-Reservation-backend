require 'swagger_helper'

describe 'Doctors API' do
  path '/api/doctors' do
    get 'Retrieves all doctors' do
      tags 'Doctors'
      produces 'application/json'

      response '200', 'doctors found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   photo: { type: :string },
                   about: { type: :string },
                   price_hour: { type: :integer }
                 },
                 required: ['id', 'name', 'photo', 'about', 'price_hour']
               }

        let(:doctor1) { { id: 1, name: 'Doctor 1', photo: 'http://example.com/doctor1.jpg', about: 'I am a doctor', price_hour: 100 } }
        let(:doctor2) { { id: 2, name: 'Doctor 2', photo: 'http://example.com/doctor2.jpg', about: 'I am another doctor', price_hour: 150 } }
        run_test!
      end
    end

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
        required: ['name', 'photo', 'about', 'price_hour']
      }

      response '201', 'doctor created' do
        let(:doctor) { { name: 'Iqbal', photo: 'http://example.com/avatar.jpg', about: 'I am a fake doctor', price_hour: 2 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:doctor) { { name: 'Bahir', about: 'I am also a fake doctor' } }
        run_test!
      end
    end
  end

  path '/api/doctors/{id}' do
    parameter name: :id, in: :path, type: :integer

    get 'Retrieves a doctor' do
      tags 'Doctors'
      produces 'application/json'

      response '200', 'doctor found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 photo: { type: :string },
                 about: { type: :string },
                 price_hour: { type: :integer }
               },
               required: ['id', 'name', 'photo', 'about', 'price_hour']

        let(:id) { Doctor.create(name: 'Iqbal', photo: 'http://example.com/avatar.jpg', about: 'I am a neurologist', price_hour: 500).id }
        run_test!
      end

      response '404', 'doctor not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    delete 'Deletes a doctor' do
      tags 'Doctors'
      produces 'application/json'

      response '204', 'doctor deleted' do
        let(:id) { Doctor.create(name: 'Doctor to delete', photo: 'http://example.com/avatar.jpg', about: 'I am a doctor to delete', price_hour: 300).id }
        run_test!
      end

      response '404', 'doctor not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
