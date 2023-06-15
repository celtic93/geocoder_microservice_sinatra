class GeocoderRoutes < Application
  namespace '/v1' do
    get do
      geocoder_params = validate_with!(GeocoderParamsContract)
      coordinates = Geocoder::SearchService.geocode(geocoder_params[:city])

      if coordinates.present?
        lat, lon = coordinates

        status 200
        json({ data: { lat: lat, lon: lon } })
      else
        status 422
        json({ errors: I18n.t(:not_found, scope: 'api.errors') })
      end
    end
  end
end
