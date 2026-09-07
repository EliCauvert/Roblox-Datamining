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
local t = { setModalHeight = function(_) end }
local t_1 = {
	[conversationTopModal.AddTrustedConnection] = conversationBannerContainerModule,
	[conversationTopModal.TrustedConnectionRequest] = conversationBannerContainerModule
}

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useSelector (ref), getDeepValue2Module (ref), modalConfigurationModule (ref), t_1 (ref), useDispatch (ref), useRecordModalSequenceResponseForConversationModule (ref), reactModule (ref), useIsGuiInChatVisibleModule (ref), useRecordModalSeenWithDelayModule (ref), modalSequence (ref), fIntAppChatModalSeenImpressionDelayMsModule (ref), name (ref), dismissedChatModalModule (ref), appChatNetworkingModule (ref), conversationTopModal (ref), foundationModule (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2 = useSelector(function(p2)
		-- upvalues: getDeepValue2Module (copy), var1 (ref), modalConfigurationModule (copy)
		return getDeepValue2Module(p2, `ChatAppReducer.Modals.conversationTopModals.{var1.conversationId}`) or modalConfigurationModule.default
	end)
	local modalLayout = var2.modal_layout
	local modalVariant = t_1[var2.modal_variant]
	local var3 = useDispatch()
	local var4 = useRecordModalSequenceResponseForConversationModule(var1.conversationId)
	local var5 = reactModule.useRef(nil)
	useRecordModalSeenWithDelayModule({
		modalSequence = modalSequence.ConversationTopModal,
		modalVariant = var2.modal_variant,
		actionToRecord = modalLayout.seen_record_action,
		delayMs = fIntAppChatModalSeenImpressionDelayMsModule,
		canRecordAction = useIsGuiInChatVisibleModule(var5, { var5.current, modalVariant }) and modalVariant ~= nil,
		conversationId = var1.conversationId
	})
	local var6 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var2 (ref), modalSequence (copy), name (copy), var3 (ref), dismissedChatModalModule (copy), appChatNetworkingModule (copy), var1 (ref)
		var4(var2.modal_layout.dismissed_record_action, modalSequence.ConversationTopModal, nil, var2.modal_variant):catch(function(p2)
			-- upvalues: name (copy), var2 (copy)
			name:warning(`Error in ConversationOverlayContainer {var2.modal_layout.id} -> RecordModalSequenceResponse: {tostring(p2)}`)
		end)
		var3(dismissedChatModalModule(appChatNetworkingModule.Constants.ModalSequence.ConversationTopModal, var1.conversationId))
	end, {
		var1.conversationId,
		var2.modal_layout.dismissed_record_action,
		var2.modal_variant,
		var4,
		var3
	})
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref)
		var1.setModalHeight(p2.AbsoluteSize.Y)
	end, { var1.setModalHeight })
	local var8 = nil
	
	if modalVariant then
		var8 = reactModule.createElement(modalVariant, {
			conversationId = var1.conversationId,
			modalVariant = var2.modal_variant,
			onDismissed = var6,
			bodyText = modalLayout.body and modalLayout.body.text,
			actionText = modalLayout.buttons and (modalLayout.buttons[1] and modalLayout.buttons[1].text)
		})
	elseif var2.modal_variant ~= nil and var2.modal_variant ~= conversationTopModal.None then
		name:warning(`Unsupported ConversationTopModal variant: {var2.modal_variant}`)
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "gui-objects-default auto-y size-full-0",
		LayoutOrder = var1.layoutOrder,
		onAbsoluteSizeChanged = var7,
		ref = var5
	}, { conversationTopModal = var8 })
end)