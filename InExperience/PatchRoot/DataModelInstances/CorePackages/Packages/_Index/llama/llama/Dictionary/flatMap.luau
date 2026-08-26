local joinModule = require(script.Parent.join)

local function flatMap(p1, p2)
	-- upvalues: joinModule (ref), flatMap (ref)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var2)
	local var2 = type(p2)
	assert(var2 == "function", "expected a function for second argument, got " .. var3)
	local t = {}
	
	for i, v in pairs(p1) do
		if type(v) == "table" then
			t = joinModule(flatMap(v, p2), t)
		else
			local var3, var4 = p2(v, i)
			t[var4 or i] = var3
		end
	end
	return t
end

return flatMap