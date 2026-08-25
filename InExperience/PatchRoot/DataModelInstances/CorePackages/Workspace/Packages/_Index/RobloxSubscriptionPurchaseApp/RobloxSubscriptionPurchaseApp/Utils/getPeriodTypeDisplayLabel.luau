local t = {
	month = {
		singular = "Feature.RobloxSubscription.Label.month",
		plural = "Feature.RobloxSubscription.Label.months"
	},
	year = {
		singular = "Feature.RobloxSubscription.Label.year",
		plural = "Feature.RobloxSubscription.Label.years"
	},
	week = {
		singular = "Feature.RobloxSubscription.Label.week",
		plural = "Feature.RobloxSubscription.Label.weeks"
	}
}
local t_1 = {
	singular = "Feature.RobloxSubscription.Label.month",
	plural = "Feature.RobloxSubscription.Label.months"
}

return function(p0, p1)
	-- upvalues: t (ref), t_1 (ref)
	local var2 = t[string.lower(p0)] or t_1
	
	return if p1 then var2.plural else var2.singular
end