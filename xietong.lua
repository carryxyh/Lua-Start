function test()
	-- body
	return coroutine.create(function ()
		-- body
		local x = 1
		print("one " .. x)
		send(1)
	end)
end

function send(x)
	-- body
	print("two " .. x)
	coroutine.yield(x)
	print(x)
end

p = test()
coroutine.resume(p)
print(coroutine.status(p))
coroutine.resume(p)