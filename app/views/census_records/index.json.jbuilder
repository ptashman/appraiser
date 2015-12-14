json.array!(@census_records) do |census_record|
  json.extract! census_record, :id
  json.url census_record_url(census_record, format: :json)
end
