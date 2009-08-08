module We5
  module Helpers
    module BrowserHelpers

      def ua
        request.user_agent
      end

      def ua_engine
        case ua
        when /WebKit/: :webkit
        when /Gecko\//: :gecko
        when /MSIE/: :ie
        when /Opera/: :opera
        else nil
        end
      end

      def ua_version
        case ua
        when /Version\/(\d).*Mobile.*Safari/: "mobile"
        when /Version\/(\d).*Safari/: "safari#{$1}"
        when /Firefox\/(\d)\.([1-9])/: "ff#{$1}_#{$2}"
        when /Firefox\/(\d)/: "ff#{$1}"
        when /MSIE (\d)/: "ie#{$1}"
        end
      end

      def ua_platform
        case ua
        when /Macintosh/: :mac
        when /iPhone/: :iphone
        when /Windows/: :win
        when /Linux/: :linux
        else nil
        end
      end

      def browser_engine
        [
          ua_engine,
          ua_version,
          ua_platform
        ].compact.join(" ")
      end
    end
  end
end
