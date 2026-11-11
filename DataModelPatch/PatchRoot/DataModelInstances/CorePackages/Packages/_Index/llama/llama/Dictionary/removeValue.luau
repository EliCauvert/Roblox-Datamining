local ToSetModule = require(script.Parent.Parent.List.toSet)

return function(List, ...)
	-- upvalues: ToSetModule (copy)
	local ValueType = type(List)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local SetModule = ToSetModule({ ... })
	local t = {}
	
	for i, value in pairs(List) do
		if not SetModule[value] then
			t[i] = value
		end
	end
	return t
end