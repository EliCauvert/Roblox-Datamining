local joinModule = require(script.Parent.join)

local function flatten(p1)
	-- upvalues: joinModule (ref), flatten (ref)
	local var1 = type(p1)
	assert(var1 == "table", "expected a table for first argument, got " .. var2)
	local t = {}
	
	for i, v in pairs(p1) do
		if type(v) == "table" then
			t = joinModule(flatten(v), t)
		else
			t[i] = v
		end
	end
	return t
end

return flatten