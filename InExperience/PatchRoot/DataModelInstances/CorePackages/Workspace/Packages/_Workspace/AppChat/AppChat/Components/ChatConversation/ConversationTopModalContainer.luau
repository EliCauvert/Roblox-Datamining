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
local fFlagAppChatConversationTrustedFriendUpsellBanner = require(parent.SharedFlags).FFlagAppChatConversationTrustedFriendUpsellBanner
local sduiConstantsModule = require(appChat.Sdui.SduiConstants)
local var1 = if fFlagAppChatConversationTrustedFriendUpsellBanner then require(parent.SduiSharedUtilities) else nil
local var2 = if fFlagAppChatConversationTrustedFriendUpsellBanner then var1.SduiFeatureEntryPoint else nil
local var3 = if fFlagAppChatConversationTrustedFriendUpsellBanner then var1.useComponentConfig else nil
local fIntAppChatModalSeenImpressionDelayMsModule = require(appChat.Flags.FIntAppChatModalSeenImpressionDelayMs)
local t = { setModalHeight = function(_) end }
local t_1 = {
	[conversationTopModal.AddTrustedConnection] = conversationBannerContainerModule,
	[conversationTopModal.TrustedConnectionRequest] = conversationBannerContainerModule
}

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useSelector (ref), getDeepValue2Module (ref), modalConfigurationModule (ref), t_1 (ref), useDispatch (ref), useRecordModalSequenceResponseForConversationModule (ref), reactModule (ref), useIsGuiInChatVisibleModule (ref), fFlagAppChatConversationTrustedFriendUpsellBanner (ref), sduiConstantsModule (ref), var3 (ref), useRecordModalSeenWithDelayModule (ref), modalSequence (ref), fIntAppChatModalSeenImpressionDelayMsModule (ref), name (ref), dismissedChatModalModule (ref), appChatNetworkingModule (ref), var2 (ref), conversationTopModal (ref), foundationModule (ref)
	local var4 = cryoModule.Dictionary.union(t, p1)
	local var5 = useSelector(function(p2)
		-- upvalues: getDeepValue2Module (copy), var4 (ref), modalConfigurationModule (copy)
		return getDeepValue2Module(p2, `ChatAppReducer.Modals.conversationTopModals.{var4.conversationId}`) or modalConfigurationModule.default
	end)
	local modalLayout = var5.modal_layout
	local modalVariant = t_1[var5.modal_variant]
	local var6 = useDispatch()
	local var7 = useRecordModalSequenceResponseForConversationModule(var4.conversationId)
	local var8 = reactModule.useRef(nil)
	local var9 = useIsGuiInChatVisibleModule(var8, { var8.current, modalVariant })
	local var10 = if fFlagAppChatConversationTrustedFriendUpsellBanner then sduiConstantsModule.getConversationTopModalConfigKey(var4.conversationId) else nil
	local var11 = fFlagAppChatConversationTrustedFriendUpsellBanner and (modalVariant == nil and (if fFlagAppChatConversationTrustedFriendUpsellBanner then var3(var10, sduiConstantsModule.ConversationTopModalIdentifier) else nil) ~= nil)
	useRecordModalSeenWithDelayModule({
		modalSequence = modalSequence.ConversationTopModal,
		modalVariant = var5.modal_variant,
		actionToRecord = modalLayout.seen_record_action,
		delayMs = fIntAppChatModalSeenImpressionDelayMsModule,
		canRecordAction = var9 and modalVariant ~= nil,
		conversationId = var4.conversationId
	})
	local var12 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var5 (ref), modalSequence (copy), name (copy), var6 (ref), dismissedChatModalModule (copy), appChatNetworkingModule (copy), var4 (ref)
		var7(var5.modal_layout.dismissed_record_action, modalSequence.ConversationTopModal, nil, var5.modal_variant):catch(function(p2)
			-- upvalues: name (copy), var5 (copy)
			name:warning(`Error in ConversationOverlayContainer {var5.modal_layout.id} -> RecordModalSequenceResponse: {tostring(p2)}`)
		end)
		var6(dismissedChatModalModule(appChatNetworkingModule.Constants.ModalSequence.ConversationTopModal, var4.conversationId))
	end, {
		var4.conversationId,
		var5.modal_layout.dismissed_record_action,
		var5.modal_variant,
		var7,
		var6
	})
	local var13 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref)
		var4.setModalHeight(p2.AbsoluteSize.Y)
	end, { var4.setModalHeight })
	local var14 = nil
	
	if modalVariant then
		var14 = reactModule.createElement(modalVariant, {
			conversationId = var4.conversationId,
			modalVariant = var5.modal_variant,
			onDismissed = var12,
			bodyText = modalLayout.body and modalLayout.body.text,
			actionText = modalLayout.buttons and (modalLayout.buttons[1] and modalLayout.buttons[1].text)
		})
	elseif var11 then
		var14 = reactModule.createElement(var2, {
			shouldDisplayLoading = false,
			shouldDisplayError = false,
			configKey = var10,
			identifier = sduiConstantsModule.ConversationTopModalIdentifier,
			appPage = sduiConstantsModule.SurfaceKey
		})
	elseif var5.modal_variant ~= nil and var5.modal_variant ~= conversationTopModal.None then
		name:warning(`Unsupported ConversationTopModal variant: {var5.modal_variant}`)
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "gui-objects-default auto-y size-full-0",
		LayoutOrder = var4.layoutOrder,
		onAbsoluteSizeChanged = var13,
		ref = if var11 then nil else var8
	}, { conversationTopModal = var14 })
end)