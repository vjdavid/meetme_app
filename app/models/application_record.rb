class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

def print_odd_numbers
  starts = 2

  while starts <= END_OF_NUMBER
    puts starts
    starts += 2
  end
end
