local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local createBannerConfigFromModalConfigurationModule = require(appChat.Utils.createBannerConfigFromModalConfiguration)
local fetchChatMetadataModule = require(appChat.Conversations.Thunks.fetchChatMetadata)
local reactModule = require(parent.React)
local _ = require(appChat.types)
local name = require(appChat.Logger):new(script.Name)
local useCallback = reactModule.useCallback
local socialUpsellModule = require(parent.SocialUpsell)
local foundationModule = require(parent.Foundation)
local upsellBanner = socialUpsellModule.UpsellBanner
local startFacialAgeEstimation = socialUpsellModule.Thunks.startFacialAgeEstimation
local useSocialUpsellOverlayController = socialUpsellModule.Hooks.useSocialUpsellOverlayController
local upsellComponent = socialUpsellModule.Analytics.Enum.UpsellComponent
local upsellEntrySurfaceType = socialUpsellModule.Analytics.Enum.UpsellEntrySurfaceType
local chatLandingModalVariant = appChatNetworkingModule.Constants.ChatLandingModalVariant
local conversationBottomModal = appChatNetworkingModule.Constants.ConversationBottomModal
local t = {
	[chatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal] = upsellEntrySurfaceType.PartyTab,
	[chatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal] = upsellEntrySurfaceType.PartyTab,
	[conversationBottomModal.ConversationBottomAgeVerificationRequiredModal] = upsellEntrySurfaceType.PartyChatConversationUA,
	[conversationBottomModal.NudgeToBottomChatUpsell] = upsellEntrySurfaceType.PartyChatConversationUA
}
local t_1 = {
	[chatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal] = upsellEntrySurfaceType.PartyTabInExperience,
	[chatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal] = upsellEntrySurfaceType.PartyTabInExperience,
	[conversationBottomModal.ConversationBottomAgeVerificationRequiredModal] = upsellEntrySurfaceType.PartyChatConversationInExperience,
	[conversationBottomModal.NudgeToBottomChatUpsell] = upsellEntrySurfaceType.PartyChatConversationInExperience
}
local t_2 = {
	[chatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal] = true,
	[chatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal] = true,
	[conversationBottomModal.ConversationBottomAgeVerificationRequiredModal] = false,
	[conversationBottomModal.NudgeToBottomChatUpsell] = false
}
local t_3 = {
	[chatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal] = "padding-x-medium padding-top-xxsmall padding-bottom-large align-x-center auto-y size-full-0",
	[chatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal] = "padding-x-medium padding-top-xxsmall padding-bottom-large align-x-center auto-y size-full-0",
	[conversationBottomModal.ConversationBottomAgeVerificationRequiredModal] = "padding-large align-x-center auto-y size-full-0 stroke-standard stroke-default bg-shift-100",
	[conversationBottomModal.NudgeToBottomChatUpsell] = "padding-large align-x-center auto-y size-full-0 stroke-standard stroke-default bg-shift-100"
}

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), useIsInExperienceModule (ref), useCallback (ref), fetchChatMetadataModule (ref), t_1 (ref), t (ref), useSocialUpsellOverlayController (ref), reactModule (ref), startFacialAgeEstimation (ref), socialUpsellModule (ref), upsellComponent (ref), createBannerConfigFromModalConfigurationModule (ref), name (ref), t_2 (ref), t_3 (ref), foundationModule (ref), upsellBanner (ref)
	local var1 = useDispatch()
	local var2 = useIsInExperienceModule()
	local var3 = useCallback(function()
		-- upvalues: var1 (ref), fetchChatMetadataModule (copy)
		var1(fetchChatMetadataModule())
	end, { var1, fetchChatMetadataModule })
	local modalConfiguration = p1.modalConfiguration
	local var4 = if var2 then t_1[modalConfiguration.modal_variant] else t[modalConfiguration.modal_variant]
	local var5 = useSocialUpsellOverlayController(var2)
	local var6 = createBannerConfigFromModalConfigurationModule(modalConfiguration)
	
	return reactModule.createElement(foundationModule.View, { tag = t_3[modalConfiguration.modal_variant] }, {
		UpsellBanner = reactModule.createElement(upsellBanner, {
			config = var6,
			isContained = t_2[modalConfiguration.modal_variant],
			onPrimaryAction = reactModule.useCallback(function(_)
				-- upvalues: var1 (ref), startFacialAgeEstimation (copy), socialUpsellModule (copy), var4 (ref), var3 (ref), var2 (ref)
				var1(startFacialAgeEstimation(socialUpsellModule.Enums.SocialUpsellType.FacialAgeEstimation .. var16, var3, nil, var4, var2))
			end, { var1, var4, var2 }),
			onSecondaryAction = reactModule.useCallback(function(p2)
				-- upvalues: var5 (ref), socialUpsellModule (copy), var4 (ref), upsellComponent (copy)
				var5.openSocialOverlay(socialUpsellModule.Enums.SocialUpsellType.FacialAgeEstimation, {
					upsellEntrySurface = var4,
					upsellEntryComponent = upsellComponent.Banner,
					impressionId = p2
				})
			end, { var5.openSocialOverlay, var4 }),
			onDismiss = p1.onDismiss or reactModule.useCallback(function(_)
				-- upvalues: var6 (ref), name (copy)
				if not var6.isDismissable then
					name:warning("attempt to call AppChatFAEBanner onDismiss not provided and banner is not dismissable")
				end
			end, {}),
			upsellEntrySurface = var4,
			upsellEntryComponent = upsellComponent.Banner,
			conversationId = p1.conversationId
		})
	})
end)