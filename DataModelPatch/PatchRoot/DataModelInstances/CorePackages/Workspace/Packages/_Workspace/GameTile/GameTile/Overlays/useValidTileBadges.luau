local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local GameInfosReducer = require(Parent.GameInfosRodux).GameInfosReducer
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GetGameTileLayoutDataModule = require(GameTile.getGameTileLayoutData)
local GetValidTileBadgesModule = require(GameTile.Overlays.getValidTileBadges)
local _ = require(GameTile.GameTileTypes)

return function(p1, p2, p3)
	-- upvalues: UseSelectorFunction (copy), GameInfosReducer (copy), GetGameTileLayoutDataModule (copy), ReactModule (copy), GetValidTileBadgesModule (copy)
	local GameTileLayoutDataModule = GetGameTileLayoutDataModule(UseSelectorFunction(function(p4)
		-- upvalues: GameInfosReducer (upval), p1 (copy)
		return p4.Personalization[GameInfosReducer.key][p1]
	end), p2)
	
	return (ReactModule.useMemo(function()
		-- upvalues: p3 (copy), GameTileLayoutDataModule (copy), GetValidTileBadgesModule (upval)
		local TileBadgesByPosition = if p3 then p3 elseif GameTileLayoutDataModule and GameTileLayoutDataModule.tileBadgesByPosition then GameTileLayoutDataModule.tileBadgesByPosition else nil
		
		return if TileBadgesByPosition then GetValidTileBadgesModule(TileBadgesByPosition) else nil
	end, { GameTileLayoutDataModule, p3 }))
end