Rails.application.config.assets.paths << EmberPaths.assets

if Rails.configuration.cache_classes
  puts "Generating models"
else
  EmberExecute.new_tmp_project!
  EmberExecute.build!
  Rails.application.config.to_prepare do
    EmberModels.update!
  end
end
