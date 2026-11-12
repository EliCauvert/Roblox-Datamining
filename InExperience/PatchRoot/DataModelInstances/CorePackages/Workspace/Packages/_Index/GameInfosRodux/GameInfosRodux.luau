return {
	AddGames = require(script.AddGames),
	GameInfosReducer = require(script.GameInfosReducer),
	parseAndAddGameInfos = require(script.parseAndAddGameInfos),
	syncGameInfosToStore = require(script.syncGameInfosToStore),
	toLegacyGameInfoModel = require(script.toLegacyGameInfoModel),
	["jest.config"] = script["jest.config"]
}