class GeocoderParamsContract < Dry::Validation::Contract
  params do
    required(:city).value(:string)
  end
end
