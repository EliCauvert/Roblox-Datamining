local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p0) --[[ line: 35 | named "useAdCampaignCardViewModel" ]]
	-- upvalues: localizationStringsModule (ref), useLocalization (ref), buttonVariant (ref)
	local isActive = p0.variant == "active"
	local var4 = useLocalization({
		titleFree = localizationStringsModule.AD_CAMPAIGN_CARD_TITLE_FREE,
		titleActive = localizationStringsModule.AD_CAMPAIGN_CARD_TITLE_ACTIVE,
		descFree = localizationStringsModule.AD_CAMPAIGN_CARD_DESC_FREE,
		activeDesc = {
			localizationStringsModule.AD_CAMPAIGN_CARD_ACTIVE_DESC,
			startDate = if p0.campaignStartTime ~= nil then "" else localizationStringsModule.formatCampaignDate(p0.campaignStartTime),
			endDate = if p0.campaignEndTime ~= nil then "" else localizationStringsModule.formatCampaignDate(p0.campaignEndTime)
		},
		view = localizationStringsModule.AD_CAMPAIGN_CARD_VIEW
	})
	
	return {
		title = if isActive then var4.titleActive else var4.titleFree,
		description = if isActive then var4.activeDesc else var4.descFree,
		actionText = var4.view,
		buttonVariant = if isActive then buttonVariant.Standard else buttonVariant.SoftEmphasis,
		isLoading = p0.isPrimaryPending == true,
		onActivated = p0.onPrimary
	}
end