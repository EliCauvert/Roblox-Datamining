local toSetModule = require(script.Parent.Parent.List.toSet)

return function(p1, ...)
	-- upvalues: toSetModule (ref)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local var2 = toSetModule({ ... })
	local t = {}
	local var3 = 1
	
	for i = 1, #p1 do
		if not var2[p1[i]] then
			t[var3] = p1[i]
			var3 += 1
		end
	end
	return t
end