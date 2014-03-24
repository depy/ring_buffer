class RingBuffer

  attr_accessor :ring, :size, :start, :end

  def initialize(size)
    @ring = Array.new(size)
    @size = size
    @start, @end = 0, 0
  end

  def full?
    (@end + 1) % @size == @start
  end

  def empty?
    @end == @start
  end

  def write(element)
    return if full?

    @ring[@end] = element
    @end = (@end + 1) % @size
  end

  def read
    return if empty?

    element = @ring[@start]
    @start = (@start + 1) % @size
    element
  end

  def clear
    @ring = Array.new(@size)
    @start, @end = 0, 0
  end

end
