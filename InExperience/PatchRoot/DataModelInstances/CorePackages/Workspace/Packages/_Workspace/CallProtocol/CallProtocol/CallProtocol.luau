local parent = script.Parent
local promiseModule = require(parent.Parent.Promise)
local callProtocolConstantsModule = require(parent.CallProtocolConstants)
local _ = require(parent.CallProtocolTypes)
local messageBusService = game:GetService("MessageBusService")
local t = {}
t.__index = t

function t.new() --[[ line: 35 ]]
	-- upvalues: t (ref)
	return setmetatable({}, t)
end

function t.initCall(_, p0, p1, p2, p3, p4, p5, p6, p7) --[[ line: 40 ]]
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	messageBusService:Publish(callProtocolConstantsModule.MESSAGE_INIT_CALL, {
		callerId = p0,
		calleeId = p1,
		callerCombinedName = p2,
		calleeCombinedName = p3,
		muted = p4,
		camEnabled = p5,
		callerUniqueIdentifier = p6,
		tag = p7 or ""
	})
end

function t.answerCall(_, p8) --[[ line: 64 ]]
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	messageBusService:Publish(callProtocolConstantsModule.MESSAGE_ANSWER_CALL, { callId = p8 })
end

function t.answerSuccessCall(_, p9) --[[ line: 73 ]]
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	messageBusService:Publish(callProtocolConstantsModule.MESSAGE_ANSWER_SUCCESS_CALL, { callId = p9 })
end

function t.rejectCall(_, p10) --[[ line: 82 ]]
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	messageBusService:Publish(callProtocolConstantsModule.MESSAGE_REJECT_CALL, { callId = p10 })
end

function t.cancelCall(_, p11) --[[ line: 91 ]]
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	messageBusService:Publish(callProtocolConstantsModule.MESSAGE_CANCEL_CALL, { callId = p11 })
end

function t.teleportSuccessCall(_, p12) --[[ line: 100 ]]
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	messageBusService:Publish(callProtocolConstantsModule.MESSAGE_TELEPORT_SUCCESS_CALL, { callId = p12 })
end

function t.finishCall(_, p13) --[[ line: 109 ]]
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	messageBusService:Publish(callProtocolConstantsModule.MESSAGE_FINISH_CALL, { callId = p13 })
end

function t.getCallState(_) --[[ line: 118 ]]
	-- upvalues: promiseModule (ref), messageBusService (ref), callProtocolConstantsModule (ref)
	return promiseModule.new(function(p14, _) --[[ line: 119 ]]
		-- upvalues: messageBusService (copy), callProtocolConstantsModule (copy)
		messageBusService:MakeRequest(callProtocolConstantsModule.NAME, callProtocolConstantsModule.METHOD_GET_CALL_STATE, {}, function(p15) --[[ line: 124 ]]
			-- upvalues: p14 (ref)
			p14(p15)
		end, {})
	end)
end

function t.updateMicAndCamState(_, p16, p17) --[[ line: 133 ]]
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	local t = {}
	
	if p16 ~= nil then
		t.muted = p16
	end
	if p17 ~= nil then
		t.camEnabled = p17
	end
	messageBusService:Publish(callProtocolConstantsModule.MESSAGE_UDPATE_MIC_AND_CAM_STATE, t)
end

function t.listenToHandleInitCall(_, p18) --[[ line: 145 ]]
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	return messageBusService:Subscribe(callProtocolConstantsModule.MESSAGE_HANDLE_INIT_CALL, p18, false, true)
end

function t.listenToHandleConnectingCall(_, p19) --[[ line: 149 ]]
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	return messageBusService:Subscribe(callProtocolConstantsModule.MESSAGE_HANDLE_CONNECTING_CALL, p19, false, true)
end

function t.listenToHandleTeleportingCall(_, p20) --[[ line: 153 ]]
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	return messageBusService:Subscribe(callProtocolConstantsModule.MESSAGE_HANDLE_TELEPORTING_CALL, p20, false, true)
end

function t.listenToHandleActiveCall(_, p21) --[[ line: 157 ]]
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	return messageBusService:Subscribe(callProtocolConstantsModule.MESSAGE_HANDLE_ACTIVE_CALL, p21, false, true)
end

function t.listenToHandleEndCall(_, p22) --[[ line: 161 ]]
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	return messageBusService:Subscribe(callProtocolConstantsModule.MESSAGE_HANDLE_END_CALL, p22, false, true)
end

function t.listenToHandleCallMessage(_, p23) --[[ line: 165 ]]
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	return messageBusService:Subscribe(callProtocolConstantsModule.MESSAGE_HANDLE_CALL_MESSAGE, p23, false, true)
end

function t.listenToHandleMicAndCamChanged(_, p24) --[[ line: 169 ]]
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	return messageBusService:Subscribe(callProtocolConstantsModule.MESSAGE_HANDLE_MIC_AND_CAM_CHANGED, p24, false, true)
end

function t.listenToHandleTransferCallTeleportLeave(_, p25) --[[ line: 173 ]]
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	return messageBusService:Subscribe(callProtocolConstantsModule.MESSAGE_HANDLE_TRANSFER_CALL_TELEPORT_LEAVE, p25, false, true)
end

function t.listenToHandleTransferCallTeleportJoin(_, p26) --[[ line: 177 ]]
	-- upvalues: messageBusService (ref), callProtocolConstantsModule (ref)
	return messageBusService:Subscribe(callProtocolConstantsModule.MESSAGE_HANDLE_TRANSFER_CALL_TELEPORT_JOIN, p26, false, true)
end

t.default = t.new()

return t