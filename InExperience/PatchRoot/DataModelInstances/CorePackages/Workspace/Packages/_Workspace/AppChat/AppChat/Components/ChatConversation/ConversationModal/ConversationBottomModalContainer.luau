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
	onHeightChanged = function(_) --[[ line: 34 ]] end
}

return reactModule.memo(function(p0) --[[ line: 37 | named "ConversationBottomModalContainer" ]]
	-- upvalues: cryoModule (ref), t (ref), useSelector (ref), getDeepValue2Module (ref), modalConfigurationModule (ref), reactModule (ref), conversationBottomModal (ref), appChatFAEBannerModule (ref), fFlagTestDeviceForFAEUpsell (ref), deviceMeetsRequirementsForFAE (ref), conversationModalModule (ref), foundationModule (ref)
	local var10 = cryoModule.Dictionary.union(t, p0)
	local var11 = useSelector(function(p1) --[[ line: 41 ]]
		-- upvalues: getDeepValue2Module (copy), var10 (ref), modalConfigurationModule (copy)
		return getDeepValue2Module(p1, `ChatAppReducer.Modals.conversationBottomModals.{var10.conversationId}`) or modalConfigurationModule.default
	end)
	local var12 = reactModule.useCallback(function(p2) --[[ line: 46 ]]
		-- upvalues: var10 (ref)
		var10.onHeightChanged(p2.AbsoluteSize.Y)
	end, { var10.onHeightChanged })
	local var13 = if not (var10.shouldShowChatInputBar or not var11 or (var11.modal_variant == nil or var11.modal_variant == conversationBottomModal.None)) then reactModule.createElement(appChatFAEBannerModule, {
		modalConfiguration = var11,
		conversationId = var10.conversationId
	}) else nil
	
	if fFlagTestDeviceForFAEUpsell and not deviceMeetsRequirementsForFAE() then
		return nil
	elseif not var13 and var10.shouldShowLegacyBottomModal then
		var13 = reactModule.createElement(conversationModalModule, { bodyText = var10.legacyBottomModalText })
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-y size-full-0",
		LayoutOrder = var10.layoutOrder,
		onAbsoluteSizeChanged = var12
	}, { ConversationBottomModal = var13 })
end)