local gameTile = script:FindFirstAncestor("GameTile")
local gridTileIconTextFooterModule = require(gameTile.Footer.GridTileIconTextFooter)
local getGameStatsRatingPercentageTextModule = require(gameTile.Footer.getGameStatsRatingPercentageText)
local parent = gameTile.Parent
local reactModule = require(parent.React)
local ratingSmall = require(parent.UIBlox).App.ImageSet.Images["icons/status/games/rating_small"]

return reactModule.memo(function(p0)
	-- upvalues: getGameStatsRatingPercentageTextModule (ref), reactModule (ref), gridTileIconTextFooterModule (ref), ratingSmall (ref)
	return reactModule.createElement(gridTileIconTextFooterModule, {
		Position = p0.Position,
		icon = ratingSmall,
		text = `{getGameStatsRatingPercentageTextModule(p0.totalUpVotes, p0.totalDownVotes) .. "%"} \226\128\162 {p0.genreText}`,
		useLargerFont = p0.useLargerFont,
		isUnifiedGameTile = p0.isUnifiedGameTile
	})
end)