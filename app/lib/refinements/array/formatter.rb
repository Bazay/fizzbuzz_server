module Refinements::Array::Formatter
  refine Array do
    def map_key! key
      map do |hash|
        if hash.is_a? Hash
          hash.with_indifferent_access[key]
        else
          raise Exception, "Expected type Hash, got #{hash.class.name}"
        end
      end
    end
  end
end
