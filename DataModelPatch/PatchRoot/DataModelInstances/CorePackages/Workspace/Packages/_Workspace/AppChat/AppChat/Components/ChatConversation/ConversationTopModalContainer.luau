local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local NewResult = require(AppChat.Logger):new(script.Name)
local FoundationModule = require(Parent.Foundation)
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local ConversationTopModal = AppChatNetworkingModule.Constants.ConversationTopModal
local ModalConfigurationModule = require(AppChat.Models.ModalConfiguration)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GetDeepValue2Module = require(AppChat.Utils.getDeepValue2)
local UseRecordModalSeenWithDelayModule = require(AppChat.Hooks.useRecordModalSeenWithDelay)
local ModalSequence = AppChatNetworkingModule.Constants.ModalSequence
local UseRecordModalSequenceResponseForConversationModule = require(AppChat.Hooks.useRecordModalSequenceResponseForConversation)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local DismissedChatModalModule = require(AppChat.Conversations.Actions.DismissedChatModal)
local UseIsGuiInChatVisibleModule = require(AppChat.Hooks.useIsGuiInChatVisible)
local ConversationBannerContainerModule = require(script.Parent.ConversationBanner.ConversationBannerContainer)
local FIntAppChatModalSeenImpressionDelayMsModule = require(AppChat.Flags.FIntAppChatModalSeenImpressionDelayMs)
local config = { setModalHeight = function(_) end }
local config1 = {
	[ConversationTopModal.AddTrustedConnection] = ConversationBannerContainerModule,
	[ConversationTopModal.TrustedConnectionRequest] = ConversationBannerContainerModule
}

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseSelectorFunction (copy), GetDeepValue2Module (copy), ModalConfigurationModule (copy), config1 (copy), UseDispatchFunction (copy), UseRecordModalSequenceResponseForConversationModule (copy), ReactModule (copy), UseIsGuiInChatVisibleModule (copy), UseRecordModalSeenWithDelayModule (copy), ModalSequence (copy), FIntAppChatModalSeenImpressionDelayMsModule (copy), NewResult (copy), DismissedChatModalModule (copy), AppChatNetworkingModule (copy), ConversationTopModal (copy), FoundationModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValue2Module (upval), UnionResult (copy), ModalConfigurationModule (upval)
		return GetDeepValue2Module(p2, `ChatAppReducer.Modals.conversationTopModals.{UnionResult.conversationId}`) or ModalConfigurationModule.default
	end)
	local ModalLayout = UseSelectorResult.modal_layout
	local Entry = config1[UseSelectorResult.modal_variant]
	local UseDispatchResult = UseDispatchFunction()
	local UseRecordModalSequenceResponseForConversationModuleResult = UseRecordModalSequenceResponseForConversationModule(UnionResult.conversationId)
	local UseRefResult = ReactModule.useRef(nil)
	UseRecordModalSeenWithDelayModule({
		modalSequence = ModalSequence.ConversationTopModal,
		modalVariant = UseSelectorResult.modal_variant,
		actionToRecord = ModalLayout.seen_record_action,
		delayMs = FIntAppChatModalSeenImpressionDelayMsModule,
		canRecordAction = UseIsGuiInChatVisibleModule(UseRefResult, { UseRefResult.current, Entry }) and Entry ~= nil,
		conversationId = UnionResult.conversationId
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRecordModalSequenceResponseForConversationModuleResult (copy), UseSelectorResult (copy), ModalSequence (upval), NewResult (upval), UseDispatchResult (copy), DismissedChatModalModule (upval), AppChatNetworkingModule (upval), UnionResult (copy)
		UseRecordModalSequenceResponseForConversationModuleResult(UseSelectorResult.modal_layout.dismissed_record_action, ModalSequence.ConversationTopModal, nil, UseSelectorResult.modal_variant):catch(function(Err)
			-- upvalues: NewResult (upval), UseSelectorResult (upval)
			NewResult:warning(`Error in ConversationOverlayContainer {UseSelectorResult.modal_layout.id} -> RecordModalSequenceResponse: {tostring(Err)}`)
		end)
		UseDispatchResult(DismissedChatModalModule(AppChatNetworkingModule.Constants.ModalSequence.ConversationTopModal, UnionResult.conversationId))
	end, {
		UnionResult.conversationId,
		UseSelectorResult.modal_layout.dismissed_record_action,
		UseSelectorResult.modal_variant,
		UseRecordModalSequenceResponseForConversationModuleResult,
		UseDispatchResult
	})
	local UseResult1 = ReactModule.useCallback(function(Frame)
		-- upvalues: UnionResult (copy)
		UnionResult.setModalHeight(Frame.AbsoluteSize.Y)
	end, { UnionResult.setModalHeight })
	local Element = nil
	
	if Entry then
		Element = ReactModule.createElement(Entry, {
			conversationId = UnionResult.conversationId,
			modalVariant = UseSelectorResult.modal_variant,
			onDismissed = UseResult,
			bodyText = ModalLayout.body and ModalLayout.body.text,
			actionText = ModalLayout.buttons and (ModalLayout.buttons[1] and ModalLayout.buttons[1].text)
		})
	elseif UseSelectorResult.modal_variant ~= nil and UseSelectorResult.modal_variant ~= ConversationTopModal.None then
		NewResult:warning(`Unsupported ConversationTopModal variant: {UseSelectorResult.modal_variant}`)
	end
	return ReactModule.createElement(FoundationModule.View, {
		tag = "gui-objects-default auto-y size-full-0",
		LayoutOrder = UnionResult.layoutOrder,
		onAbsoluteSizeChanged = UseResult1,
		ref = UseRefResult
	}, { conversationTopModal = Element })
end)