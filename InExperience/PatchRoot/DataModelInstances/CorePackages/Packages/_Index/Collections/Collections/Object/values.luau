local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1)
	if p1 == nil then
		error("cannot extract values from a nil value")
	end
	local var1 = typeof(p1)
	local list = nil
	
	if var1 == "table" then
		list = {}
		
		for i, v in pairs(p1) do
			table.insert(list, v)
		end
		return list
	elseif var1 == "string" then
		local var2 = p1:len()
		list = table.create(var2)
		
		for i = 1, var2 do
			list[i] = p1:sub(i, i)
		end
	end
	return list
end