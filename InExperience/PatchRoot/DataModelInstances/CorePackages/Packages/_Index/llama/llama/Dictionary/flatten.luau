local JoinModule = require(script.Parent.join)

local function flatten(List) --[[ Line: 4 ]]
	-- upvalues: JoinModule (copy), flatten (copy)
	local ValueType = type(List)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local t = {}
	
	for i, value in pairs(List) do
		if type(value) == "table" then
			t = JoinModule(flatten(value), t)
		else
			t[i] = value
		end
	end
	return t
end

return flatten