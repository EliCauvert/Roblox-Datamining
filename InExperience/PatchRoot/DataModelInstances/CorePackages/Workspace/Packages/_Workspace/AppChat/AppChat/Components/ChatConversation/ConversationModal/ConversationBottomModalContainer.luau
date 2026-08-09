local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local foundationModule = require(parent.Foundation)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local _ = require(appChat.types)
local conversationBottomModal = require(parent.AppChatNetworking).Constants.ConversationBottomModal
local modalConfigurationModule = require(appChat.Models.ModalConfiguration)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)
local socialExperimentsModule = require(parent.SocialExperiments)
local fFlagTestDeviceForFAEUpsell = socialExperimentsModule.FFlagTestDeviceForFAEUpsell
local deviceMeetsRequirementsForFAE = socialExperimentsModule.deviceMeetsRequirementsForFAE
local fFlagEnableAEGIS2AppChatConversationBanner = require(parent.SharedFlags).FFlagEnableAEGIS2AppChatConversationBanner
local fFlagAppChatNudgeToChatUpsellEnabledModule = require(appChat.Flags.FFlagAppChatNudgeToChatUpsellEnabled)
local conversationModalModule = require(script.Parent.ConversationModal)
local appChatFAEBannerModule = require(appChat.Components.FaeBanner.AppChatFAEBanner)
local t = {
	shouldShowLegacyBottomModal = false,
	onHeightChanged = function(_) --[[ line: 38 ]] end
}

return reactModule.memo(function(p0) --[[ line: 41 | named "ConversationBottomModalContainer" ]]
	-- upvalues: cryoModule (ref), t (ref), useSelector (ref), getDeepValue2Module (ref), modalConfigurationModule (ref), reactModule (ref), fFlagEnableAEGIS2AppChatConversationBanner (ref), fFlagAppChatNudgeToChatUpsellEnabledModule (ref), conversationBottomModal (ref), appChatFAEBannerModule (ref), fFlagTestDeviceForFAEUpsell (ref), deviceMeetsRequirementsForFAE (ref), conversationModalModule (ref), foundationModule (ref)
	local var11 = cryoModule.Dictionary.union(t, p0)
	local var12 = useSelector(function(p1) --[[ line: 45 ]]
		-- upvalues: getDeepValue2Module (copy), var11 (ref), modalConfigurationModule (copy)
		return getDeepValue2Module(p1, `ChatAppReducer.Modals.conversationBottomModals.{var11.conversationId}`) or modalConfigurationModule.default
	end)
	local var13 = reactModule.useCallback(function(p2) --[[ line: 50 ]]
		-- upvalues: var11 (ref)
		var11.onHeightChanged(p2.AbsoluteSize.Y)
	end, { var11.onHeightChanged })
	local var14 = if (fFlagEnableAEGIS2AppChatConversationBanner or fFlagAppChatNudgeToChatUpsellEnabledModule) and (not var11.shouldShowChatInputBar and var12) and (var12.modal_variant ~= nil and var12.modal_variant ~= conversationBottomModal.None) then reactModule.createElement(appChatFAEBannerModule, {
		modalConfiguration = var12,
		conversationId = var11.conversationId
	}) else nil
	
	if fFlagTestDeviceForFAEUpsell and not deviceMeetsRequirementsForFAE() then
		return nil
	elseif not var14 and var11.shouldShowLegacyBottomModal then
		var14 = reactModule.createElement(conversationModalModule, { bodyText = var11.legacyBottomModalText })
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-y size-full-0",
		LayoutOrder = var11.layoutOrder,
		onAbsoluteSizeChanged = var13
	}, { ConversationBottomModal = var14 })
end)