local gameTile = script:FindFirstAncestor("GameTile")
local gameTileLayoutType = require(gameTile.GameTileTypes).GameTileLayoutType
local collectionItemSize = require(gameTile.Parent.CollectionViews).CollectionViewTypes.CollectionItemSize

return function(p0) --[[ line: 12 | named "getGameTileCollectionItemSize" ]]
	-- upvalues: gameTileLayoutType (ref), collectionItemSize (ref)
	return if p0 == gameTileLayoutType.Narrow then collectionItemSize.Small elseif p0 == gameTileLayoutType.Wide then collectionItemSize.Medium elseif p0 == gameTileLayoutType.Event then collectionItemSize.Large else collectionItemSize.Small
end