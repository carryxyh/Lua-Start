function getData(producer)
	-- body
	-- print(producer)
	local status,value = coroutine.resume(producer)
	print(value)
	return value
end

function send(x)
	-- body
	if type(x) == "string" then
		print("yield data is " .. x)
	else
		print("yield thread")
	end	
	coroutine.yield(x)
end

function producer()
	-- body
	return coroutine.create(function ()
		while true do
        	print("wait for input")
        	local x = io.read()      -- produce new value
			send(x)
		end
	end)
end

function filter(producer)
	return coroutine.create(function ()
		-- body
		local line = 1
		while true do

			print("filter start")

			local data = getData(producer)
			
			print("return producer thread and data is " .. data)
			
			data = string.format("%5d %s", line, data)
			send(data)
			line = line + 1
		end
	end)
end

function consumer(producer)
	-- body
	while true do
		print("one step")
		local data = getData(producer)
		print("return filter thread")
		-- print(data == "end")	-- 为啥type相等不能比较??
		io.write("write data : " .. data, "\n")
	end	
end

p = producer()	-- 这是p是一个function的引用，实际上就是生产者线程
f = filter(p)	-- 实际上是包装过的生产者

-- print(p) -- 48
-- print(f) -- 28

consumer(f)	-- 消费包装过后的生产者