local config = {
	month = {
		singular = "Feature.RobloxSubscription.Label.month",
		plural = "Feature.RobloxSubscription.Label.months"
	},
	year = {
		singular = "Feature.RobloxSubscription.Label.year",
		plural = "Feature.RobloxSubscription.Label.years"
	},
	week = {
		singular = "Feature.RobloxSubscription.label.week",
		plural = "Feature.RobloxSubscription.label.weeks"
	}
}
local config1 = {
	singular = "Feature.RobloxSubscription.Label.month",
	plural = "Feature.RobloxSubscription.Label.months"
}

return function(Text: string, p1) --[[ Line: 37 | Named "getPeriodTypeDisplayLabel" ]]
	-- upvalues: config (copy), config1 (copy)
	local Entry = config[string.lower(Text)] or config1
	
	return if p1 then Entry.plural else Entry.singular
end