local Frozen = table.freeze({ analytics = "Feature.Moments.Action.Analytics" })

return table.freeze({
	DURATION_SECONDS_KEY = "Feature.Moments.Label.DurationSeconds",
	MENU_KEYS = Frozen,
	PAGE_KEYS = table.freeze({
		overview = "Feature.Moments.Label.Overview",
		engagement = "Feature.Moments.Label.Engagement",
		totalViews = "Feature.Moments.Label.TotalViews",
		averageWatchTime = "Feature.Moments.Label.AverageWatchTime",
		averageCompletion = "Feature.Moments.Label.AverageCompletion",
		gameJoinConversion = "Feature.Moments.Label.GameJoinConversion",
		totalReactions = "Feature.Moments.Label.TotalReactions",
		title = Frozen.analytics
	}),
	TOOLTIP_KEYS = table.freeze({
		title = "Feature.Moments.Tooltip.PostInsightsTitle",
		text = "Feature.Moments.Tooltip.PostInsightsBody"
	})
})