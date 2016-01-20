
  if Rails.configuration.cache_classes
    puts "Generating models"
  else
    ActionDispatch::Reloader.to_prepare do
      puts "Generating models"
    end
  end
