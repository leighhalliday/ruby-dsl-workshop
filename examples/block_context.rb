class Dummy
  def print_name(&block)
    @name = "Inside"
    block.call
    instance_eval(&block)
  end
end

@name = "Outside"
Dummy.new.print_name do
  puts @name
end