local GameCollections = script:FindFirstAncestor("GameCollections")
local Parent = GameCollections.Parent
local _ = require(Parent.Style)
local CollectionViewsModule = require(Parent.CollectionViews)
local GameCollectionLayoutCalculatorsModule = require(GameCollections.GameCollectionLayoutCalculators)
local CollectionItemSize = CollectionViewsModule.CollectionViewTypes.CollectionItemSize
local UseCollectionLayoutParamsFunction = CollectionViewsModule.useCollectionLayoutParams
local GameTileLayoutType = require(Parent.GameTile).GameTileTypes.GameTileLayoutType
local config = {
	[GameTileLayoutType.Event] = CollectionItemSize.Large,
	[GameTileLayoutType.Wide] = CollectionItemSize.Medium,
	[GameTileLayoutType.Narrow] = CollectionItemSize.Small
}

return function(p1, p2, p3, p4, p5)
	-- upvalues: config (copy), CollectionItemSize (copy), UseCollectionLayoutParamsFunction (copy), GameCollectionLayoutCalculatorsModule (copy)
	return UseCollectionLayoutParamsFunction(config[p1] or CollectionItemSize.Small, p2, p3, p4, GameCollectionLayoutCalculatorsModule, p5)
end