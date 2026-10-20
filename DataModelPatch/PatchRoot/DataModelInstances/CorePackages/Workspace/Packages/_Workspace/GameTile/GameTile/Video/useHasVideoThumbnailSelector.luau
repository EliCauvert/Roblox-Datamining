local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local GameInfosReducer = require(Parent.GameInfosRodux).GameInfosReducer
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GetGameTileLayoutDataModule = require(GameTile.getGameTileLayoutData)

return function(p1, p2): boolean
	-- upvalues: UseSelectorFunction (copy), GameInfosReducer (copy), GetGameTileLayoutDataModule (copy)
	local GameTileLayoutDataModule = GetGameTileLayoutDataModule(UseSelectorFunction(function(p3)
		-- upvalues: GameInfosReducer (upval), p1 (copy)
		return p3.Personalization[GameInfosReducer.key][p1]
	end), p2)
	
	return (GameTileLayoutDataModule and (GameTileLayoutDataModule.primaryMediaAsset and GameTileLayoutDataModule.primaryMediaAsset.wideVideoAssetId)) ~= nil
end