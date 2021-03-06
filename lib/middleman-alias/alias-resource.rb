module Middleman
  module Sitemap
    class AliasResource < ::Middleman::Sitemap::Resource

      attr_accessor :output

      def initialize(store, path, params, alias_path)
        @alias_path = alias_path
        @params = params
        super(store, path)
      end

      def source_file
        nil
      end

      def template?
        false
      end

      def render(*args, &block)
        %[
          <html>
            <head>
              <link rel="canonical" href="#{@alias_path}#{@params}" />
              <meta name="robots" content="noindex,follow" />
              <meta http-equiv="cache-control" content="no-cache" />
              <script>
                // Attempt to keep search and hash
                window.location.replace("#{@alias_path}#{@params}"+window.location.search+window.location.hash);
              </script>
              <meta http-equiv=refresh content="0; url=#{@alias_path}#{@params}" />
            </head>
            <body>
              <a href="#{@alias_path}#{@params}">You are being redirected.</a>
            </body>
          </html>
        ]
      end

      def binary?
        false
      end

      def raw_data
        {}
      end

      def ignored?
        false
      end

      def metadata
        @local_metadata.dup
      end


    end
  end
end

