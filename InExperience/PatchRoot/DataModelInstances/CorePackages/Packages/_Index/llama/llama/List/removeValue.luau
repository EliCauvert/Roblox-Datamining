local ToSetModule = require(script.Parent.Parent.List.toSet)

return function(p1, ...) --[[ Line: 4 | Named "removeValue" ]]
	-- upvalues: ToSetModule (copy)
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local SetModule = ToSetModule({ ... })
	local t = {}
	local Count = 1
	
	for i = 1, #p1 do
		if not SetModule[p1[i]] then
			t[Count] = p1[i]
			Count += 1
		end
	end
	return t
end