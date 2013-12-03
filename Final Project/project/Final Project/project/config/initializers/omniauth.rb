Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '214669245382003', '21821dc7ed425f522d42dceeac2226ff'
end