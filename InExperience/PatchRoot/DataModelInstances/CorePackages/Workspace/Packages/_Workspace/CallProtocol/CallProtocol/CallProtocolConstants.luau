local messageBusService = game:GetService("MessageBusService")

return {
	NAME = "Call",
	METHOD_GET_CALL_STATE = "getCallState",
	MESSAGE_INIT_CALL = messageBusService:GetMessageId("Call", "initCall"),
	MESSAGE_ANSWER_CALL = messageBusService:GetMessageId("Call", "answerCall"),
	MESSAGE_ANSWER_SUCCESS_CALL = messageBusService:GetMessageId("Call", "answerSuccessCall"),
	MESSAGE_REJECT_CALL = messageBusService:GetMessageId("Call", "rejectCall"),
	MESSAGE_CANCEL_CALL = messageBusService:GetMessageId("Call", "cancelCall"),
	MESSAGE_TELEPORT_SUCCESS_CALL = messageBusService:GetMessageId("Call", "teleportSuccessCall"),
	MESSAGE_FINISH_CALL = messageBusService:GetMessageId("Call", "finishCall"),
	MESSAGE_UDPATE_MIC_AND_CAM_STATE = messageBusService:GetMessageId("Call", "updateMicAndCamState"),
	MESSAGE_HANDLE_INIT_CALL = messageBusService:GetMessageId("Call", "handleInitCall"),
	MESSAGE_HANDLE_CONNECTING_CALL = messageBusService:GetMessageId("Call", "handleConnectingCall"),
	MESSAGE_HANDLE_TELEPORTING_CALL = messageBusService:GetMessageId("Call", "handleTeleportingCall"),
	MESSAGE_HANDLE_ACTIVE_CALL = messageBusService:GetMessageId("Call", "handleActiveCall"),
	MESSAGE_HANDLE_END_CALL = messageBusService:GetMessageId("Call", "handleEndCall"),
	MESSAGE_HANDLE_CALL_MESSAGE = messageBusService:GetMessageId("Call", "handleCallMessage"),
	MESSAGE_HANDLE_MIC_AND_CAM_CHANGED = messageBusService:GetMessageId("Call", "handleMicAndCamChanged"),
	MESSAGE_HANDLE_TRANSFER_CALL_TELEPORT_LEAVE = messageBusService:GetMessageId("Call", "handleTransferCallTeleportLeave"),
	MESSAGE_HANDLE_TRANSFER_CALL_TELEPORT_JOIN = messageBusService:GetMessageId("Call", "handleTransferCallTeleportJoin")
}