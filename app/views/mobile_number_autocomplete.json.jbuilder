json.array! @mobile_numbers do |mobile|
  json.id mobile.id
  json.text mobile.mobile_number.to_s
end