local tModule = require(script:FindFirstAncestor("SquadsCore").Parent.t)
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

function t.format(p1)
	-- upvalues: t (ref)
	return t.new({
		createdAtTime = p1.scheduledGroupUp.createdAtTime,
		initiatorId = p1.scheduledGroupUp.initiatorId,
		parentChannelId = p1.scheduledGroupUp.parentChannelId,
		scheduledGroupUpId = p1.scheduledGroupUp.scheduledGroupUpId,
		startTime = p1.scheduledGroupUp.startTime,
		subscribers = p1.scheduledGroupUp.subscribers,
		title = p1.scheduledGroupUp.title,
		updatedAtTime = p1.scheduledGroupUp.updatedAtTime
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