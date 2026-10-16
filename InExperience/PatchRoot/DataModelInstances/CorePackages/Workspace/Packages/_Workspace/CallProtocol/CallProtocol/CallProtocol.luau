local Parent = script.Parent
local PromiseModule = require(Parent.Parent.Promise)
local CallProtocolConstantsModule = require(Parent.CallProtocolConstants)
local _ = require(Parent.CallProtocolTypes)
local MessageBusService = game:GetService("MessageBusService")
local CallProtocolModule = {}
CallProtocolModule.__index = CallProtocolModule

function CallProtocolModule.new() --[[ Line: 35 ]]
	-- upvalues: CallProtocolModule (copy)
	return (setmetatable({}, CallProtocolModule))
end

function CallProtocolModule:initCall(CallerId, CalleeId, CallerCombinedName, CalleeCombinedName, Muted, CamEnabled, CallerUniqueIdentifier, p1) --[[ Line: 40 ]]
	-- upvalues: MessageBusService (copy), CallProtocolConstantsModule (copy)
	MessageBusService:Publish(CallProtocolConstantsModule.MESSAGE_INIT_CALL, {
		callerId = CallerId,
		calleeId = CalleeId,
		callerCombinedName = CallerCombinedName,
		calleeCombinedName = CalleeCombinedName,
		muted = Muted,
		camEnabled = CamEnabled,
		callerUniqueIdentifier = CallerUniqueIdentifier,
		tag = p1 or ""
	})
end

function CallProtocolModule:answerCall(CallId) --[[ Line: 64 ]]
	-- upvalues: MessageBusService (copy), CallProtocolConstantsModule (copy)
	MessageBusService:Publish(CallProtocolConstantsModule.MESSAGE_ANSWER_CALL, { callId = CallId })
end

function CallProtocolModule:answerSuccessCall(CallId) --[[ Line: 73 ]]
	-- upvalues: MessageBusService (copy), CallProtocolConstantsModule (copy)
	MessageBusService:Publish(CallProtocolConstantsModule.MESSAGE_ANSWER_SUCCESS_CALL, { callId = CallId })
end

function CallProtocolModule:rejectCall(CallId) --[[ Line: 82 ]]
	-- upvalues: MessageBusService (copy), CallProtocolConstantsModule (copy)
	MessageBusService:Publish(CallProtocolConstantsModule.MESSAGE_REJECT_CALL, { callId = CallId })
end

function CallProtocolModule:cancelCall(CallId) --[[ Line: 91 ]]
	-- upvalues: MessageBusService (copy), CallProtocolConstantsModule (copy)
	MessageBusService:Publish(CallProtocolConstantsModule.MESSAGE_CANCEL_CALL, { callId = CallId })
end

function CallProtocolModule:teleportSuccessCall(CallId) --[[ Line: 100 ]]
	-- upvalues: MessageBusService (copy), CallProtocolConstantsModule (copy)
	MessageBusService:Publish(CallProtocolConstantsModule.MESSAGE_TELEPORT_SUCCESS_CALL, { callId = CallId })
end

function CallProtocolModule:finishCall(CallId) --[[ Line: 109 ]]
	-- upvalues: MessageBusService (copy), CallProtocolConstantsModule (copy)
	MessageBusService:Publish(CallProtocolConstantsModule.MESSAGE_FINISH_CALL, { callId = CallId })
end

function CallProtocolModule:getCallState() --[[ Line: 118 ]]
	-- upvalues: PromiseModule (copy), MessageBusService (copy), CallProtocolConstantsModule (copy)
	return (PromiseModule.new(function(Callback, _) --[[ Line: 119 ]]
		-- upvalues: MessageBusService (upval), CallProtocolConstantsModule (upval)
		MessageBusService:MakeRequest(CallProtocolConstantsModule.NAME, CallProtocolConstantsModule.METHOD_GET_CALL_STATE, {}, function(p1) --[[ Line: 124 ]]
			-- upvalues: Callback (copy)
			Callback(p1)
		end, {})
	end))
