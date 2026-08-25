local parent = script:FindFirstAncestor("IAPExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local enums = foundationModule.Enums

return function(p0)
	-- upvalues: useLocalization (ref), reactModule (ref), view (ref), icon (ref), enums (ref), text (ref)
	local timedOptionDays = p0.timedOptionDays
	local var2 = useLocalization({
		infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite",
		timedOptionText = {
			"Feature.Durables.UnifiedBuyModal.Subtitle.TimedOptionText",
			days = timedOptionDays or 0
		}
	})
	
	return reactModule.createElement(view, {
		tag = "row auto-xy align-y-center gap-xsmall",
		LayoutOrder = 2
	}, {
		ClockIcon = if timedOptionDays then reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = enums.IconName.Clock,
			size = enums.IconSize.Small
		}) else nil,
		DurationText = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-xy text-title-small content-default",
			Text = if timedOptionDays and timedOptionDays ~= 0 then var2.timedOptionText else var2.infinite
		})
	})
end