function getData()
	-- body
	local status,value = coroutine.resume(producer)
	return value
end

function send(x)
	-- body
	coroutine.yield(x)
end

consumer = coroutine.create(function ()
	-- body
	while true do
		local x = getData()
		io.write("deal data : " .. x,"\n")
	end	
end)

producer = coroutine.create(function ()
	-- body
	while true do
		local x = io.read()
		send(x)
	end	
end)

coroutine.resume(producer)
coroutine.resume(consumer)