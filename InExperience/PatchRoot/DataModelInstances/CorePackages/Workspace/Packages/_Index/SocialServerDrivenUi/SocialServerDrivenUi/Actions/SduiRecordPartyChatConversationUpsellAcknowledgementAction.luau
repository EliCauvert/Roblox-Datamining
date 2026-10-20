local SocialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local Parent = SocialServerDrivenUi.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType
local RecordModalSequenceResponseFunction = require(Parent.AppChatNetworking).http.RecordModalSequenceResponse
local GetSduiApiStoreFunction = require(Parent.SduiSharedUtilities).getSduiApiStore
local RecordedModalActionsModule = require(SocialServerDrivenUi.Common.recordedModalActions)

local function _(p1)
	return if typeof(p1) == "string" and p1 ~= "" then p1 else nil
end

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), RecordedModalActionsModule (copy), RecordModalSequenceResponseFunction (copy), GetSduiApiStoreFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.RecordPartyChatConversationUpsellAcknowledgement
		}, p2.appPage)
		
		return
	end
	local ModalAction = ActionParams.modalAction
	local RecordedModalAction = RecordedModalActionsModule.toRecordedModalAction(ModalAction)
	
	if RecordedModalAction == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			propName = "modalAction",
			name = SduiActionType.RecordPartyChatConversationUpsellAcknowledgement,
			message = `Invalid or missing modalAction: {tostring(ModalAction)}`
		}, p2.appPage)
		
		return
	end
	local ModalSequence = ActionParams.modalSequence
	local ModalSequence1 = if typeof(ModalSequence) == "string" and ModalSequence ~= "" then ModalSequence else nil
	
	if ModalSequence1 == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: modalSequence",
			propName = "modalSequence",
			name = SduiActionType.RecordPartyChatConversationUpsellAcknowledgement
		}, p2.appPage)
		
		return
	end
	local ModalVariant = ActionParams.modalVariant
	local ModalVariant1 = if typeof(ModalVariant) == "string" and ModalVariant ~= "" then ModalVariant else nil
	local ConversationId = ActionParams.conversationId
	local ConversationId1 = if typeof(ConversationId) == "string" and ConversationId ~= "" then ConversationId else nil
	local FriendId = ActionParams.friendId
	local FriendId1 = if typeof(FriendId) == "string" and FriendId ~= "" then FriendId else nil
	
	if ConversationId1 == nil and FriendId1 == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: one of conversationId or friendId is required",
			propName = "conversationId",
			name = SduiActionType.RecordPartyChatConversationUpsellAcknowledgement
		}, p2.appPage)
		
		return
	end
	RecordModalSequenceResponseFunction(nil, {
		actionType = RecordedModalAction,
		modalSequence = ModalSequence1,
		modalVariant = ModalVariant1,
		conversationId = ConversationId1,
		friendId = if ConversationId1 == nil then FriendId1 else nil
	}):catch(function(Err)
		-- upvalues: p2 (copy), SduiErrorType (upval), SduiActionType (upval)
		p2.dependencies.logger.reportError(SduiErrorType.ActionNetworkRequestFailed, {
			name = SduiActionType.RecordPartyChatConversationUpsellAcknowledgement,
			message = `RecordModalSequenceResponse failed: {tostring(Err)}`
		}, p2.appPage)
	end)
	
	if ModalAction == RecordedModalActionsModule.ModalAction.Close and p2.configKey ~= nil then
		local ClearConfigEntriesFunction: (any) -> () = GetSduiApiStoreFunction().clearConfigEntries
		
		if ClearConfigEntriesFunction then
			ClearConfigEntriesFunction(p2.configKey)
		end
	end
end