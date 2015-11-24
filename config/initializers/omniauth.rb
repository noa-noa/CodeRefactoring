Rails.application.config.middleware.use OmniAuth::Builder do
	provider :github,
		Rails.application.secrets.github_api_key,
		Rails.application.secrets.github_api_secret
end