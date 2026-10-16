local ToSetModule = require(script.Parent.toSet)

return function(p1, ...) --[[ Line: 4 | Named "removeIndex" ]]
	-- upvalues: ToSetModule (copy)
	local ValueType = type(p1)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local t = {}
	local SetModule = ToSetModule({ ... })
	local Count = 1
	
	for i = 1, #p1 do
		if not SetModule[i] then
			t[Count] = p1[i]
			Count += 1
		end
	end
	return t
end