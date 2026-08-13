return {
	useGameInfo = require(script.useGameInfo),
	useGameInfos = require(script.useGameInfos),
	useGameVotes = require(script.useGameVotes),
	useGameIcon = require(script.useGameIcon),
	useLargeGameIcon = require(script.useLargeGameIcon),
	useGameIcons = require(script.useGameIcons),
	useFetchGameIcons = require(script.useFetchGameIcons),
	subscribeGameInfo = require(script.subscribeGameInfo),
	subscribeGameIcon = require(script.subscribeGameIcon),
	subscribeGameIcons = require(script.subscribeGameIcons),
	GameIconSize = require(script.Parent.DataHydration).Game.GameIconSize,
	["jest.config"] = script["jest.config"]
}