module Refinements::PositiveNumber
  refine NilClass do
    def fetch_positive_number default = nil
      default
    end
  end

  refine String do
    def fetch_positive_number *args
      to_i.fetch_positive_number *args
    end
  end

  refine Integer do
    def fetch_positive_number default = nil
      nonzero? && abs || default
    end
  end
end
