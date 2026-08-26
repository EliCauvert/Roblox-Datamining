local gameTile = script:FindFirstAncestor("GameTile")
local gameTileLayoutType = require(gameTile.GameTileTypes).GameTileLayoutType
local collectionItemSize = require(gameTile.Parent.CollectionViews).CollectionViewTypes.CollectionItemSize

return function(p1)
	-- upvalues: gameTileLayoutType (ref), collectionItemSize (ref)
	return if p1 == gameTileLayoutType.Narrow then collectionItemSize.Small elseif p1 == gameTileLayoutType.Wide then collectionItemSize.Medium elseif p1 == gameTileLayoutType.Event then collectionItemSize.Large else collectionItemSize.Small
end