local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local gameInfosReducer = require(parent.GameInfosRodux).GameInfosReducer
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local getGameTileLayoutDataModule = require(gameTile.getGameTileLayoutData)

return function(p0, p1) --[[ line: 10 | named "useHasVideoThumbnailSelector" ]]
	-- upvalues: useSelector (ref), gameInfosReducer (ref), getGameTileLayoutDataModule (ref)
	local var2 = getGameTileLayoutDataModule(useSelector(function(p2) --[[ line: 11 ]]
		-- upvalues: gameInfosReducer (copy), p0 (ref)
		return p2.Personalization[gameInfosReducer.key][p0]
	end), p1)
	
	return (var2 and (var2.primaryMediaAsset and var2.primaryMediaAsset.wideVideoAssetId)) ~= nil
end