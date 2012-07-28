module Unfuddle
  class Util

    class << self

      def prepare_date(date)
        date = Date.parse(date) if date.is_a? String
        date.strftime("%-m/%d/%Y")
      end

    end

  end
end