local parent = script:FindFirstAncestor("GameCollections").Parent
local gameTileViewConfig = require(parent.GameTile).GameTileViewConfig
local collectionLayoutCalculators = require(parent.CollectionViews).CollectionLayoutCalculators
local _ = require(parent.Style)

return {
	calculateNumColumns = collectionLayoutCalculators.calculateNumColumns,
	calculateTileHeightFromWidth = function(p1, _, p2, p3, p4, p5, p6, p7, p8, p9, p10)
		-- upvalues: gameTileViewConfig (ref)
		return gameTileViewConfig.getTileHeight(p3, p1, p2, p4, p5, p6, p7, p8, p9, p10)
	end,
	calculateSideMargin = collectionLayoutCalculators.calculateSideMargin,
	calculateColumnGap = collectionLayoutCalculators.calculateColumnGap,
	calculateVerticalPadding = collectionLayoutCalculators.calculateVerticalPadding,
	calculateFractionalItemAmount = collectionLayoutCalculators.calculateFractionalItemAmount,
	calculateMaxTilesToShow = collectionLayoutCalculators.calculateMaxTilesToShow,
	calculateLoadMoreThreshold = collectionLayoutCalculators.calculateLoadMoreThreshold
}