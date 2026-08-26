local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local gameInfosReducer = require(parent.GameInfosRodux).GameInfosReducer
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local getGameTileLayoutDataModule = require(gameTile.getGameTileLayoutData)
local getValidTileBadgesModule = require(gameTile.Overlays.getValidTileBadges)
local _ = require(gameTile.GameTileTypes)

return function(p1, p2, p3)
	-- upvalues: useSelector (ref), gameInfosReducer (ref), getGameTileLayoutDataModule (ref), reactModule (ref), getValidTileBadgesModule (ref)
	local var1 = getGameTileLayoutDataModule(useSelector(function(p4)
		-- upvalues: gameInfosReducer (copy), p1 (ref)
		return p4.Personalization[gameInfosReducer.key][p1]
	end), p2)
	
	return reactModule.useMemo(function()
		-- upvalues: p3 (ref), var1 (ref), getValidTileBadgesModule (copy)
		local tileBadgesByPosition = nil
		
		if p3 then
			tileBadgesByPosition = p3
		elseif var1 and var1.tileBadgesByPosition then
			tileBadgesByPosition = var1.tileBadgesByPosition
		end
		return if tileBadgesByPosition then getValidTileBadgesModule(tileBadgesByPosition) else nil
	end, { var1, p3 })
end