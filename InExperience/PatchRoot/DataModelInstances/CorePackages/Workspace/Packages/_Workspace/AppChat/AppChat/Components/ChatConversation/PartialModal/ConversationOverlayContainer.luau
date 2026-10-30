local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local NewResult = require(AppChat.Logger):new(script.Name)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local ReactModule = require(Parent.React)
local ConversationOverlay = AppChatNetworkingModule.Constants.ConversationOverlay
local ModalSequence = AppChatNetworkingModule.Constants.ModalSequence
local GetDeepValue2Module = require(AppChat.Utils.getDeepValue2)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseShouldShowConversationOverlayModule = require(AppChat.Hooks.useShouldShowConversationOverlay)
local UseRecordModalSeenWithDelayModule = require(AppChat.Hooks.useRecordModalSeenWithDelay)
local ModalConfigurationModule = require(AppChat.Models.ModalConfiguration)
local TrustedFriendsUpsellContainerModule = require(AppChat.Components.TrustedFriendsUpsell.TrustedFriendsUpsellContainer)
local UseGetOneToOneFriendIdFromConversationIdModule = require(AppChat.Hooks.useGetOneToOneFriendIdFromConversationId)
local UseRecordModalSequenceResponseForConversationModule = require(AppChat.Hooks.useRecordModalSequenceResponseForConversation)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local DismissedChatModalModule = require(AppChat.Conversations.Actions.DismissedChatModal)
local FIntAppChatModalSeenImpressionDelayMsModule = require(AppChat.Flags.FIntAppChatModalSeenImpressionDelayMs)
local config = {
	[ConversationOverlay.TrustedConnectionCreated] = true,
	[ConversationOverlay.AddTrustedConnectionU18] = true,
	[ConversationOverlay.TrustedConnectionRequestU18] = true
}

return ReactModule.memo(function(p1)
	-- upvalues: UseSelectorFunction (copy), GetDeepValue2Module (copy), ModalConfigurationModule (copy), ReactModule (copy), UseShouldShowConversationOverlayModule (copy), config (copy), UseRecordModalSequenceResponseForConversationModule (copy), UseDispatchFunction (copy), UseGetOneToOneFriendIdFromConversationIdModule (copy), UseRecordModalSeenWithDelayModule (copy), ModalSequence (copy), FIntAppChatModalSeenImpressionDelayMsModule (copy), AppChatNetworkingModule (copy), NewResult (copy), DismissedChatModalModule (copy), TrustedFriendsUpsellContainerModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValue2Module (upval), p1 (copy), ModalConfigurationModule (upval)
		return GetDeepValue2Module(p2, `ChatAppReducer.Modals.conversationOverlays.{p1.conversationId}`) or ModalConfigurationModule.default
	end)
	UseSelectorResult = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult (ref)
		return UseSelectorResult
	end, { p1.conversationId })
	local ModalLayout = UseSelectorResult.modal_layout
	local IsEntry: boolean = UseShouldShowConversationOverlayModule(p1.conversationId) and config[UseSelectorResult.modal_variant] == true
	local UseRecordModalSequenceResponseForConversationModuleResult = UseRecordModalSequenceResponseForConversationModule(p1.conversationId)
	local UseDispatchResult = UseDispatchFunction()
	local UseGetOneToOneFriendIdFromConversationIdModuleResult = UseGetOneToOneFriendIdFromConversationIdModule(p1.conversationId)
	UseRecordModalSeenWithDelayModule({
		modalSequence = ModalSequence.ConversationOverlay,
		modalId = ModalLayout.id,
		modalVariant = UseSelectorResult.modal_variant,
		actionToRecord = ModalLayout.seen_record_action,
		delayMs = FIntAppChatModalSeenImpressionDelayMsModule,
		canRecordAction = IsEntry,
		conversationId = p1.conversationId
	})
	ReactModule.useEffect(function()
		-- upvalues: IsEntry (copy), p1 (copy)
		if not IsEntry then
			p1.dismissModal()
		end
	end, { IsEntry })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRecordModalSequenceResponseForConversationModuleResult (copy), UseSelectorResult (ref), AppChatNetworkingModule (upval), NewResult (upval), p1 (copy), UseDispatchResult (copy), DismissedChatModalModule (upval)
		UseRecordModalSequenceResponseForConversationModuleResult(UseSelectorResult.modal_layout.dismissed_record_action, AppChatNetworkingModule.Constants.ModalSequence.ConversationOverlay, UseSelectorResult.modal_layout.id, UseSelectorResult.modal_variant):catch(function(Err)
			-- upvalues: NewResult (upval), UseSelectorResult (upval)
			NewResult:warning(`Error in ConversationOverlayContainer {UseSelectorResult.modal_layout.id} -> RecordModalSequenceResponse: {tostring(Err)}`)
		end)
		p1.dismissModal()
		UseDispatchResult(DismissedChatModalModule(AppChatNetworkingModule.Constants.ModalSequence.ConversationOverlay, p1.conversationId))
	end, {
		p1.conversationId, UseSelectorResult.modal_layout.dismissed_record_action,
		UseSelectorResult.modal_layout.id, UseSelectorResult.modal_variant,
		UseRecordModalSequenceResponseForConversationModuleResult, UseDispatchResult,
		p1.dismissModal
	})
	
	return if IsEntry and UseGetOneToOneFriendIdFromConversationIdModuleResult then ReactModule.createElement(TrustedFriendsUpsellContainerModule, {
		userId = UseGetOneToOneFriendIdFromConversationIdModuleResult,
		conversationId = p1.conversationId,
		analyticsModalVariant = UseSelectorResult.modal_variant,
		dismissModal = UseResult
	}) else nil
end)