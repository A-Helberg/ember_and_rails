class EmberBinaries

  def self.node
    "#{ENV["NVM_BIN"]}/node"
  end

  def self.embercli
    "#{node} #{EmberPaths.node_modules}node_modules/ember-cli/bin/ember"
  end

  def self.npm
    "#{ENV["NVM_BIN"]}/npm"
  end

end
