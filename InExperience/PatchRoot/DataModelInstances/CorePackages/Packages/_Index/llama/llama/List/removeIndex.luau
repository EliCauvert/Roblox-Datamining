local toSetModule = require(script.Parent.toSet)

return function(p0, ...) --[[ line: 4 | named "removeIndex" ]]
	-- upvalues: toSetModule (ref)
	local var1 = type(p0)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local t = {}
	local var3 = toSetModule({ ... })
	local var4 = 1
	
	for i = 1, #p0 do
		if not var3[i] then
			t[var4] = p0[i]
			var4 += 1
		end
	end
	return t
end