local joinModule = require(script.Parent.join)

local function flatten(p0)
	-- upvalues: joinModule (ref), flatten (ref)
	local var2 = type(p0)
	assert(var2 == "table", "expected a table for first argument, got " .. var2)
	local t = {}
	
	for i, v in pairs(p0) do
		if type(v) == "table" then
			t = joinModule(flatten(v), t)
		else
			t[i] = v
		end
	end
	return t
end

return flatten