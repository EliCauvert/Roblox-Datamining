local tModule = require(script:FindFirstAncestor("RoduxSquads").Parent.t)
local t = {}

function t.new(p0) --[[ line: 8 ]]
	-- upvalues: t (ref)
	assert(t.isValid(p0))
	t.__index = t
	setmetatable(p0, t)
	
	return p0
end

function t.mock(p1) --[[ line: 20 ]]
	-- upvalues: t (ref)
	p1 = p1 or {}
	
	return t.new({
		channelId = p1.channelId or "23456",
		members = p1.members or { "12345" }
	})
end

function t.format(p2) --[[ line: 31 ]]
	-- upvalues: t (ref)
	return t.new({ channelId = p2.channelId, members = p2.members })
end

t.isValid = tModule.strictInterface({
	channelId = tModule.string,
	members = tModule.array(tModule.string)
})

return t