local tModule = require(script:FindFirstAncestor("CurrencyTransfers").Parent.t)
local t = {}

function t.new(p1)
	-- upvalues: t (ref)
	assert(t.isValid(p1))
	t.__index = t
	setmetatable(p1, t)
	
	return p1
end

function t.mock(p1)
	-- upvalues: t (ref)
	return t.new({ success = (p1 or {}).success or true })
end

function t.format(p1)
	-- upvalues: t (ref)
	return t.new({ success = p1.success })
end

t.isValid = tModule.strictInterface({ success = tModule.boolean })

return t