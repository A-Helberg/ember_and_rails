class Ember
  def self.file_checker
    @@file_checker ||= ActiveSupport::FileUpdateChecker.new([], {"#{Rails.root.join('app', 'models')}" => ["rb"]}) do
      puts ""
      puts "========================================================="
      puts "Generating models"
      Rails.application.eager_load!
      ActiveRecord::Base.descendants.each do |model|
        puts model.name
        model.columns_hash.each {|k,v| puts "   #{k} => #{v.type}"}
      end
      puts "========================================================="
      puts ""
    end
  end

  def self.update_files
    file_checker.execute
  end
end
