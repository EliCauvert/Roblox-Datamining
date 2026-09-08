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

return reactModule.memo(function(p1)
	-- upvalues: useSelector (ref), getDeepValue2Module (ref), modalConfigurationModule (ref), reactModule (ref), t (ref), useShouldShowConversationOverlayModule (ref), useRecordModalSequenceResponseForConversationModule (ref), useDispatch (ref), fFlagAppChatConsolidateTrustedFriendsModalModule (ref), useGetOneToOneFriendIdFromConversationIdModule (ref), useRecordModalSeenWithDelayModule (ref), modalSequence (ref), fIntAppChatModalSeenImpressionDelayMsModule (ref), appChatNetworkingModule (ref), name (ref), dismissedChatModalModule (ref), trustedFriendsUpsellContainerModule (ref)
	local var1 = useSelector(function(p2)
		-- upvalues: getDeepValue2Module (copy), p1 (ref), modalConfigurationModule (copy)
		return getDeepValue2Module(p2, `ChatAppReducer.Modals.conversationOverlays.{p1.conversationId}`) or modalConfigurationModule.default
	end)
	var1 = reactModule.useMemo(function()
		-- upvalues: var1 (write)
		return var1
	end, { p1.conversationId })
	local modalLayout = var1.modal_layout
	local modalVariant = t[var1.modal_variant]
	local var2 = useShouldShowConversationOverlayModule(p1.conversationId) and modalVariant ~= nil
	local var3 = useRecordModalSequenceResponseForConversationModule(p1.conversationId)
	local var4 = useDispatch()
	local var5 = if fFlagAppChatConsolidateTrustedFriendsModalModule then useGetOneToOneFriendIdFromConversationIdModule(p1.conversationId) else nil
	useRecordModalSeenWithDelayModule({
		modalSequence = modalSequence.ConversationOverlay,
		modalId = modalLayout.id,
		modalVariant = var1.modal_variant,
		actionToRecord = modalLayout.seen_record_action,
		delayMs = fIntAppChatModalSeenImpressionDelayMsModule,
		canRecordAction = var2,
		conversationId = p1.conversationId
	})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref)
		if not var2 then
			p1.dismissModal()
		end
	end, { var2 })
	local var6 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var1 (write), appChatNetworkingModule (copy), name (copy), p1 (ref), var4 (ref), dismissedChatModalModule (copy)
		var3(var1.modal_layout.dismissed_record_action, appChatNetworkingModule.Constants.ModalSequence.ConversationOverlay, var1.modal_layout.id, var1.modal_variant):catch(function(p2)
			-- upvalues: name (copy), var1 (copy)
			name:warning(`Error in ConversationOverlayContainer {var1.modal_layout.id} -> RecordModalSequenceResponse: {tostring(p2)}`)
		end)
		p1.dismissModal()
		var4(dismissedChatModalModule(appChatNetworkingModule.Constants.ModalSequence.ConversationOverlay, p1.conversationId))
	end, {
		p1.conversationId, var1.modal_layout.dismissed_record_action,
		var1.modal_layout.id, var1.modal_variant, var3, var4, p1.dismissModal
	})
	
	return if var2 then if fFlagAppChatConsolidateTrustedFriendsModalModule then if var5 then reactModule.createElement(trustedFriendsUpsellContainerModule, {
		userId = var5,
		conversationId = p1.conversationId,
		analyticsModalVariant = var1.modal_variant,
		dismissModal = var6
	}) else nil else reactModule.createElement(modalVariant, {
		conversationId = p1.conversationId,
		modalVariant = var1.modal_variant,
		dismissModal = var6
	}) else nil
end)