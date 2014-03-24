require_relative 'ring_buffer.rb'

buffer_size = 1024*1024
rb = RingBuffer.new(buffer_size)

t0 = Time.now
(buffer_size-1).times {|idx|
  rb.write idx
}
t1 = Time.now
(buffer_size-1).times {|idx|
  rb.read
}
t2 = Time.now

t_all = (t2-t0) * 1000.0
t_avg_w = (t1 - t0) * 1000.0 * 1000.0 / buffer_size
t_avg_r = (t2 - t1) * 1000.0 * 1000.0 / buffer_size

printf("All: %.02fms\n", t_all)
printf("Avg. write: %.02fμs\n", t_avg_w)
printf("Avg. read: %.02fμs\n", t_avg_r)