doubled = [1,2,3].collect do |num|
  num * 2
end

p doubled

class Array
  def kollect
    new_array = []
    self.each do |elem|
      new_array << yield(elem)
    end
    new_array
  end
end

doubled = [1,2,3].kollect do |num|
  num * 2
end

p doubled