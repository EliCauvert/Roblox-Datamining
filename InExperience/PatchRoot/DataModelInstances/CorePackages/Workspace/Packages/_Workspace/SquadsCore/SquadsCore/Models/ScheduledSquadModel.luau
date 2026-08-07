local tModule = require(script:FindFirstAncestor("SquadsCore").Parent.t)
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
		createdAtTime = p1.createdAtTime or "2025-07-02T18:00:00Z",
		initiatorId = p1.initiatorId or 54321,
		parentChannelId = p1.parentChannelId or "23456",
		scheduledGroupUpId = p1.scheduledGroupUpId or 12345,
		startTime = p1.startTime or "2500-07-02T18:00:00Z",
		subscribers = p1.subscribers or { { userId = 12345 } },
		title = p1.title or "Cool Test Scheduled Party",
		updatedAtTime = p1.updatedAtTime or "2025-07-02T18:00:00Z"
	})
end

function t.format(p2) --[[ line: 37 ]]
	-- upvalues: t (ref)
	return t.new({
		createdAtTime = p2.scheduledGroupUp.createdAtTime,
		initiatorId = p2.scheduledGroupUp.initiatorId,
		parentChannelId = p2.scheduledGroupUp.parentChannelId,
		scheduledGroupUpId = p2.scheduledGroupUp.scheduledGroupUpId,
		startTime = p2.scheduledGroupUp.startTime,
		subscribers = p2.scheduledGroupUp.subscribers,
		title = p2.scheduledGroupUp.title,
		updatedAtTime = p2.scheduledGroupUp.updatedAtTime
	})
end

t.isValid = tModule.strictInterface({
	createdAtTime = tModule.string,
	initiatorId = tModule.number,
	parentChannelId = tModule.string,
	scheduledGroupUpId = tModule.number,
	startTime = tModule.string,
	subscribers = tModule.array(tModule.strictInterface({ userId = tModule.number })),
	title = tModule.string,
	updatedAtTime = tModule.string
})

return t