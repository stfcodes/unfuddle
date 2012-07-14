module Unfuddle
  class Util

    class << self

      def prepare_date(date)
        date.strftime("%-m/%d/%Y")
      end

    end

  end
end