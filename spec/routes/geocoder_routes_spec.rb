RSpec.describe GeocoderRoutes, type: :routes do
  describe 'GET /v1' do
    context 'missing parameters' do
      it 'returns an error' do
        get '/v1'

        expect(last_response.status).to eq(422)
        expect(response_body['errors']).to include('В запросе отсутствуют необходимые параметры')
      end
    end

    context 'invalid parameters' do
      let(:params) { { city: 'Missing' } }

      it 'returns an error' do
        get '/v1', params

        expect(last_response.status).to eq(422)
        expect(response_body['errors']).to include('Запрашиваемый ресурс не найден')
      end
    end

    context 'valid parameters' do
      let(:params) { { city: 'Москва' } }

      it 'returns coordinates' do
        get '/v1', params

        expect(response_body['data']).to a_hash_including(
          'lat' => 55.7540471,
          'lon' => 37.620405
        )
      end
    end
  end
end
