local GameTile = script:FindFirstAncestor("GameTile")
local GridTileIconTextFooterModule = require(GameTile.Footer.GridTileIconTextFooter)
local GetGameStatsRatingPercentageTextModule = require(GameTile.Footer.getGameStatsRatingPercentageText)
local Parent = GameTile.Parent
local ReactModule = require(Parent.React)
local IconsStatusGamesRatingSmall = require(Parent.UIBlox).App.ImageSet.Images["icons/status/games/rating_small"]

return ReactModule.memo(function(p1)
	-- upvalues: GetGameStatsRatingPercentageTextModule (copy), ReactModule (copy), GridTileIconTextFooterModule (copy), IconsStatusGamesRatingSmall (copy)
	return ReactModule.createElement(GridTileIconTextFooterModule, {
		Position = p1.Position,
		icon = IconsStatusGamesRatingSmall,
		text = `{GetGameStatsRatingPercentageTextModule(p1.totalUpVotes, p1.totalDownVotes) .. "%"} • {p1.genreText}`,
		useLargerFont = p1.useLargerFont,
		isUnifiedGameTile = p1.isUnifiedGameTile
	})
end)