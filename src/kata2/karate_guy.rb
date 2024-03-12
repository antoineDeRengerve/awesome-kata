module Kata2
  class KarateGuy
    AUTHORIZED_STRATEGY = ["chop1", "chop2", "chop3", "chop4"].freeze
    def initialize(strategy)
      raise ArgumentError, "strategy is unknown" unless respond_to?(strategy, true)
      @strategy = strategy
    end

    # @param Integer target value to be found
    # @param Array of integers to be searched
    def chop(target, array)
      send(@strategy, target, array)
    end

    private

    def chop_1(target, array)
      # p "#{target} - #{array} "
      if array.empty?
        -1
      else
        recursive_chop(target, array, 0)
      end
    end

    def recursive_chop(target, array, index_array)
      # p "recursive: #{target} - #{array} - #{index_array}"
      size = array.size
      center = size / 2
      if target == array[center]
        index_array + center
      elsif size == 1
        -1
      elsif target > array[center]
        recursive_chop(target, array[center..], index_array + center)
      else
        recursive_chop(target, array[0...center], index_array)
      end
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

    def chop_3(target, array)
      # p "chop3: #{target} - #{array} "
      if array.empty?
        -1
      else
        recursive_chop_2(target, array, 0, array.size)
      end
    end

    def recursive_chop_2(target, array, start_id, end_id)
      # p "recursive2: #{target} - #{array} - #{start_id} / #{end_id}"
      center_id = (start_id + end_id) / 2
      if array[center_id] == target
        center_id
      elsif start_id == end_id
        -1
      elsif array[center_id] < target
        recursive_chop_2(target, array, center_id + 1, end_id)
      else
        recursive_chop_2(target, array, 0, center_id)
      end
    end

    def chop_4(target, array)
      # p "chop4: #{target} - #{array} "
      if array.empty?
        -1
      end
      # iterative chop on sliced array
      working_array = array
      working_index = 0
      while working_array.size > 1
        center_id = (working_array.size - 1) / 2
        # p "working_array: #{target}: #{working_array} - #{working_index} - #{center_id}"
        if target == working_array[center_id]
          return working_index + center_id
        elsif target > working_array[center_id]
          working_index += center_id + 1
          working_array = working_array[center_id + 1..]
        else
          working_array = working_array[0...center_id]
        end
      end

      if working_array.first == target
        working_index
      else
        -1
      end
    end
  end
end
