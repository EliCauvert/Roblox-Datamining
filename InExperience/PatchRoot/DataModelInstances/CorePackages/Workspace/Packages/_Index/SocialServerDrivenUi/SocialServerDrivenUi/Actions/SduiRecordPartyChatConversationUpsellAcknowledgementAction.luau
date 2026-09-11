local socialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local parent = socialServerDrivenUi.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType
local recordModalSequenceResponse = require(parent.AppChatNetworking).http.RecordModalSequenceResponse
local getSduiApiStore = require(parent.SduiSharedUtilities).getSduiApiStore
local recordedModalActionsModule = require(socialServerDrivenUi.Common.recordedModalActions)

local function _(p1)
	return if typeof(p1) == "string" and p1 ~= "" then p1 else nil
end

return function(p1, _, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), recordedModalActionsModule (ref), recordModalSequenceResponse (ref), getSduiApiStore (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.RecordPartyChatConversationUpsellAcknowledgement
		}, p2.appPage)
		
		return
	end
	local modalAction = var1.modalAction
	local var2 = recordedModalActionsModule.toRecordedModalAction(modalAction)
	
	if var2 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			propName = "modalAction",
			name = sduiActionType.RecordPartyChatConversationUpsellAcknowledgement,
			message = `Invalid or missing modalAction: {tostring(modalAction)}`
		}, p2.appPage)
		
		return
	end
	local modalSequence = var1.modalSequence
	local var3 = if typeof(modalSequence) == "string" and modalSequence ~= "" then modalSequence else nil
	
	if var3 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: modalSequence",
			propName = "modalSequence",
			name = sduiActionType.RecordPartyChatConversationUpsellAcknowledgement
		}, p2.appPage)
		
		return
	end
	local modalVariant = var1.modalVariant
	modalSequence = if typeof(modalVariant) == "string" and modalVariant ~= "" then modalVariant else nil
	local conversationId = var1.conversationId
	modalVariant = if typeof(conversationId) == "string" and conversationId ~= "" then conversationId else nil
	local friendId = var1.friendId
	conversationId = if typeof(friendId) == "string" and friendId ~= "" then friendId else nil
	
	if modalVariant == nil and conversationId == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParam: one of conversationId or friendId is required",
			propName = "conversationId",
			name = sduiActionType.RecordPartyChatConversationUpsellAcknowledgement
		}, p2.appPage)
		
		return
	end
	recordModalSequenceResponse(nil, {
		actionType = var2,
		modalSequence = var3,
		modalVariant = modalSequence,
		conversationId = modalVariant,
		friendId = if modalVariant ~= nil then conversationId else nil
	}):catch(function(p3)
		-- upvalues: p2 (ref), sduiErrorType (copy), sduiActionType (copy)
		p2.dependencies.logger.reportError(sduiErrorType.ActionNetworkRequestFailed, {
			name = sduiActionType.RecordPartyChatConversationUpsellAcknowledgement,
			message = `RecordModalSequenceResponse failed: {tostring(p3)}`
		}, p2.appPage)
	end)
	
	if modalAction == recordedModalActionsModule.ModalAction.Close and p2.configKey ~= nil then
		local clearConfigEntries = getSduiApiStore().clearConfigEntries
		
		if clearConfigEntries then
			clearConfigEntries(p2.configKey)
		end
	end
end