local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local name = require(appChat.Logger):new(script.Name)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local reactModule = require(parent.React)
local conversationOverlay = appChatNetworkingModule.Constants.ConversationOverlay
local modalSequence = appChatNetworkingModule.Constants.ModalSequence
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useShouldShowConversationOverlayModule = require(appChat.Hooks.useShouldShowConversationOverlay)
local useRecordModalSeenWithDelayModule = require(appChat.Hooks.useRecordModalSeenWithDelay)
local modalConfigurationModule = require(appChat.Models.ModalConfiguration)
local trustedConnectionsUpsellContainerModule = require(appChat.Components.TrustedConnectionsUpsell.TrustedConnectionsUpsellContainer)
local useRecordModalSequenceResponseForConversationModule = require(appChat.Hooks.useRecordModalSequenceResponseForConversation)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local dismissedChatModalModule = require(appChat.Conversations.Actions.DismissedChatModal)
local fIntAppChatModalSeenImpressionDelayMsModule = require(appChat.Flags.FIntAppChatModalSeenImpressionDelayMs)
local fFlagAppChatEnableDoubleOptIn = require(parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local t = {
	[conversationOverlay.TrustedConnectionCreated] = trustedConnectionsUpsellContainerModule,
	[conversationOverlay.AddTrustedConnectionU18] = if fFlagAppChatEnableDoubleOptIn then trustedConnectionsUpsellContainerModule else nil,
	[conversationOverlay.TrustedConnectionRequestU18] = if fFlagAppChatEnableDoubleOptIn then trustedConnectionsUpsellContainerModule else nil
}

return reactModule.memo(function(p0) --[[ line: 49 ]]
	-- upvalues: useSelector (ref), getDeepValue2Module (ref), modalConfigurationModule (ref), reactModule (ref), t (ref), useShouldShowConversationOverlayModule (ref), useRecordModalSequenceResponseForConversationModule (ref), useDispatch (ref), useRecordModalSeenWithDelayModule (ref), modalSequence (ref), fIntAppChatModalSeenImpressionDelayMsModule (ref), appChatNetworkingModule (ref), name (ref), dismissedChatModalModule (ref)
	local var13 = useSelector(function(p1) --[[ line: 51 ]]
		-- upvalues: getDeepValue2Module (copy), p0 (ref), modalConfigurationModule (copy)
		return getDeepValue2Module(p1, `ChatAppReducer.Modals.conversationOverlays.{p0.conversationId}`) or modalConfigurationModule.default
	end)
	var13 = reactModule.useMemo(function() --[[ line: 57 ]]
		-- upvalues: var13 (write)
		return var13
	end, { p0.conversationId })
	local modalLayout = var13.modal_layout
	local modalVariant = t[var13.modal_variant]
	local var14 = useShouldShowConversationOverlayModule(p0.conversationId) and modalVariant ~= nil
	local var15 = useRecordModalSequenceResponseForConversationModule(p0.conversationId)
	local var16 = useDispatch()
	useRecordModalSeenWithDelayModule({
		modalSequence = modalSequence.ConversationOverlay,
		modalId = modalLayout.id,
		modalVariant = var13.modal_variant,
		actionToRecord = modalLayout.seen_record_action,
		delayMs = fIntAppChatModalSeenImpressionDelayMsModule,
		canRecordAction = var14,
		conversationId = p0.conversationId
	})
	reactModule.useEffect(function() --[[ line: 76 ]]
		-- upvalues: var14 (ref), p0 (ref)
		if not var14 then
			p0.dismissModal()
		end
	end, { var14 })
	
	return if var14 then reactModule.createElement(modalVariant, {
		conversationId = p0.conversationId,
		modalVariant = var13.modal_variant,
		dismissModal = reactModule.useCallback(function() --[[ line: 83 ]]
			-- upvalues: var15 (ref), var13 (write), appChatNetworkingModule (copy), name (copy), p0 (ref), var16 (ref), dismissedChatModalModule (copy)
			var15(var13.modal_layout.dismissed_record_action, appChatNetworkingModule.Constants.ModalSequence.ConversationOverlay, var13.modal_layout.id, var13.modal_variant):catch(function(p2) --[[ line: 89 ]]
				-- upvalues: name (copy), var13 (copy)
				name:warning(`Error in ConversationOverlayContainer {var13.modal_layout.id} -> RecordModalSequenceResponse: {tostring(p2)}`)
			end)
			p0.dismissModal()
			var16(dismissedChatModalModule(appChatNetworkingModule.Constants.ModalSequence.ConversationOverlay, p0.conversationId))
		end, {
			p0.conversationId, var13.modal_layout.dismissed_record_action,
			var13.modal_layout.id, var13.modal_variant, var15, var16, p0.dismissModal
		})
	}) else nil
end)