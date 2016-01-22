class EmberExecute

  def self.exec(command)
    `cd #{EmberPaths.tmp} && #{command} && cd -`
  end

  def self.bower_install_command
    #TODO: Needs more work!!!!
    "#{EmberBinaries.npm} bower install"
  end

  def self.npm_install_command
    "#{EmberBinaries.npm} install"
  end

  def self.npm_install!
    exec npm_install_command
  end

  def self.new_tmp_project_command
    ember("new frontend --dir #{EmberPaths.tmp} --skip-bower --skip-npm")
  end

  def self.new_tmp_project!
    `#{new_tmp_project_command}`
  end

  def self.build
    ember("build")
  end

  def self.build!
    exec build
  end

  def self.ember(cmd)
    "#{EmberBinaries.embercli} #{cmd}"
  end

  def self.ember!(cmd)
    exec ember(cmd)
  end

end
