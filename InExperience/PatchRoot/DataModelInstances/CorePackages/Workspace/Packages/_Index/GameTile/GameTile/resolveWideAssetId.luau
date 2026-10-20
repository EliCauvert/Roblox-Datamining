local GameTile = script:FindFirstAncestor("GameTile")
local GetGameTileLayoutDataModule = require(GameTile.getGameTileLayoutData)
local ItemLayoutDataParsingUtilsModule = require(GameTile.ItemLayoutDataParsingUtils)

return function(p1, p2, p3)
	-- upvalues: GetGameTileLayoutDataModule (copy), ItemLayoutDataParsingUtilsModule (copy)
	return if p1 then p1 else ItemLayoutDataParsingUtilsModule.getWideImageAssetId((GetGameTileLayoutDataModule(p2, p3))) or (p2 and p2.primaryWideAssetId or nil)
end