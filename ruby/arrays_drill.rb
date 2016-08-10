# take three items and build an array
def build_array(one, two, three)
    [one, two, three]
end

# add a method that takes an array and item as parameters and returns the array
# with the item added

def add_to_array(array, item)
    array << item
end
puts "build_array"
p build_array(1, 2, 3)

puts "------------"
puts "add_to_array"
p add_to_array([1, 2, 3], 4)
p add_to_array(%w{one two three}, "four")
pets = %w{dog cat}
p add_to_array(pets, 'hamster')
puts "-------------"

# Create array and add var to array
array = []
dog = "dog"

p array << dog

# 2. Add five items to array and print
array += [1, 2, 3, 4, 5]
p array

# 3. delete item at index 2

array.delete_at(2)
p array

#4. insert a new item at index 2
array.insert(2, "string")
p array

#5. Remove the first item of the array
puts "-------"
 array.shift
p array
# p array.drop(1)
# p array

#6. ask if array includes a certain item
puts 'Does the array contain "string"?'
p array.include?('string')

#7. initialize another array that has items in it

p array_two = %w{one two three four}

#8. add two arrays together and store in a new var

p array.concat(array_two)
