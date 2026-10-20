local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local LocalizationService = game:GetService("LocalizationService")
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local NumberLocalization = require(Parent.Localization).NumberLocalization
local NoDataPlaceholderModule = require(BuildExperience.Components.Analytics.noDataPlaceholder)
local Text = FoundationModule.Text
local View = FoundationModule.View

local function metricCell(LayoutOrder, Text1, AdClicks, RobloxLocaleId, TestId)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), NumberLocalization (copy), NoDataPlaceholderModule (copy)
	return ReactModule.createElement(View, {
		tag = "col fill gap-xxsmall auto-y",
		LayoutOrder = LayoutOrder
	}, {
		Label = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-small text-align-x-left content-default",
			Text = Text1
		}),
		Value = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-heading-small text-align-x-left content-emphasis",
			Text = if AdClicks == nil then NoDataPlaceholderModule else NumberLocalization.localizeDecimal(AdClicks, RobloxLocaleId, 0),
			testId = TestId
		})
	})
end

return function(p1)
	-- upvalues: LocalizationService (copy), ReactModule (copy), View (copy), Text (copy), metricCell (copy)
	local TestId = p1.testId or "PastCampaignRow"
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	
	return ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		Date = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-small text-align-x-left content-emphasis",
			Text = p1.dateText,
			testId = `{TestId}-date`
		}),
		Metrics = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row gap-medium size-full-0 auto-y"
		}, {
			AdViews = metricCell(1, p1.labels.adViews, p1.adViews, RobloxLocaleId, `{TestId}-ad-views`),
			AdClicks = metricCell(2, p1.labels.adClicks, p1.adClicks, RobloxLocaleId, `{TestId}-ad-clicks`),
			GamePlays = metricCell(3, p1.labels.gamePlays, p1.gamePlays, RobloxLocaleId, `{TestId}-game-plays`)
		})
	})
end