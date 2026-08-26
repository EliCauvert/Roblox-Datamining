local gameTile = script:FindFirstAncestor("GameTile")
local gridTileIconTextFooterModule = require(gameTile.Footer.GridTileIconTextFooter)
local getGameStatsRatingPercentageTextModule = require(gameTile.Footer.getGameStatsRatingPercentageText)
local parent = gameTile.Parent
local reactModule = require(parent.React)
local ratingSmall = require(parent.UIBlox).App.ImageSet.Images["icons/status/games/rating_small"]

return reactModule.memo(function(p1)
	-- upvalues: getGameStatsRatingPercentageTextModule (ref), reactModule (ref), gridTileIconTextFooterModule (ref), ratingSmall (ref)
	return reactModule.createElement(gridTileIconTextFooterModule, {
		Position = p1.Position,
		icon = ratingSmall,
		text = `{getGameStatsRatingPercentageTextModule(p1.totalUpVotes, p1.totalDownVotes) .. "%"} \226\128\162 {p1.genreText}`,
		useLargerFont = p1.useLargerFont,
		isUnifiedGameTile = p1.isUnifiedGameTile
	})
end)