local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: localizationStringsModule (ref), useLocalization (ref), reactModule (ref), view (ref), text (ref), button (ref), inputSize (ref), buttonVariant (ref)
	local variant = p1.variant or "active"
	local var1 = useLocalization({
		title = if variant == "complete" then localizationStringsModule.AD_CAMPAIGN_CARD_TITLE_COMPLETE else localizationStringsModule.AD_CAMPAIGN_CARD_TITLE_ACTIVE,
		description = {
			if variant == "complete" then localizationStringsModule.AD_CAMPAIGN_CARD_DESC_COMPLETE else localizationStringsModule.AD_CAMPAIGN_CARD_ACTIVE_DESC,
			startDate = p1.campaignStartDate or "",
			endDate = p1.campaignEndDate or ""
		},
		view = localizationStringsModule.AD_CAMPAIGN_CARD_VIEW
	})
	
	return reactModule.createElement(view, {
		tag = "col gap-large size-full-0 auto-y padding-large stroke-standard stroke-default radius-large bg-surface-0",
		testId = "AdCampaignIsActiveCard",
		LayoutOrder = p1.LayoutOrder
	}, {
		Content = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-xxsmall size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Text = var1.title
			}),
			Description = if variant == "complete" or (p1.campaignStartDate ~= nil and (p1.campaignStartDate ~= "" and (p1.campaignEndDate ~= nil and p1.campaignEndDate ~= ""))) then reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
				testId = "AdCampaignIsActiveCard.Schedule",
				Text = var1.description
			}) else nil
		}),
		Action = reactModule.createElement(button, {
			LayoutOrder = 2,
			testId = "AdCampaignIsActiveCard.Action",
			text = var1.view,
			size = inputSize.Small,
			variant = buttonVariant.Standard,
			width = UDim.new(1, 0),
			isDisabled = p1.isDisabled == true,
			onActivated = p1.onActivated
		})
	})
end