local gameTile = script:FindFirstAncestor("GameTile")
local getGameTileLayoutDataModule = require(gameTile.getGameTileLayoutData)
local itemLayoutDataParsingUtilsModule = require(gameTile.ItemLayoutDataParsingUtils)

return function(value, p0, p1)
	-- upvalues: getGameTileLayoutDataModule (ref), itemLayoutDataParsingUtilsModule (ref)
	return value or (itemLayoutDataParsingUtilsModule.getWideImageAssetId(getGameTileLayoutDataModule(p0, p1)) or (if p0 then p0.primaryWideAssetId else nil))
end