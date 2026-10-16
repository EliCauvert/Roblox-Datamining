local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local _ = require(AppChat.types)
local ConversationBottomModal = require(Parent.AppChatNetworking).Constants.ConversationBottomModal
local ModalConfigurationModule = require(AppChat.Models.ModalConfiguration)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GetDeepValue2Module = require(AppChat.Utils.getDeepValue2)
local SocialExperimentsModule = require(Parent.SocialExperiments)
local FFlagTestDeviceForFAEUpsell = SocialExperimentsModule.FFlagTestDeviceForFAEUpsell
local DeviceMeetsRequirementsForFAEFunction = SocialExperimentsModule.deviceMeetsRequirementsForFAE
local ConversationModalModule = require(script.Parent.ConversationModal)
local AppChatFAEBannerModule = require(AppChat.Components.FaeBanner.AppChatFAEBanner)
local config = {
	shouldShowLegacyBottomModal = false,
	onHeightChanged = function(_) --[[ Line: 34 ]] end
}

return ReactModule.memo(function(p1) --[[ Line: 37 | Named "ConversationBottomModalContainer" ]]
	-- upvalues: CryoModule (copy), config (copy), UseSelectorFunction (copy), GetDeepValue2Module (copy), ModalConfigurationModule (copy), ReactModule (copy), ConversationBottomModal (copy), AppChatFAEBannerModule (copy), FFlagTestDeviceForFAEUpsell (copy), DeviceMeetsRequirementsForFAEFunction (copy), ConversationModalModule (copy), FoundationModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 41 ]]
		-- upvalues: GetDeepValue2Module (upval), UnionResult (copy), ModalConfigurationModule (upval)
		return GetDeepValue2Module(p2, `ChatAppReducer.Modals.conversationBottomModals.{UnionResult.conversationId}`) or ModalConfigurationModule.default
	end)
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 46 ]]
		-- upvalues: UnionResult (copy)
		UnionResult.onHeightChanged(Frame.AbsoluteSize.Y)
	end, { UnionResult.onHeightChanged })
	local Element = if not UnionResult.shouldShowChatInputBar and UseSelectorResult and UseSelectorResult.modal_variant ~= nil and UseSelectorResult.modal_variant ~= ConversationBottomModal.None then ReactModule.createElement(AppChatFAEBannerModule, {
		modalConfiguration = UseSelectorResult,
		conversationId = UnionResult.conversationId
	}) else nil
	
	if FFlagTestDeviceForFAEUpsell and not DeviceMeetsRequirementsForFAEFunction() then
		return nil
	end
	if not Element and UnionResult.shouldShowLegacyBottomModal then
		Element = ReactModule.createElement(ConversationModalModule, { bodyText = UnionResult.legacyBottomModalText })
	end
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-y size-full-0",
		LayoutOrder = UnionResult.layoutOrder,
		onAbsoluteSizeChanged = UseResult
	}, { ConversationBottomModal = Element })
end)