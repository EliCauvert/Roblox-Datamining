local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p0) --[[ line: 23 ]]
	if p0 == nil then
		error("cannot extract values from a nil value")
	end
	local var0 = typeof(p0)
	local list = nil
	
	if var0 == "table" then
		list = {}
		
		for i, v in pairs(p0) do
			table.insert(list, v)
		end
		return list
	elseif var0 == "string" then
		local var2 = p0:len()
		list = table.create(var2)
		
		for i = 1, var2 do
			list[i] = p0:sub(i, i)
		end
	end
	return list
end