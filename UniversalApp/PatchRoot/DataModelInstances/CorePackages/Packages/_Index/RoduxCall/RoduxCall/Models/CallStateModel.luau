local RoduxCall = script:FindFirstAncestor("RoduxCall")
local Status = require(RoduxCall.Enums).Status
local TModule = require(RoduxCall.Parent.t)
local CallStateModelModule = {}

function CallStateModelModule.new(p1)
	-- upvalues: CallStateModelModule (copy)
	assert(CallStateModelModule.isValid(p1))
	CallStateModelModule.__index = CallStateModelModule
	setmetatable(p1, CallStateModelModule)
	
	return p1
end

function CallStateModelModule.mock(p1)
	-- upvalues: CallStateModelModule (copy), Status (copy)
	local P1 = p1 or {}
	
	return (CallStateModelModule.new({
		status = P1.status or Status.Active,
		callerId = P1.callerId or 123,
		calleeId = P1.calleeId or 456,
		placeId = P1.placeId or 789,
		reservedServerAccessCode = P1.reservedServerAccessCode or nil,
		callId = P1.callId or nil,
		callerCombinedName = P1.callerCombinedName or nil,
		calleeCombinedName = P1.calleeCombinedName or nil,
		instanceId = P1.instanceId or nil,
		createdUtc = P1.createdUtc or 0,
		activeUtc = P1.activeUtc or 0
	}))
end

function CallStateModelModule.format(p1)
	-- upvalues: CallStateModelModule (copy)
	return (CallStateModelModule.new({
		status = p1.status,
		callerId = p1.callerId,
		calleeId = p1.calleeId,
		placeId = p1.placeId,
		reservedServerAccessCode = p1.reservedServerAccessCode,
		callId = p1.callId,
		callerCombinedName = p1.callerCombinedName,
		calleeCombinedName = p1.calleeCombinedName,
		instanceId = p1.instanceId,
		createdUtc = p1.createdUtc,
		activeUtc = p1.activeUtc
	}))
end

CallStateModelModule.isValid = TModule.strictInterface({
	status = TModule.string,
	callerId = TModule.optional(TModule.number),
	calleeId = TModule.optional(TModule.number),
	placeId = TModule.optional(TModule.number),
	reservedServerAccessCode = TModule.optional(TModule.string),
	callId = TModule.optional(TModule.string),
	callerCombinedName = TModule.optional(TModule.string),
	calleeCombinedName = TModule.optional(TModule.string),
	instanceId = TModule.optional(TModule.string),
	createdUtc = TModule.optional(TModule.number),
	activeUtc = TModule.optional(TModule.number)
})

return CallStateModelModule