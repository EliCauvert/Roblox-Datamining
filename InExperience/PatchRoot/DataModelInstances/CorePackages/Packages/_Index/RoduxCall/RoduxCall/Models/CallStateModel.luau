local roduxCall = script:FindFirstAncestor("RoduxCall")
local status = require(roduxCall.Enums).Status
local tModule = require(roduxCall.Parent.t)
local t = {}

function t.new(p0)
	-- upvalues: t (ref)
	assert(t.isValid(p0))
	t.__index = t
	setmetatable(p0, t)
	
	return p0
end

function t.mock(p1)
	-- upvalues: t (ref), status (ref)
	p1 = p1 or {}
	
	return t.new({
		status = p1.status or status.Active,
		callerId = p1.callerId or 123,
		calleeId = p1.calleeId or 456,
		placeId = p1.placeId or 789,
		reservedServerAccessCode = p1.reservedServerAccessCode or nil,
		callId = p1.callId or nil,
		callerCombinedName = p1.callerCombinedName or nil,
		calleeCombinedName = p1.calleeCombinedName or nil,
		instanceId = p1.instanceId or nil,
		createdUtc = p1.createdUtc or 0,
		activeUtc = p1.activeUtc or 0
	})
end

function t.format(p2)
	-- upvalues: t (ref)
	return t.new({
		status = p2.status,
		callerId = p2.callerId,
		calleeId = p2.calleeId,
		placeId = p2.placeId,
		reservedServerAccessCode = p2.reservedServerAccessCode,
		callId = p2.callId,
		callerCombinedName = p2.callerCombinedName,
		calleeCombinedName = p2.calleeCombinedName,
		instanceId = p2.instanceId,
		createdUtc = p2.createdUtc,
		activeUtc = p2.activeUtc
	})
end

t.isValid = tModule.strictInterface({
	status = tModule.string,
	callerId = tModule.optional(tModule.number),
	calleeId = tModule.optional(tModule.number),
	placeId = tModule.optional(tModule.number),
	reservedServerAccessCode = tModule.optional(tModule.string),
	callId = tModule.optional(tModule.string),
	callerCombinedName = tModule.optional(tModule.string),
	calleeCombinedName = tModule.optional(tModule.string),
	instanceId = tModule.optional(tModule.string),
	createdUtc = tModule.optional(tModule.number),
	activeUtc = tModule.optional(tModule.number)
})

return t