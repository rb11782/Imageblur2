

class Image
 attr_accessor :array

  def initialize(array)
    @array = array
    @y = array.length
    @x = array[0].length
  end

  def output_image
    @array.each_with_index do |row, y|
      row.each_with_index do |pixel, x|
      print pixel, "  "
      end
    puts
    end
  end 

  def switch_to_blur(y, x)
    @array[y -1][x] = 1 unless y == 0
    @array[y +1][x] = 1 unless y >= @y-1
    @array[y][x -1] = 1 unless x == 0
    @array[y][x +1] = 1 unless x >= @x-1
  end

  def value_one
    one = []
    @array.each_with_index do |row, y|
      row.each_with_index do |pixel, x|
        if pixel == 1
        one.push([y, x])
        end
      end
    end
    one
  end

  def switch_corrdinates(iterations)
    iterations.times do 
    final_array_corrdinates_changes = value_one
    final_array_corrdinates_changes.each do |a, b|
      switch_to_blur(a, b)
      end
    end
  end
end
puts "Initial Image Example One"
puts "----"
image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  ])
image.output_image
puts "----", "One Pixel Transform"
image.switch_corrdinates(1)
image.output_image
puts "----"
puts "----"
puts "Initial Image Example Two"
image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  ])
image.output_image
puts "----"   "Two Pixel Transform"
image.switch_corrdinates(1)
image.output_image
puts "----" 
puts "----" 
puts "Initial Image Example Three"
image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0],
  ])
image.output_image
puts "----"   "Pixel Edge Transform"
image.switch_corrdinates(1)
image.output_image
puts "----" 
puts "----" 



