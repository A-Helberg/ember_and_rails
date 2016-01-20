

  if Rails.configuration.cache_classes
    puts "Generating models"
  else
    Rails.application.config.to_prepare do
      Ember.update_files
    end
  end
