require 'prawn/measurement_extensions'

PrawnRails.config do |config|
  config.page_layout        = :portrait
  config.page_size          = "LETTER"
  config.margin             = 1.in
  config.skip_page_creation = false
end
