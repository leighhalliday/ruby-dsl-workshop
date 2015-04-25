result = [1,2,3].collect do |num|
  num * 2
end
p result

double = ->(num) {
  num * 2
}
p double.call(5)