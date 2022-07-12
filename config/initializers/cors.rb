Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
        origins 'http://localhost:3001' # React側はポート番号3001で作るので「localhost:3001」を指定

        resource '*',
            headers: :any,
            expose: ["access-token", "expiry", "token-type", "uid", "client"], # 追記
            methods: [:get, :post, :put, :patch, :delete, :options, :head],
            credentials: true # Cookieを利用する場合はcredentials: trueを追記
    end

    #本番環境用のオリジン設定
    allow do
        # origins 'https:<自身が設定するアプリのURL>'
        origins 'http://localhost:3001'

        resource '*',
            headers: :any,
            expose: ["access-token", "expiry", "token-type", "uid", "client"], # 追記
            methods: [:get, :post, :put, :patch, :delete, :options, :head],
            credentials: true
    end
end
