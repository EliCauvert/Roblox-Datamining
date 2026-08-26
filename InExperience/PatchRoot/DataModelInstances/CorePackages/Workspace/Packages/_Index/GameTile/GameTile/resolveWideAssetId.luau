local gameTile = script:FindFirstAncestor("GameTile")
local getGameTileLayoutDataModule = require(gameTile.getGameTileLayoutData)
local itemLayoutDataParsingUtilsModule = require(gameTile.ItemLayoutDataParsingUtils)

return function(value, p1, p2)
	-- upvalues: getGameTileLayoutDataModule (ref), itemLayoutDataParsingUtilsModule (ref)
	return value or (itemLayoutDataParsingUtilsModule.getWideImageAssetId(getGameTileLayoutDataModule(p1, p2)) or (if p1 then p1.primaryWideAssetId else nil))
end