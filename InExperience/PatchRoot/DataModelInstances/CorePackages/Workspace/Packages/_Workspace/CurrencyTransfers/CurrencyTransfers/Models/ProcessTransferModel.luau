local tModule = require(script:FindFirstAncestor("CurrencyTransfers").Parent.t)
local t = {}

function t.new(p0) --[[ line: 11 ]]
	-- upvalues: t (ref)
	assert(t.isValid(p0))
	t.__index = t
	setmetatable(p0, t)
	
	return p0
end

function t.mock(p1) --[[ line: 23 ]]
	-- upvalues: t (ref)
	return t.new({ success = (p1 or {}).success or true })
end

function t.format(p2) --[[ line: 33 ]]
	-- upvalues: t (ref)
	return t.new({ success = p2.success })
end

t.isValid = tModule.strictInterface({ success = tModule.boolean })

return t