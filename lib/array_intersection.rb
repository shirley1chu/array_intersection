# Returns a new array to that contains elements in the intersection of the two input arrays
# Time complexity: O(n), because the lookup for a hash is constant, and the times we do a lookup depends on the length of the longer array
# Space complexity: O(n). where n is the length of the shortest array, since all elements of the shortest array are plaeced in the hash

def intersection(array1, array2)
  return [] unless array1 && array2
  return [] if array1.length == 0 || array2.length == 0

  if array1.length < array2.length
    shorter_array = array1
    longer_array = array2
  else
    shorter_array = array2
    longer_array = array1
  end

  index = 0
  shorter_array_hash = {}

  until index > shorter_array.length
    shorter_array_hash[shorter_array[index]] = 1
    index += 1
  end

  intersection_array = []
  longer_array.each do |element|
    intersection_array.push(element) if shorter_array_hash.include?(element)
  end

  return intersection_array
end
