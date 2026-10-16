local JoinModule = require(script.Parent.join)

local function flatMap(List, Callback) --[[ Line: 4 ]]
	-- upvalues: JoinModule (copy), flatMap (copy)
	local ValueType = type(List)
	assert(ValueType == "table", "expected a table for first argument, got " .. ValueType)
	local ValueType1 = type(Callback)
	assert(ValueType1 == "function", "expected a function for second argument, got " .. ValueType1)
	local t = {}
	
	for i, value in pairs(List) do
		if type(value) == "table" then
			t = JoinModule(flatMap(value, Callback), t)
		else
			local CallbackResult2
			t[CallbackResult2 or i], CallbackResult2 = Callback(value, i)
		end
	end
	return t
end

return flatMap