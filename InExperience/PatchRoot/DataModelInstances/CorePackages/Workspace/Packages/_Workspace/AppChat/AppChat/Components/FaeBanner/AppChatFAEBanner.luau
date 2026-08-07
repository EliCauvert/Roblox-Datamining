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

return reactModule.memo(function(p0) --[[ line: 71 | named "AppChatFAEBanner" ]]
	-- upvalues: useDispatch (ref), useIsInExperienceModule (ref), useCallback (ref), fetchChatMetadataModule (ref), t_1 (ref), t (ref), useSocialUpsellOverlayController (ref), reactModule (ref), startFacialAgeEstimation (ref), socialUpsellModule (ref), upsellComponent (ref), createBannerConfigFromModalConfigurationModule (ref), name (ref), t_2 (ref), t_3 (ref), foundationModule (ref), upsellBanner (ref)
	local var13 = useDispatch()
	local var14 = useIsInExperienceModule()
	local var15 = useCallback(function() --[[ line: 74 ]]
		-- upvalues: var13 (ref), fetchChatMetadataModule (copy)
		var13(fetchChatMetadataModule())
	end, { var13, fetchChatMetadataModule })
	local modalConfiguration = p0.modalConfiguration
	local var16 = if var14 then t_1[modalConfiguration.modal_variant] else t[modalConfiguration.modal_variant]
	local var17 = useSocialUpsellOverlayController(var14)
	local var18 = createBannerConfigFromModalConfigurationModule(modalConfiguration)
	
	return reactModule.createElement(foundationModule.View, { tag = t_3[modalConfiguration.modal_variant] }, {
		UpsellBanner = reactModule.createElement(upsellBanner, {
			config = var18,
			isContained = t_2[modalConfiguration.modal_variant],
			onPrimaryAction = reactModule.useCallback(function(_) --[[ line: 84 ]]
				-- upvalues: var13 (ref), startFacialAgeEstimation (copy), socialUpsellModule (copy), var16 (ref), var15 (ref), var14 (ref)
				var13(startFacialAgeEstimation(socialUpsellModule.Enums.SocialUpsellType.FacialAgeEstimation .. var16, var15, nil, var16, var14))
			end, { var13, var16, var14 }),
			onSecondaryAction = reactModule.useCallback(function(p1) --[[ line: 95 ]]
				-- upvalues: var17 (ref), socialUpsellModule (copy), var16 (ref), upsellComponent (copy)
				var17.openSocialOverlay(socialUpsellModule.Enums.SocialUpsellType.FacialAgeEstimation, {
					upsellEntrySurface = var16,
					upsellEntryComponent = upsellComponent.Banner,
					impressionId = p1
				})
			end, { var17.openSocialOverlay, var16 }),
			onDismiss = p0.onDismiss or reactModule.useCallback(function(_) --[[ line: 105 ]]
				-- upvalues: var18 (ref), name (copy)
				if not var18.isDismissable then
					name:warning("attempt to call AppChatFAEBanner onDismiss not provided and banner is not dismissable")
				end
			end, {}),
			upsellEntrySurface = var16,
			upsellEntryComponent = upsellComponent.Banner,
			conversationId = p0.conversationId
		})
	})
end)