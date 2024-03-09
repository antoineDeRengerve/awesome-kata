module Kata2
  class KarateGuy
    CHOP_STRATEGY = [:chop_1, :chop_2]

    def initialize(strategy)
      raise ArgumentError, "strategy is unknown" unless CHOP_STRATEGY.include?(strategy)
      @strategy = strategy
    end

    # @param Integer target value to be found
    # @param Array of integers to be searched
    def chop(target, array)
      send(@strategy, target, array)
    end

    private

    def recursive_chop(target, array, index_array)
      # p "recursive: #{target} - #{array} - #{index_array}"
      size = array.size
      center = size / 2
      if size == 0
        -1
      elsif size == 1
        if target == array[0]
          index_array
        else
          -1
        end
      elsif target == array[center]
        index_array + center
      elsif target > array[center]
        recursive_chop(target, array[center..], index_array + center)
      else
        recursive_chop(target, array[0...center], index_array)
      end
    end

    def chop_1(target, array)
      # p "#{target} - #{array} "
      recursive_chop(target, array, 0)
    end

    def chop_2(target, array)
      # p "#{target} - #{array} "

      return -1 if array.empty?

      start_id = 0
      end_id = array.size - 1
      center_id = (end_id + start_id) / 2
      while end_id - start_id > 0
        # p "#{start_id} - #{end_id}: #{center_id} "
        if target == array[center_id]
          start_id = center_id
          end_id = center_id
        elsif target > array[center_id]
          start_id = center_id + 1
        else
          end_id = center_id
        end
        center_id = (end_id + start_id) / 2
      end
      if target == array[center_id]
        center_id
      else
        -1
      end
    end
  end
end