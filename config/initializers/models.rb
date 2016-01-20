
a = ActiveSupport::FileUpdateChecker.new([], {"#{Rails.root.join('app', 'models')}" => ["rb"]}) do
  puts ""
  puts "========================================================="
  puts "Generating models"
  Rails.application.eager_load!
  ActiveRecord::Base.descendants.each do |model|
    puts model.name
    model.columns_hash.each {|k,v| puts "#{k} => #{v.type}"}
  end
  puts "========================================================="
  puts ""
end

  if Rails.configuration.cache_classes
    puts "Generating models"
  else
    Rails.application.config.to_prepare do
      a.execute
    end
  end
