module We5
  module Extensions
    module String

      def wrap(prefix, suffix)
        [prefix, self, suffix].join
      end

      def parenthesize
        self.wrap("(", ")")
      end
    end
  end
end
