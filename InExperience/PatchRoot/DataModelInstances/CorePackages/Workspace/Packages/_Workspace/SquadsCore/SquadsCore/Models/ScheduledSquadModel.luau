local TModule = require(script:FindFirstAncestor("SquadsCore").Parent.t)
local ScheduledSquadModelModule = {}

function ScheduledSquadModelModule.new(p1) --[[ Line: 8 ]]
	-- upvalues: ScheduledSquadModelModule (copy)
	assert(ScheduledSquadModelModule.isValid(p1))
	ScheduledSquadModelModule.__index = ScheduledSquadModelModule
	setmetatable(p1, ScheduledSquadModelModule)
	
	return p1
end

function ScheduledSquadModelModule.mock(p1) --[[ Line: 20 ]]
	-- upvalues: ScheduledSquadModelModule (copy)
	local P1 = p1 or {}
	
	return (ScheduledSquadModelModule.new({
		createdAtTime = P1.createdAtTime or "2025-07-02T18:00:00Z",
		initiatorId = P1.initiatorId or 54321,
		parentChannelId = P1.parentChannelId or "23456",
		scheduledGroupUpId = P1.scheduledGroupUpId or 12345,
		startTime = P1.startTime or "2500-07-02T18:00:00Z",
		subscribers = P1.subscribers or { { userId = 12345 } },
		title = P1.title or "Cool Test Scheduled Party",
		updatedAtTime = P1.updatedAtTime or "2025-07-02T18:00:00Z"
	}))
end

function ScheduledSquadModelModule.format(p1) --[[ Line: 37 ]]
	-- upvalues: ScheduledSquadModelModule (copy)
	return (ScheduledSquadModelModule.new({
		createdAtTime = p1.scheduledGroupUp.createdAtTime,
		initiatorId = p1.scheduledGroupUp.initiatorId,
		parentChannelId = p1.scheduledGroupUp.parentChannelId,
		scheduledGroupUpId = p1.scheduledGroupUp.scheduledGroupUpId,
		startTime = p1.scheduledGroupUp.startTime,
		subscribers = p1.scheduledGroupUp.subscribers,
		title = p1.scheduledGroupUp.title,
		updatedAtTime = p1.scheduledGroupUp.updatedAtTime
	}))
end

ScheduledSquadModelModule.isValid = TModule.strictInterface({
	createdAtTime = TModule.string,
	initiatorId = TModule.number,
	parentChannelId = TModule.string,
	scheduledGroupUpId = TModule.number,
	startTime = TModule.string,
	subscribers = TModule.array(TModule.strictInterface({ userId = TModule.number })),
	title = TModule.string,
	updatedAtTime = TModule.string
})

return ScheduledSquadModelModule