end

function CallProtocolModule:updateMicAndCamState(Muted, CamEnabled) --[[ Line: 133 ]]
	-- upvalues: MessageBusService (copy), CallProtocolConstantsModule (copy)
	local t = {}
	
	if Muted ~= nil then
		t.muted = Muted
	end
	if CamEnabled ~= nil then
		t.camEnabled = CamEnabled
	end
	MessageBusService:Publish(CallProtocolConstantsModule.MESSAGE_UDPATE_MIC_AND_CAM_STATE, t)
end

function CallProtocolModule:listenToHandleInitCall(Callback) --[[ Line: 145 ]]
	-- upvalues: MessageBusService (copy), CallProtocolConstantsModule (copy)
	return MessageBusService:Subscribe(CallProtocolConstantsModule.MESSAGE_HANDLE_INIT_CALL, Callback, false, true)
end

function CallProtocolModule:listenToHandleConnectingCall(Callback) --[[ Line: 149 ]]
	-- upvalues: MessageBusService (copy), CallProtocolConstantsModule (copy)
	return MessageBusService:Subscribe(CallProtocolConstantsModule.MESSAGE_HANDLE_CONNECTING_CALL, Callback, false, true)
end

function CallProtocolModule:listenToHandleTeleportingCall(Callback) --[[ Line: 153 ]]
	-- upvalues: MessageBusService (copy), CallProtocolConstantsModule (copy)
	return MessageBusService:Subscribe(CallProtocolConstantsModule.MESSAGE_HANDLE_TELEPORTING_CALL, Callback, false, true)
end

function CallProtocolModule:listenToHandleActiveCall(Callback) --[[ Line: 157 ]]
	-- upvalues: MessageBusService (copy), CallProtocolConstantsModule (copy)
	return MessageBusService:Subscribe(CallProtocolConstantsModule.MESSAGE_HANDLE_ACTIVE_CALL, Callback, false, true)
end

function CallProtocolModule:listenToHandleEndCall(Callback) --[[ Line: 161 ]]
	-- upvalues: MessageBusService (copy), CallProtocolConstantsModule (copy)
	return MessageBusService:Subscribe(CallProtocolConstantsModule.MESSAGE_HANDLE_END_CALL, Callback, false, true)
end

function CallProtocolModule:listenToHandleCallMessage(Callback) --[[ Line: 165 ]]
	-- upvalues: MessageBusService (copy), CallProtocolConstantsModule (copy)
	return MessageBusService:Subscribe(CallProtocolConstantsModule.MESSAGE_HANDLE_CALL_MESSAGE, Callback, false, true)
end

function CallProtocolModule:listenToHandleMicAndCamChanged(Callback) --[[ Line: 169 ]]
	-- upvalues: MessageBusService (copy), CallProtocolConstantsModule (copy)
	return MessageBusService:Subscribe(CallProtocolConstantsModule.MESSAGE_HANDLE_MIC_AND_CAM_CHANGED, Callback, false, true)
end

function CallProtocolModule:listenToHandleTransferCallTeleportLeave(Callback) --[[ Line: 173 ]]
	-- upvalues: MessageBusService (copy), CallProtocolConstantsModule (copy)
	return MessageBusService:Subscribe(CallProtocolConstantsModule.MESSAGE_HANDLE_TRANSFER_CALL_TELEPORT_LEAVE, Callback, false, true)
end

function CallProtocolModule:listenToHandleTransferCallTeleportJoin(Callback) --[[ Line: 177 ]]
	-- upvalues: MessageBusService (copy), CallProtocolConstantsModule (copy)
	return MessageBusService:Subscribe(CallProtocolConstantsModule.MESSAGE_HANDLE_TRANSFER_CALL_TELEPORT_JOIN, Callback, false, true)
end

CallProtocolModule.default = CallProtocolModule.new()

return CallProtocolModule