#! /home/usuario/.rbenv/shims/ruby 

count = 0
threads = []

for i in 0..10 do
  threads[i] = Thread.new do
    sleep(rand(0.1))
    Thread.current["mycount"] = count
    count += 1
  end
end
for t in threads
 t.join 
 print t["mycount"] 
 print " , "
end
puts "count = #{count}"
