require 'fileutils'
require 'pathname'

# This is adds a couple of methods to make my Homedir work better.
class Pathname
  # A hacky addition to the Pathname class
  # @deprecated
  def mkdir_p *args
    FileUtils.mkdir_p(self.to_s, *args)
  end
end
