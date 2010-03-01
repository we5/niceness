module We5
  module ActiveRecord
    module Random
      
      def self.random(count=1)
        ids = connection.select_values("SELECT id FROM #{table_name}");
        random_ids = Array.new(count).map do |i|
          ids.delete(ids.rand)
        end

        find(random_ids.compact)
      end

    end
  end
end