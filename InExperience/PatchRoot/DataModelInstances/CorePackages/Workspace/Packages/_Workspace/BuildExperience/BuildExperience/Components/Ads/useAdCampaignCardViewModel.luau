local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: localizationStringsModule (ref), useLocalization (ref), buttonVariant (ref)
	local isActive = p1.variant == "active"
	local var1 = useLocalization({
		titleFree = localizationStringsModule.AD_CAMPAIGN_CARD_TITLE_FREE,
		titleActive = localizationStringsModule.AD_CAMPAIGN_CARD_TITLE_ACTIVE,
		descFree = localizationStringsModule.AD_CAMPAIGN_CARD_DESC_FREE,
		activeDesc = {
			localizationStringsModule.AD_CAMPAIGN_CARD_ACTIVE_DESC,
			startDate = if p1.campaignStartTime ~= nil then "" else localizationStringsModule.formatCampaignDate(p1.campaignStartTime),
			endDate = if p1.campaignEndTime ~= nil then "" else localizationStringsModule.formatCampaignDate(p1.campaignEndTime)
		},
		view = localizationStringsModule.AD_CAMPAIGN_CARD_VIEW
	})
	
	return {
		title = if isActive then var1.titleActive else var1.titleFree,
		description = if isActive then var1.activeDesc else var1.descFree,
		actionText = var1.view,
		buttonVariant = if isActive then buttonVariant.Standard else buttonVariant.SoftEmphasis,
		isLoading = p1.isPrimaryPending == true,
		onActivated = p1.onPrimary
	}
end