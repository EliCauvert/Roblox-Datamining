local toSetModule = require(script.Parent.Parent.List.toSet)

return function(p1, ...)
	-- upvalues: toSetModule (ref)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local var2 = toSetModule({ ... })
	local t = {}
	
	for i, v in pairs(p1) do
		if not var2[v] then
			t[i] = v
		end
	end
	return t
end