-- -- function Entry(b)
-- body
-- 	count = count + 1
-- end
-- dofile("data.lua")
-- print("number of entries : " .. count)local count = 0


local auths = {}
-- print(auths)
function Entry( b ) --在使用dofile函数前  必须定义Entry（b）函数
	-- body
	-- print(b[1])
	for i, x in ipairs(b) do
		-- print(x)
		print(b[i])

	end	

	auths[b[1]] = true -- b 其实就是一个Entry对象
end
dofile("data.lua")
for name in pairs(auths) do
	print(name)
end	

local arr = {1,2,3,4;x = "ziyuan",["while"] = true}
print(arr["whle"])
arr[5] = 10
-- for int,index in ipairs(arr) do
-- 	print(index)
-- 	-- print(int)
-- end	
-- print(arr["x"])
-- io.write("a")
-- for something in pairs(io) do
-- 	print(io[something])
-- end	