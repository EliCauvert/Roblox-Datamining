local Parent = script:FindFirstAncestor("GameCollections").Parent
local GameTileViewConfig = require(Parent.GameTile).GameTileViewConfig
local CollectionLayoutCalculators = require(Parent.CollectionViews).CollectionLayoutCalculators
local _ = require(Parent.Style)

return {
	calculateNumColumns = CollectionLayoutCalculators.calculateNumColumns,
	calculateTileHeightFromWidth = function(p1, _, p2, p3, p4, p5, p6, p7, p8, p9, p10)
		-- upvalues: GameTileViewConfig (copy)
		return GameTileViewConfig.getTileHeight(p3, p1, p2, p4, p5, p6, p7, p8, p9, p10)
	end,
	calculateSideMargin = CollectionLayoutCalculators.calculateSideMargin,
	calculateColumnGap = CollectionLayoutCalculators.calculateColumnGap,
	calculateVerticalPadding = CollectionLayoutCalculators.calculateVerticalPadding,
	calculateFractionalItemAmount = CollectionLayoutCalculators.calculateFractionalItemAmount,
	calculateMaxTilesToShow = CollectionLayoutCalculators.calculateMaxTilesToShow,
	calculateLoadMoreThreshold = CollectionLayoutCalculators.calculateLoadMoreThreshold
}