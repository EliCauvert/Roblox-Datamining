return {
	WINDOW_DAYS = math.clamp(game:DefineFastInt("BuildAdsCampaignStatsWindowDays", 60), 1, 365)
}