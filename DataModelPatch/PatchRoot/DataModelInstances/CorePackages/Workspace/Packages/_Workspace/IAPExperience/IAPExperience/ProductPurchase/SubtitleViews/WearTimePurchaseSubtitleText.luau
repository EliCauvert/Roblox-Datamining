local Parent = script:FindFirstAncestor("IAPExperience").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local Enums = FoundationModule.Enums

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), View (copy), Icon (copy), Enums (copy), Text (copy)
	local TimedOptionDays = p1.timedOptionDays
	local UseLocalizationResult = UseLocalizationFunction({
		infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite",
		timedOptionText = {
			"Feature.Durables.UnifiedBuyModal.Subtitle.TimedOptionText",
			days = TimedOptionDays or 0
		}
	})
	
	return ReactModule.createElement(View, {
		tag = "row auto-xy align-y-center gap-xsmall",
		LayoutOrder = 2
	}, {
		ClockIcon = if TimedOptionDays then ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = Enums.IconName.Clock,
			size = Enums.IconSize.Small
		}) else nil,
		DurationText = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "auto-xy text-title-small content-default",
			Text = if TimedOptionDays and TimedOptionDays ~= 0 then UseLocalizationResult.timedOptionText else UseLocalizationResult.infinite
		})
	})
end