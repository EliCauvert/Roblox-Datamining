local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local Button = FoundationModule.Button
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize

return function(Frame)
	-- upvalues: LocalizationStringsModule (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), Text (copy), Button (copy), InputSize (copy), ButtonVariant (copy)
	local Variant = Frame.variant or "active"
	local IsNotCampaignEndDateMatch: boolean = Frame.campaignStartDate ~= nil and (Frame.campaignStartDate ~= "" and (Frame.campaignEndDate ~= nil and Frame.campaignEndDate ~= ""))
	local UseLocalizationResult = UseLocalizationFunction({
		title = if Variant == "complete" then LocalizationStringsModule.AD_CAMPAIGN_CARD_TITLE_COMPLETE else LocalizationStringsModule.AD_CAMPAIGN_CARD_TITLE_ACTIVE,
		description = {
			if Variant == "complete" then LocalizationStringsModule.AD_CAMPAIGN_CARD_DESC_COMPLETE else LocalizationStringsModule.AD_CAMPAIGN_CARD_ACTIVE_DESC,
			startDate = Frame.campaignStartDate or "",
			endDate = Frame.campaignEndDate or ""
		},
		view = LocalizationStringsModule.AD_CAMPAIGN_CARD_VIEW
	})
	
	return ReactModule.createElement(View, {
		tag = "col gap-large size-full-0 auto-y padding-large stroke-standard stroke-default radius-large bg-surface-0",
		testId = "AdCampaignIsActiveCard",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Content = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col gap-xxsmall size-full-0 auto-y"
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Text = UseLocalizationResult.title
			}),
			Description = if Variant == "complete" or IsNotCampaignEndDateMatch then ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
				testId = "AdCampaignIsActiveCard.Schedule",
				Text = UseLocalizationResult.description
			}) else nil
		}),
		Action = ReactModule.createElement(Button, {
			LayoutOrder = 2,
			testId = "AdCampaignIsActiveCard.Action",
			text = UseLocalizationResult.view,
			size = InputSize.Small,
			variant = ButtonVariant.Standard,
			width = UDim.new(1, 0),
			isDisabled = Frame.isDisabled == true,
			onActivated = Frame.onActivated
		})
	})
end