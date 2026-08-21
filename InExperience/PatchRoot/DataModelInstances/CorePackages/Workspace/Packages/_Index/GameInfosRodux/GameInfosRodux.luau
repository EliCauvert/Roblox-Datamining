return {
	AddGames = require(script.AddGames),
	GameInfosReducer = require(script.GameInfosReducer),
	parseAndAddGameInfos = require(script.parseAndAddGameInfos),
	toLegacyGameInfoModel = require(script.toLegacyGameInfoModel),
	useGameInfosSelector = require(script.useGameInfosSelector),
	["jest.config"] = script["jest.config"]
}