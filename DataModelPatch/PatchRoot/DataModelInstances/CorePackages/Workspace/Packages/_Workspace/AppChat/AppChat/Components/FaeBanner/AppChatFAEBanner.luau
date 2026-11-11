local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseIsInExperienceModule = require(AppChat.Hooks.useIsInExperience)
local CreateBannerConfigFromModalConfigurationModule = require(AppChat.Utils.createBannerConfigFromModalConfiguration)
local FetchChatMetadataModule = require(AppChat.Conversations.Thunks.fetchChatMetadata)
local ReactModule = require(Parent.React)
local _ = require(AppChat.types)
local NewResult = require(AppChat.Logger):new(script.Name)
local UseCallbackFunction = ReactModule.useCallback
local SocialUpsellModule = require(Parent.SocialUpsell)
local FoundationModule = require(Parent.Foundation)
local UpsellBanner = SocialUpsellModule.UpsellBanner
local StartFacialAgeEstimationFunction = SocialUpsellModule.Thunks.startFacialAgeEstimation
local UseSocialUpsellOverlayControllerFunction = SocialUpsellModule.Hooks.useSocialUpsellOverlayController
local UpsellComponent = SocialUpsellModule.Analytics.Enum.UpsellComponent
local UpsellEntrySurfaceType = SocialUpsellModule.Analytics.Enum.UpsellEntrySurfaceType
local ChatLandingModalVariant = AppChatNetworkingModule.Constants.ChatLandingModalVariant
local ConversationBottomModal = AppChatNetworkingModule.Constants.ConversationBottomModal
local config = {
	[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal] = UpsellEntrySurfaceType.PartyTab,
	[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal] = UpsellEntrySurfaceType.PartyTab,
	[ConversationBottomModal.ConversationBottomAgeVerificationRequiredModal] = UpsellEntrySurfaceType.PartyChatConversationUA,
	[ConversationBottomModal.NudgeToBottomChatUpsell] = UpsellEntrySurfaceType.PartyChatConversationUA
}
local config1 = {
	[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal] = UpsellEntrySurfaceType.PartyTabInExperience,
	[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal] = UpsellEntrySurfaceType.PartyTabInExperience,
	[ConversationBottomModal.ConversationBottomAgeVerificationRequiredModal] = UpsellEntrySurfaceType.PartyChatConversationInExperience,
	[ConversationBottomModal.NudgeToBottomChatUpsell] = UpsellEntrySurfaceType.PartyChatConversationInExperience
}
local config2 = {
	[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal] = true,
	[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal] = true,
	[ConversationBottomModal.ConversationBottomAgeVerificationRequiredModal] = false,
	[ConversationBottomModal.NudgeToBottomChatUpsell] = false
}
local config3 = {
	[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal] = "padding-x-medium padding-top-xxsmall padding-bottom-large align-x-center auto-y size-full-0",
	[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal] = "padding-x-medium padding-top-xxsmall padding-bottom-large align-x-center auto-y size-full-0",
	[ConversationBottomModal.ConversationBottomAgeVerificationRequiredModal] = "padding-large align-x-center auto-y size-full-0 stroke-standard stroke-default bg-shift-100",
	[ConversationBottomModal.NudgeToBottomChatUpsell] = "padding-large align-x-center auto-y size-full-0 stroke-standard stroke-default bg-shift-100"
}

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), UseIsInExperienceModule (copy), UseCallbackFunction (copy), FetchChatMetadataModule (copy), config1 (copy), config (copy), UseSocialUpsellOverlayControllerFunction (copy), ReactModule (copy), StartFacialAgeEstimationFunction (copy), SocialUpsellModule (copy), UpsellComponent (copy), CreateBannerConfigFromModalConfigurationModule (copy), NewResult (copy), config2 (copy), config3 (copy), FoundationModule (copy), UpsellBanner (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseIsInExperienceModuleResult = UseIsInExperienceModule()
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseDispatchResult (copy), FetchChatMetadataModule (upval)
		UseDispatchResult(FetchChatMetadataModule())
	end, { UseDispatchResult, FetchChatMetadataModule })
	local ModalConfiguration = p1.modalConfiguration
	local Entry = if UseIsInExperienceModuleResult then config1[ModalConfiguration.modal_variant] else config[ModalConfiguration.modal_variant]
	local UseSocialUpsellOverlayControllerResult = UseSocialUpsellOverlayControllerFunction(UseIsInExperienceModuleResult)
	local UseResult = ReactModule.useCallback(function(_)
		-- upvalues: UseDispatchResult (copy), StartFacialAgeEstimationFunction (upval), SocialUpsellModule (upval), Entry (copy), UseCallbackResult (copy), UseIsInExperienceModuleResult (copy)
		UseDispatchResult(StartFacialAgeEstimationFunction(SocialUpsellModule.Enums.SocialUpsellType.FacialAgeEstimation .. Entry, UseCallbackResult, nil, Entry, UseIsInExperienceModuleResult))
	end, { UseDispatchResult, Entry, UseIsInExperienceModuleResult })
	local UseResult1 = ReactModule.useCallback(function(ImpressionId)
		-- upvalues: UseSocialUpsellOverlayControllerResult (copy), SocialUpsellModule (upval), Entry (copy), UpsellComponent (upval)
		UseSocialUpsellOverlayControllerResult.openSocialOverlay(SocialUpsellModule.Enums.SocialUpsellType.FacialAgeEstimation, {
			upsellEntrySurface = Entry,
			upsellEntryComponent = UpsellComponent.Banner,
			impressionId = ImpressionId
		})
	end, {
		UseSocialUpsellOverlayControllerResult.openSocialOverlay,
		Entry
	})
	local BannerConfigFromModalConfigurationModule = CreateBannerConfigFromModalConfigurationModule(ModalConfiguration)
	local UseResult2 = ReactModule.useCallback(function(_)
		-- upvalues: BannerConfigFromModalConfigurationModule (copy), NewResult (upval)
		if not BannerConfigFromModalConfigurationModule.isDismissable then
			NewResult:warning("attempt to call AppChatFAEBanner onDismiss not provided and banner is not dismissable")
		end
	end, {})
	
	return ReactModule.createElement(FoundationModule.View, { tag = config3[ModalConfiguration.modal_variant] }, {
		UpsellBanner = ReactModule.createElement(UpsellBanner, {
			config = BannerConfigFromModalConfigurationModule,
			isContained = config2[ModalConfiguration.modal_variant],
			onPrimaryAction = UseResult,
			onSecondaryAction = UseResult1,
			onDismiss = p1.onDismiss or UseResult2,
			upsellEntrySurface = Entry,
			upsellEntryComponent = UpsellComponent.Banner,
			conversationId = p1.conversationId
		})
	})
end)