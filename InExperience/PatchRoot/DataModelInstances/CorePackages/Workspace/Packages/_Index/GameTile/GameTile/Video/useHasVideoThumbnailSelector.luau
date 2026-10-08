local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local gameInfosReducer = require(parent.GameInfosRodux).GameInfosReducer
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local getGameTileLayoutDataModule = require(gameTile.getGameTileLayoutData)
local getLayoutDataVideoModule = require(gameTile.getLayoutDataVideo)
local fFlagLuaAppHomeMomentVideoFallback = require(parent.SharedFlags).FFlagLuaAppHomeMomentVideoFallback

return function(p1, p2)
	-- upvalues: useSelector (ref), gameInfosReducer (ref), getGameTileLayoutDataModule (ref), fFlagLuaAppHomeMomentVideoFallback (ref), getLayoutDataVideoModule (ref)
	local var1 = getGameTileLayoutDataModule(useSelector(function(p3)
		-- upvalues: gameInfosReducer (copy), p1 (ref)
		return p3.Personalization[gameInfosReducer.key][p1]
	end), p2)
	
	if not fFlagLuaAppHomeMomentVideoFallback then
		return (var1 and (var1.primaryMediaAsset and var1.primaryMediaAsset.wideVideoAssetId)) ~= nil
	end
	local var2 = getLayoutDataVideoModule(var1)
	
	return var2 ~= nil and var2.assetId ~= nil
end