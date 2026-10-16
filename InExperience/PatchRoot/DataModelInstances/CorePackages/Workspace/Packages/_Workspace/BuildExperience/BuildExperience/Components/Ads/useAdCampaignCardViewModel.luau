local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ButtonVariant = require(Parent.Foundation).Enums.ButtonVariant

return function(p1) --[[ Line: 35 | Named "useAdCampaignCardViewModel" ]]
	-- upvalues: LocalizationStringsModule (copy), UseLocalizationFunction (copy), ButtonVariant (copy)
	local IsActive = p1.variant == "active"
	local UseLocalizationResult = UseLocalizationFunction({
		titleFree = LocalizationStringsModule.AD_CAMPAIGN_CARD_TITLE_FREE,
		titleActive = LocalizationStringsModule.AD_CAMPAIGN_CARD_TITLE_ACTIVE,
		descFree = LocalizationStringsModule.AD_CAMPAIGN_CARD_DESC_FREE,
		activeDesc = {
			LocalizationStringsModule.AD_CAMPAIGN_CARD_ACTIVE_DESC,
			startDate = if p1.campaignStartTime == nil then "" else LocalizationStringsModule.formatCampaignDate(p1.campaignStartTime),
			endDate = if p1.campaignEndTime == nil then "" else LocalizationStringsModule.formatCampaignDate(p1.campaignEndTime)
		},
		view = LocalizationStringsModule.AD_CAMPAIGN_CARD_VIEW
	})
	
	return {
		title = if IsActive then UseLocalizationResult.titleActive else UseLocalizationResult.titleFree,
		description = if IsActive then UseLocalizationResult.activeDesc else UseLocalizationResult.descFree,
		actionText = UseLocalizationResult.view,
		buttonVariant = if IsActive then ButtonVariant.Standard else ButtonVariant.SoftEmphasis,
		isLoading = p1.isPrimaryPending == true,
		onActivated = p1.onPrimary
	}
end