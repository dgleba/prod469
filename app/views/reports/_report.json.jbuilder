json.extract! report, :id, :name, :active_status, :sort_order, :created_at, :updated_at
json.url report_url(report, format: :json)
