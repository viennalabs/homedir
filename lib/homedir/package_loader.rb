require 'homedir/errors'
require 'homedir/package_version1_loader'
require 'homedir/package_version2_loader'
require 'homedir/package_version3_loader'

module Homedir
  class PackageLoader

    # The list of loaders, in the order they should be tried
    #
    # @return {Enumerable} A list of package loaders
    def loaders
      # The order is important
      @loaders ||= [
        PackageVersion3Loader.new,
        PackageVersion2Loader.new,
        PackageVersion1Loader.new,
      ].freeze
    end

    # Loads a package from a path
    #
    # @param {Pathname} path The directory of the package
    # @return {Homedir::Package} The package object
    def load_from_path path
      loaders.each do |loader|
        begin
          return loader.load_from_path(path) if loader.path_is_valid?(path)
        rescue InvalidPackageDirectoryError
          next
        end
      end

      raise InvalidPackageDirectoryError.new("The directory '#{path}' doesn't contain a valid package")
    end

    # Is the path a valid version1 package directory?
    #
    # @return {Boolean} Returns true if the path is a valid package directory.
    def path_is_valid? path
      loaders.each do |loader|
        return true if loader.path_is_valid?(path)
      end
      return false
    end

  end
end
