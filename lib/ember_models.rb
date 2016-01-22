module EmberModels

  def self.clean!
    FileUtils.rm_rf("#{EmberPaths.models}/.", secure: true)
    FileUtils.rm_rf("#{EmberPaths.model_tests}/.", secure: true)
  end

  def self.file_checker
    @@file_checker ||= ActiveSupport::FileUpdateChecker.new([], {"#{Rails.root.join('app', 'models')}" => ["rb"]}) do
      puts ""
      puts "========================================================="
      puts "Generating models"
      clean!
      Rails.application.eager_load!
      ActiveRecord::Base.descendants.each do |model|
        command = "g model #{model.name} "
        model.columns_hash.each {|k,v| command << "#{k}:#{v.type} " unless k == "id"}
        puts command
        EmberExecute.ember! command
      end
      EmberExecute.build!
      puts "========================================================="
      puts ""
    end
  end

  def self.update!
    file_checker.execute
  end
end
