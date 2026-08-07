local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local mutedError = require(parent.Loggers).mutedError
local flaggedMutedError = require(parent.Loggers).flaggedMutedError
local _ = require(gameTile.GameTileTypes)
local tileBadgePositionCalculators = require(gameTile.GameTileConstants).TileBadgePositionCalculators

local function _(p0) --[[ line: 13 | named "isValidTileBadgePosition" ]]
	-- upvalues: tileBadgePositionCalculators (ref), flaggedMutedError (ref)
	local var1 = tileBadgePositionCalculators[p0] ~= nil
	
	if not var1 then
		flaggedMutedError("GameTileOverlayBadgeInvalidPositionError", `Unsupported game tile badge position: {p0}`)
	end
	return var1
end

return function(p1) --[[ line: 26 | named "getValidTileBadges" ]]
	-- upvalues: tileBadgePositionCalculators (ref), flaggedMutedError (ref), mutedError (ref)
	local t = {}
	
	for i, v in p1 do
		local var3 = tileBadgePositionCalculators[i] ~= nil
		
		if not var3 then
			flaggedMutedError("GameTileOverlayBadgeInvalidPositionError", `Unsupported game tile badge position: {i}`)
		end
		if var3 and #v > 0 then
			local var4 = v[1]
			
			if var4.tileBadgeType and var4.analyticsId then
				t[i] = { v[1] }
			else
				mutedError("Invalid tile badge metadata.")
			end
		end
	end
	return t
end