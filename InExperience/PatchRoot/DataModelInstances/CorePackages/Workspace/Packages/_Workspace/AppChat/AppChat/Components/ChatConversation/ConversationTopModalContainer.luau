local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local name = require(appChat.Logger):new(script.Name)
local foundationModule = require(parent.Foundation)
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local appChatNetworkingModule = require(parent.AppChatNetworking)
local conversationTopModal = appChatNetworkingModule.Constants.ConversationTopModal
local modalConfigurationModule = require(appChat.Models.ModalConfiguration)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)
local useRecordModalSeenWithDelayModule = require(appChat.Hooks.useRecordModalSeenWithDelay)
local modalSequence = appChatNetworkingModule.Constants.ModalSequence
local useRecordModalSequenceResponseForConversationModule = require(appChat.Hooks.useRecordModalSequenceResponseForConversation)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local dismissedChatModalModule = require(appChat.Conversations.Actions.DismissedChatModal)
local useIsGuiInChatVisibleModule = require(appChat.Hooks.useIsGuiInChatVisible)
local conversationBannerContainerModule = require(script.Parent.ConversationBanner.ConversationBannerContainer)
local fIntAppChatModalSeenImpressionDelayMsModule = require(appChat.Flags.FIntAppChatModalSeenImpressionDelayMs)
local t = { setModalHeight = function(_) --[[ line: 34 ]] end }
local t_1 = {
	[conversationTopModal.AddTrustedConnection] = conversationBannerContainerModule,
	[conversationTopModal.TrustedConnectionRequest] = conversationBannerContainerModule
}

return reactModule.memo(function(p0) --[[ line: 43 | named "ConversationTopModalContainer" ]]
	-- upvalues: cryoModule (ref), t (ref), useSelector (ref), getDeepValue2Module (ref), modalConfigurationModule (ref), t_1 (ref), useDispatch (ref), useRecordModalSequenceResponseForConversationModule (ref), reactModule (ref), useIsGuiInChatVisibleModule (ref), useRecordModalSeenWithDelayModule (ref), modalSequence (ref), fIntAppChatModalSeenImpressionDelayMsModule (ref), name (ref), dismissedChatModalModule (ref), appChatNetworkingModule (ref), conversationTopModal (ref), foundationModule (ref)
	local var16 = cryoModule.Dictionary.union(t, p0)
	local var17 = useSelector(function(p1) --[[ line: 46 ]]
		-- upvalues: getDeepValue2Module (copy), var16 (ref), modalConfigurationModule (copy)
		return getDeepValue2Module(p1, `ChatAppReducer.Modals.conversationTopModals.{var16.conversationId}`) or modalConfigurationModule.default
	end)
	local modalLayout = var17.modal_layout
	local modalVariant = t_1[var17.modal_variant]
	local var18 = useDispatch()
	local var19 = useRecordModalSequenceResponseForConversationModule(var16.conversationId)
	local var20 = reactModule.useRef(nil)
	useRecordModalSeenWithDelayModule({
		modalSequence = modalSequence.ConversationTopModal,
		modalVariant = var17.modal_variant,
		actionToRecord = modalLayout.seen_record_action,
		delayMs = fIntAppChatModalSeenImpressionDelayMsModule,
		canRecordAction = useIsGuiInChatVisibleModule(var20, { var20.current, modalVariant }) and modalVariant ~= nil,
		conversationId = var16.conversationId
	})
	local var21 = reactModule.useCallback(function() --[[ line: 68 ]]
		-- upvalues: var19 (ref), var17 (ref), modalSequence (copy), name (copy), var18 (ref), dismissedChatModalModule (copy), appChatNetworkingModule (copy), var16 (ref)
		var19(var17.modal_layout.dismissed_record_action, modalSequence.ConversationTopModal, nil, var17.modal_variant):catch(function(p2) --[[ line: 74 ]]
			-- upvalues: name (copy), var17 (copy)
			name:warning(`Error in ConversationOverlayContainer {var17.modal_layout.id} -> RecordModalSequenceResponse: {tostring(p2)}`)
		end)
		var18(dismissedChatModalModule(appChatNetworkingModule.Constants.ModalSequence.ConversationTopModal, var16.conversationId))
	end, {
		var16.conversationId,
		var17.modal_layout.dismissed_record_action,
		var17.modal_variant,
		var19,
		var18
	})
	local var22 = reactModule.useCallback(function(p3) --[[ line: 94 ]]
		-- upvalues: var16 (ref)
		var16.setModalHeight(p3.AbsoluteSize.Y)
	end, { var16.setModalHeight })
	local var23 = nil
	
	if modalVariant then
		var23 = reactModule.createElement(modalVariant, {
			conversationId = var16.conversationId,
			modalVariant = var17.modal_variant,
			onDismissed = var21,
			bodyText = modalLayout.body and modalLayout.body.text,
			actionText = modalLayout.buttons and (modalLayout.buttons[1] and modalLayout.buttons[1].text)
		})
	elseif var17.modal_variant ~= nil and var17.modal_variant ~= conversationTopModal.None then
		name:warning(`Unsupported ConversationTopModal variant: {var17.modal_variant}`)
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "gui-objects-default auto-y size-full-0",
		LayoutOrder = var16.layoutOrder,
		onAbsoluteSizeChanged = var22,
		ref = var20
	}, { conversationTopModal = var23 })
end)