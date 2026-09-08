local parent = script:FindFirstAncestor("BuildExperience").Parent
local localizationService = game:GetService("LocalizationService")
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local numberLocalization = require(parent.Localization).NumberLocalization
local text = foundationModule.Text
local view = foundationModule.View

local function metricCell(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref), view (ref), text (ref), numberLocalization (ref)
	return reactModule.createElement(view, { tag = "col fill gap-xxsmall auto-y", LayoutOrder = p1 }, {
		Label = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-body-small text-align-x-left content-default",
			Text = p2
		}),
		Value = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-heading-small text-align-x-left content-emphasis",
			Text = numberLocalization.localizeDecimal(p3, p4, 0),
			testId = p5
		})
	})
end

return function(p1)
	-- upvalues: localizationService (ref), reactModule (ref), view (ref), text (ref), metricCell (ref)
	local testId = p1.testId or "PastCampaignRow"
	local robloxLocaleId = localizationService.RobloxLocaleId
	
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		Date = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-small text-align-x-left content-emphasis",
			Text = p1.dateText,
			testId = `{testId}-date`
		}),
		Metrics = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row gap-medium size-full-0 auto-y"
		}, {
			AdViews = metricCell(1, p1.labels.adViews, p1.adViews, robloxLocaleId, `{testId}-ad-views`),
			AdClicks = metricCell(2, p1.labels.adClicks, p1.adClicks, robloxLocaleId, `{testId}-ad-clicks`),
			GamePlays = metricCell(3, p1.labels.gamePlays, p1.gamePlays, robloxLocaleId, `{testId}-game-plays`)
		})
	})
end