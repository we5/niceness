module We5
  module Extensions
    module Array

      def spaced
        self.join(" ")
      end

      def piped
        self.join("|")
      end

      def supercompact
        self.flatten.compact
      end
    end
  end
end
