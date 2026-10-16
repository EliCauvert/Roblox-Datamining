local GameTile = script:FindFirstAncestor("GameTile")
local GameTileLayoutType = require(GameTile.GameTileTypes).GameTileLayoutType
local CollectionItemSize = require(GameTile.Parent.CollectionViews).CollectionViewTypes.CollectionItemSize

return function(Event) --[[ Line: 12 | Named "getGameTileCollectionItemSize" ]]
	-- upvalues: GameTileLayoutType (copy), CollectionItemSize (copy)
	return if Event == GameTileLayoutType.Narrow then CollectionItemSize.Small elseif Event == GameTileLayoutType.Wide then CollectionItemSize.Medium elseif Event == GameTileLayoutType.Event then CollectionItemSize.Large else CollectionItemSize.Small
end