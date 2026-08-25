local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local gameInfosReducer = require(parent.GameInfosRodux).GameInfosReducer
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local getGameTileLayoutDataModule = require(gameTile.getGameTileLayoutData)
local getValidTileBadgesModule = require(gameTile.Overlays.getValidTileBadges)
local _ = require(gameTile.GameTileTypes)

return function(p0, p1, p2)
	-- upvalues: useSelector (ref), gameInfosReducer (ref), getGameTileLayoutDataModule (ref), reactModule (ref), getValidTileBadgesModule (ref)
	local var4 = getGameTileLayoutDataModule(useSelector(function(p3)
		-- upvalues: gameInfosReducer (copy), p0 (ref)
		return p3.Personalization[gameInfosReducer.key][p0]
	end), p1)
	
	return reactModule.useMemo(function()
		-- upvalues: p2 (ref), var4 (ref), getValidTileBadgesModule (copy)
		local tileBadgesByPosition = nil
		
		if p2 then
			tileBadgesByPosition = p2
		elseif var4 and var4.tileBadgesByPosition then
			tileBadgesByPosition = var4.tileBadgesByPosition
		end
		return if tileBadgesByPosition then getValidTileBadgesModule(tileBadgesByPosition) else nil
	end, { var4, p2 })
end