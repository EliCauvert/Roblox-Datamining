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
local trustedFriendsUpsellContainerModule = require(appChat.Components.TrustedFriendsUpsell.TrustedFriendsUpsellContainer)
local useGetOneToOneFriendIdFromConversationIdModule = require(appChat.Hooks.useGetOneToOneFriendIdFromConversationId)
local useRecordModalSequenceResponseForConversationModule = require(appChat.Hooks.useRecordModalSequenceResponseForConversation)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local dismissedChatModalModule = require(appChat.Conversations.Actions.DismissedChatModal)
local fIntAppChatModalSeenImpressionDelayMsModule = require(appChat.Flags.FIntAppChatModalSeenImpressionDelayMs)
local fFlagAppChatEnableDoubleOptIn = require(parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local fFlagAppChatConsolidateTrustedFriendsModalModule = require(appChat.Flags.FFlagAppChatConsolidateTrustedFriendsModal)
local t = {
	[conversationOverlay.TrustedConnectionCreated] = trustedConnectionsUpsellContainerModule,
	[conversationOverlay.AddTrustedConnectionU18] = if fFlagAppChatEnableDoubleOptIn then trustedConnectionsUpsellContainerModule else nil,
	[conversationOverlay.TrustedConnectionRequestU18] = if fFlagAppChatEnableDoubleOptIn then trustedConnectionsUpsellContainerModule else nil
}

return reactModule.memo(function(p0)
	-- upvalues: useSelector (ref), getDeepValue2Module (ref), modalConfigurationModule (ref), reactModule (ref), t (ref), useShouldShowConversationOverlayModule (ref), useRecordModalSequenceResponseForConversationModule (ref), useDispatch (ref), fFlagAppChatConsolidateTrustedFriendsModalModule (ref), useGetOneToOneFriendIdFromConversationIdModule (ref), useRecordModalSeenWithDelayModule (ref), modalSequence (ref), fIntAppChatModalSeenImpressionDelayMsModule (ref), appChatNetworkingModule (ref), name (ref), dismissedChatModalModule (ref), trustedFriendsUpsellContainerModule (ref)
	local var16 = useSelector(function(p1)
		-- upvalues: getDeepValue2Module (copy), p0 (ref), modalConfigurationModule (copy)
		return getDeepValue2Module(p1, `ChatAppReducer.Modals.conversationOverlays.{p0.conversationId}`) or modalConfigurationModule.default
	end)
	var16 = reactModule.useMemo(function()
		-- upvalues: var16 (write)
		return var16
	end, { p0.conversationId })
	local modalLayout = var16.modal_layout
	local modalVariant = t[var16.modal_variant]
	local var17 = useShouldShowConversationOverlayModule(p0.conversationId) and modalVariant ~= nil
	local var18 = useRecordModalSequenceResponseForConversationModule(p0.conversationId)
	local var19 = useDispatch()
	local var20 = if fFlagAppChatConsolidateTrustedFriendsModalModule then useGetOneToOneFriendIdFromConversationIdModule(p0.conversationId) else nil
	useRecordModalSeenWithDelayModule({
		modalSequence = modalSequence.ConversationOverlay,
		modalId = modalLayout.id,
		modalVariant = var16.modal_variant,
		actionToRecord = modalLayout.seen_record_action,
		delayMs = fIntAppChatModalSeenImpressionDelayMsModule,
		canRecordAction = var17,
		conversationId = p0.conversationId
	})
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), p0 (ref)
		if not var17 then
			p0.dismissModal()
		end
	end, { var17 })
	local var21 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), var16 (write), appChatNetworkingModule (copy), name (copy), p0 (ref), var19 (ref), dismissedChatModalModule (copy)
		var18(var16.modal_layout.dismissed_record_action, appChatNetworkingModule.Constants.ModalSequence.ConversationOverlay, var16.modal_layout.id, var16.modal_variant):catch(function(p2)
			-- upvalues: name (copy), var16 (copy)
			name:warning(`Error in ConversationOverlayContainer {var16.modal_layout.id} -> RecordModalSequenceResponse: {tostring(p2)}`)
		end)
		p0.dismissModal()
		var19(dismissedChatModalModule(appChatNetworkingModule.Constants.ModalSequence.ConversationOverlay, p0.conversationId))
	end, {
		p0.conversationId, var16.modal_layout.dismissed_record_action,
		var16.modal_layout.id, var16.modal_variant, var18, var19, p0.dismissModal
	})
	
	return if var17 then if fFlagAppChatConsolidateTrustedFriendsModalModule then if var20 then reactModule.createElement(trustedFriendsUpsellContainerModule, {
		userId = var20,
		conversationId = p0.conversationId,
		analyticsModalVariant = var16.modal_variant,
		dismissModal = var21
	}) else nil else reactModule.createElement(modalVariant, {
		conversationId = p0.conversationId,
		modalVariant = var16.modal_variant,
		dismissModal = var21
	}) else nil
end)