local gameCollections = script:FindFirstAncestor("GameCollections")
local parent = gameCollections.Parent
local _ = require(parent.Style)
local collectionViewsModule = require(parent.CollectionViews)
local gameCollectionLayoutCalculatorsModule = require(gameCollections.GameCollectionLayoutCalculators)
local collectionItemSize = collectionViewsModule.CollectionViewTypes.CollectionItemSize
local useCollectionLayoutParams = collectionViewsModule.useCollectionLayoutParams
local gameTileLayoutType = require(parent.GameTile).GameTileTypes.GameTileLayoutType
local t = {
	[gameTileLayoutType.Event] = collectionItemSize.Large,
	[gameTileLayoutType.Wide] = collectionItemSize.Medium,
	[gameTileLayoutType.Narrow] = collectionItemSize.Small
}

return function(p0, p1, p2, p3, p4) --[[ line: 29 | named "useGameCollectionLayoutParams" ]]
	-- upvalues: t (ref), collectionItemSize (ref), useCollectionLayoutParams (ref), gameCollectionLayoutCalculatorsModule (ref)
	return useCollectionLayoutParams(t[p0] or collectionItemSize.Small, p1, p2, p3, gameCollectionLayoutCalculatorsModule, p4)
end