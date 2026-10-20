return {
	ChatGames = "ChatGames",
	Games = "Games",
	HomeGames = "HomeGames",
	GamesSeeAll = "GamesSeeAll",
	GamesList = "GamesList",
	UnifiedHomeSorts = "UnifiedHomeSorts",
	SearchLandingPage = if require(script.Parent.Parent.SharedFlags).FFlagSearchOmniAutocompletePage then "SearchLandingPage" else nil
}