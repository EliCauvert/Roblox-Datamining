local TModule = require(script:FindFirstAncestor("RoduxSquads").Parent.t)
local PartialSquadModelModule = {}

function PartialSquadModelModule.new(p1)
	-- upvalues: PartialSquadModelModule (copy)
	assert(PartialSquadModelModule.isValid(p1))
	PartialSquadModelModule.__index = PartialSquadModelModule
	setmetatable(p1, PartialSquadModelModule)
	
	return p1
end

function PartialSquadModelModule.mock(p1)
	-- upvalues: PartialSquadModelModule (copy)
	local P1 = p1 or {}
	
	return (PartialSquadModelModule.new({
		channelId = P1.channelId or "23456",
		members = P1.members or { "12345" }
	}))
end

function PartialSquadModelModule.format(p1)
	-- upvalues: PartialSquadModelModule (copy)
	return (PartialSquadModelModule.new({ channelId = p1.channelId, members = p1.members }))
end

PartialSquadModelModule.isValid = TModule.strictInterface({
	channelId = TModule.string,
	members = TModule.array(TModule.string)
})

return PartialSquadModelModule