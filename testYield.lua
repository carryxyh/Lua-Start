-- p = coroutine.create(function ()
-- 	-- body
-- 	print(coroutine.status(p))
-- 	print("what happened")
-- 	local data = io.read()
-- 	print(coroutine.yield(data))
-- 	print("can go here ?")
-- end)

-- coroutine.resume(p)
-- print(coroutine.status(p))

function producer()
	-- body
	return coroutine.create(function ()
		while true do
        	print("wait for input")
        	local x = io.read()      -- produce new value
			if type(x) == "string" then
				print("yield data is " .. x)
			else
				print("yield thread")
			end	
			coroutine.yield(x)
		end
	end)
end

print(coroutine.resume(producer()))