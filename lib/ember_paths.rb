class EmberPaths

  def self.tmp
    Rails.root.join('tmp','ember')
  end

  def self.app
    tmp.join('app')
  end

  def self.dist
    tmp.join('dist')
  end

  def self.assets
    dist.join('assets')
  end

  def self.tests
    tmp.join('test')
  end

  def self.models
    app.join('models')
  end

  def self.model_tests
    tests.join('unit', 'models')
  end

  def self.index_file
    dist.join('index.html')
  end

  def self.node_modules
    #TODO: Check that nvm env variables are set
    ENV["NVM_PATH"][0..-5]
  end

end
