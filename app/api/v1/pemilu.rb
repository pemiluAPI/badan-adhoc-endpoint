module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :jenis_wilayah do
      desc "Return list jenis wilayah"
      get do
        results = Adhoc::JENISWILAYAH
        {
          results: results
        }
      end
    end

    resource :adhoc do
      desc "Return list adhoc"
      get do
        results = Adhoc.apiall(params)
        {
          results: results
        }
      end
    end
  end
end