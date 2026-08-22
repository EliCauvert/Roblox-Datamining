return {
	AddGames = require(script.AddGames),
	GameInfosReducer = require(script.GameInfosReducer),
	parseAndAddGameInfos = require(script.parseAndAddGameInfos),
	syncGameInfosToStore = require(script.syncGameInfosToStore),
	toLegacyGameInfoModel = require(script.toLegacyGameInfoModel),
	useGameInfosSelector = require(script.useGameInfosSelector),
	["jest.config"] = script["jest.config"]
}