local parent = script.Parent
local promiseModule = require(parent.Parent.Promise)
local callProtocolConstantsModule = require(parent.CallProtocolConstants)
local _ = require(parent.CallProtocolTypes)
local messageBusService = game:GetService("MessageBusService")
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	return setmetatable({}, t)
end

function t.initCall(_, p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	messageBusService:Publish(callProtocolConstantsModule.MESSAGE_INIT_CALL, {
		callerId = p1,
		calleeId = p2,
		callerCombinedName = p3,
		calleeCombinedName = p4,
		muted = p5,
		camEnabled = p6,
		callerUniqueIdentifier = p7,
		tag = p8 or ""
	})
end

function t.answerCall(_, p1)
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	messageBusService:Publish(callProtocolConstantsModule.MESSAGE_ANSWER_CALL, { callId = p1 })
end

function t.answerSuccessCall(_, p1)
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	messageBusService:Publish(callProtocolConstantsModule.MESSAGE_ANSWER_SUCCESS_CALL, { callId = p1 })
end

function t.rejectCall(_, p1)
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	messageBusService:Publish(callProtocolConstantsModule.MESSAGE_REJECT_CALL, { callId = p1 })
end

function t.cancelCall(_, p1)
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	messageBusService:Publish(callProtocolConstantsModule.MESSAGE_CANCEL_CALL, { callId = p1 })
end

function t.teleportSuccessCall(_, p1)
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	messageBusService:Publish(callProtocolConstantsModule.MESSAGE_TELEPORT_SUCCESS_CALL, { callId = p1 })
end

function t.finishCall(_, p1)
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	messageBusService:Publish(callProtocolConstantsModule.MESSAGE_FINISH_CALL, { callId = p1 })
end

function t.getCallState(_)
	-- upvalues: promiseModule (ref), messageBusService (ref), callProtocolConstantsModule (ref)
	return promiseModule.new(function(p1, _)
		-- upvalues: messageBusService (copy), callProtocolConstantsModule (copy)
		messageBusService:MakeRequest(callProtocolConstantsModule.NAME, callProtocolConstantsModule.METHOD_GET_CALL_STATE, {}, function(p2)
			-- upvalues: p1 (ref)
			p1(p2)
		end, {})
	end)
end

function t.updateMicAndCamState(_, p1, p2)
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	local t = {}
	
	if p1 ~= nil then
		t.muted = p1
	end
	if p2 ~= nil then
		t.camEnabled = p2
	end
	messageBusService:Publish(callProtocolConstantsModule.MESSAGE_UDPATE_MIC_AND_CAM_STATE, t)
end

function t.listenToHandleInitCall(_, p1)
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	return messageBusService:Subscribe(callProtocolConstantsModule.MESSAGE_HANDLE_INIT_CALL, p1, false, true)
end

function t.listenToHandleConnectingCall(_, p1)
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	return messageBusService:Subscribe(callProtocolConstantsModule.MESSAGE_HANDLE_CONNECTING_CALL, p1, false, true)
end

function t.listenToHandleTeleportingCall(_, p1)
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	return messageBusService:Subscribe(callProtocolConstantsModule.MESSAGE_HANDLE_TELEPORTING_CALL, p1, false, true)
end

function t.listenToHandleActiveCall(_, p1)
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	return messageBusService:Subscribe(callProtocolConstantsModule.MESSAGE_HANDLE_ACTIVE_CALL, p1, false, true)
end

function t.listenToHandleEndCall(_, p1)
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	return messageBusService:Subscribe(callProtocolConstantsModule.MESSAGE_HANDLE_END_CALL, p1, false, true)
end

function t.listenToHandleCallMessage(_, p1)
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	return messageBusService:Subscribe(callProtocolConstantsModule.MESSAGE_HANDLE_CALL_MESSAGE, p1, false, true)
end

function t.listenToHandleMicAndCamChanged(_, p1)
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	return messageBusService:Subscribe(callProtocolConstantsModule.MESSAGE_HANDLE_MIC_AND_CAM_CHANGED, p1, false, true)
end

function t.listenToHandleTransferCallTeleportLeave(_, p1)
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	return messageBusService:Subscribe(callProtocolConstantsModule.MESSAGE_HANDLE_TRANSFER_CALL_TELEPORT_LEAVE, p1, false, true)
end

function t.listenToHandleTransferCallTeleportJoin(_, p1)
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	return messageBusService:Subscribe(callProtocolConstantsModule.MESSAGE_HANDLE_TRANSFER_CALL_TELEPORT_JOIN, p1, false, true)
end

t.default = t.new()

return t