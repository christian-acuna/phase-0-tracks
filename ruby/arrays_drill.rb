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
p "-------"
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
