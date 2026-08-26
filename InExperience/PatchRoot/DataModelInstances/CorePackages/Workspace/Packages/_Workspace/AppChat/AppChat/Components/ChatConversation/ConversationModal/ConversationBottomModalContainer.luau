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
local conversationModalModule = require(script.Parent.ConversationModal)
local appChatFAEBannerModule = require(appChat.Components.FaeBanner.AppChatFAEBanner)
local t = {
	shouldShowLegacyBottomModal = false,
	onHeightChanged = function(_) end
}

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useSelector (ref), getDeepValue2Module (ref), modalConfigurationModule (ref), reactModule (ref), conversationBottomModal (ref), appChatFAEBannerModule (ref), fFlagTestDeviceForFAEUpsell (ref), deviceMeetsRequirementsForFAE (ref), conversationModalModule (ref), foundationModule (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2 = useSelector(function(p2)
		-- upvalues: getDeepValue2Module (copy), var1 (ref), modalConfigurationModule (copy)
		return getDeepValue2Module(p2, `ChatAppReducer.Modals.conversationBottomModals.{var1.conversationId}`) or modalConfigurationModule.default
	end)
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref)
		var1.onHeightChanged(p2.AbsoluteSize.Y)
	end, { var1.onHeightChanged })
	local var4 = if not (var1.shouldShowChatInputBar or not var2 or (var2.modal_variant == nil or var2.modal_variant == conversationBottomModal.None)) then reactModule.createElement(appChatFAEBannerModule, {
		modalConfiguration = var2,
		conversationId = var1.conversationId
	}) else nil
	
	if fFlagTestDeviceForFAEUpsell and not deviceMeetsRequirementsForFAE() then
		return nil
	elseif not var4 and var1.shouldShowLegacyBottomModal then
		var4 = reactModule.createElement(conversationModalModule, { bodyText = var1.legacyBottomModalText })
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-y size-full-0",
		LayoutOrder = var1.layoutOrder,
		onAbsoluteSizeChanged = var3
	}, { ConversationBottomModal = var4 })
end)