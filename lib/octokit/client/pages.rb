module Octokit
  class Client

    # Methods for the Pages API
    #
    # @see https://developer.github.com/v3/repos/pages/
    module Pages

      # List Pages information for a repository
      #
      # @param repo [Integer, String, Repository, Hash] A GitHub repository
      # @return Sawyer::Resource A GitHub Pages resource
      # @see https://developer.github.com/v3/repos/pages/#get-information-about-a-pages-site
      def pages(repo, options = {})
        opts = ensure_api_media_type(:pages, options)
        get "#{Repository.path repo}/pages", opts
      end

      # List Pages builds for a repository
      #
      # @param repo [Integer, String, Repository, Hash] A GitHub repository
      # @return [Array<Sawyer::Resource>] A list of build history for a repository.
      # @see https://developer.github.com/v3/repos/pages/#list-pages-builds
      def pages_builds(repo, options = {})
        get "#{Repository.path repo}/pages/builds", options
      end
      alias :list_pages_builds :pages_builds

      # List the latest Pages build information for a repository
      #
      # @param repo [Integer, String, Repository, Hash] A GitHub repository
      # @return Sawyer::Resource A GitHub Pages resource about a build
      # @see https://developer.github.com/v3/repos/pages/#list-latest-pages-build
      def latest_pages_build(repo, options = {})
        get "#{Repository.path repo}/pages/builds/latest", options
      end

      # Request a page build for the latest revision of the default branch
      #
      # You can only request builds for your repositories
      #
      # @param repo [Integer, String, Repository, Hash] A GitHub repository
      # @return [Sawyer::Resource] Request result
      # @see https://developer.github.com/v3/repos/pages/#request-a-page-build
      def request_page_build(repo, options = {})
        opts = ensure_api_media_type(:pages, options)
        post "#{Repository.path repo}/pages/builds", opts
      end
    end
  end
end
