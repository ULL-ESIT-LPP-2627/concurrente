#! /home/usuario/.rbenv/shims/ruby 

puts Thread.main
puts "-"

t1 = Thread.new do
  sleep(10_000)
end
for thr in Thread.list 
  p thr
end
puts "Current thread = " + Thread.current.to_s
puts "--"

t2 = Thread.new do
  sleep(10_000)
end
for thr in Thread.list 
  p thr
end

puts Thread.current
puts "---"

Thread.kill(t1)
Thread.pass                          # pass execution to t2 now  
t3 = Thread.new do
  sleep 1000
  Thread.exit                        # exit the thread  
end
Thread.kill(t2)

sleep 1

for thr in Thread.list 
  p thr
end

# now exit the main thread (killing any others)  
Thread.exit
