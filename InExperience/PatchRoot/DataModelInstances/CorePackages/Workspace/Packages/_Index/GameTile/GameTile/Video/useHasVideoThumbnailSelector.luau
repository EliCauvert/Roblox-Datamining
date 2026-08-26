local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local gameInfosReducer = require(parent.GameInfosRodux).GameInfosReducer
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local getGameTileLayoutDataModule = require(gameTile.getGameTileLayoutData)

return function(p1, p2)
	-- upvalues: useSelector (ref), gameInfosReducer (ref), getGameTileLayoutDataModule (ref)
	local var1 = getGameTileLayoutDataModule(useSelector(function(p3)
		-- upvalues: gameInfosReducer (copy), p1 (ref)
		return p3.Personalization[gameInfosReducer.key][p1]
	end), p2)
	
	return (var1 and (var1.primaryMediaAsset and var1.primaryMediaAsset.wideVideoAssetId)) ~= nil
end