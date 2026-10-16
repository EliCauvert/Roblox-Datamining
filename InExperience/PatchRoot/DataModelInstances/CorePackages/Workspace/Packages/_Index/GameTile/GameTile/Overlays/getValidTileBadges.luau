local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local MutedErrorFunction = require(Parent.Loggers).mutedError
local FlaggedMutedErrorFunction = require(Parent.Loggers).flaggedMutedError
local _ = require(GameTile.GameTileTypes)
local TileBadgePositionCalculators = require(GameTile.GameTileConstants).TileBadgePositionCalculators

local function _(p1): boolean --[[ Line: 13 | Named "isValidTileBadgePosition" ]]
	-- upvalues: TileBadgePositionCalculators (copy), FlaggedMutedErrorFunction (copy)
	local HasTileBadgePositionCalculator = TileBadgePositionCalculators[p1] ~= nil
	
	if not HasTileBadgePositionCalculator then
		FlaggedMutedErrorFunction("GameTileOverlayBadgeInvalidPositionError", `Unsupported game tile badge position: {p1}`)
	end
	return HasTileBadgePositionCalculator
end

return function(List) --[[ Line: 26 | Named "getValidTileBadges" ]]
	-- upvalues: TileBadgePositionCalculators (copy), FlaggedMutedErrorFunction (copy), MutedErrorFunction (copy)
	local t = {}
	
	for i, value in List do
		local HasTileBadgePositionCalculator = TileBadgePositionCalculators[i] ~= nil
		
		if not HasTileBadgePositionCalculator then
			FlaggedMutedErrorFunction("GameTileOverlayBadgeInvalidPositionError", `Unsupported game tile badge position: {i}`)
		end
		if HasTileBadgePositionCalculator and #value > 0 then
			local Entry = value[1]
			
			if Entry.tileBadgeType and Entry.analyticsId then
				t[i] = { value[1] }
			else
				MutedErrorFunction("Invalid tile badge metadata.")
			end
		end
	end
	return t
end