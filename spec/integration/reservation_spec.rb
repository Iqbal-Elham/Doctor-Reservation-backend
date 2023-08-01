require 'swagger_helper'

describe 'Reservations API' do
  path '/api/reservations' do
    get 'Retrieves all reservations' do
      tags 'Reservations'
      produces 'application/json'

      response '200', 'reservation found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   appointment_time: { type: :datetime },
                   doctor_id: { type: :integer },
                   patient_id: { type: :integer }
                 },
                 required: ['doctor_id', 'patient_id', 'appointment_time']
               }

        let(:reservatoin1) { { doctor_id: 1, patient_id: 1, appointment_time: '2023-07-26T14:30:00.000Z' } }
        let(:reservatoin2) { { doctor_id: 2, patient_id: 2, appointment_time: '2023-07-26T14:30:00.000Z' } }
        run_test!
      end
    end

    post 'Creates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
            appointment_time: { type: :datetime },
            doctor_id: { type: :integer },
            patient_id: { type: :integer }
        },
        required: ['doctor_id', 'patient_id', 'appointment_time']
      }

      response '201', 'reservation created' do
        let(:reservation) { { doctor_id: 1, patient_id: 1, appointment_time: '2023-07-26T14:30:00.000Z' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) { { doctor_id: 1, patient_id: 1 } }
        run_test!
      end
    end
  end
