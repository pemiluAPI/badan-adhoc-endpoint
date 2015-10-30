module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :pemilu do
      desc "Return list pemilu"
      get do
        results = Pemilu.apiall(params)
        {
          results: results
        }
      end
    end
  end
end