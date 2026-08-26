local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local mutedError = require(parent.Loggers).mutedError
local flaggedMutedError = require(parent.Loggers).flaggedMutedError
local _ = require(gameTile.GameTileTypes)
local tileBadgePositionCalculators = require(gameTile.GameTileConstants).TileBadgePositionCalculators

local function _(p1)
	-- upvalues: tileBadgePositionCalculators (ref), flaggedMutedError (ref)
	local var1 = tileBadgePositionCalculators[p1] ~= nil
	
	if not var1 then
		flaggedMutedError("GameTileOverlayBadgeInvalidPositionError", `Unsupported game tile badge position: {p1}`)
	end
	return var1
end

return function(p1)
	-- upvalues: tileBadgePositionCalculators (ref), flaggedMutedError (ref), mutedError (ref)
	local t = {}
	
	for i, v in p1 do
		local var1 = tileBadgePositionCalculators[i] ~= nil
		
		if not var1 then
			flaggedMutedError("GameTileOverlayBadgeInvalidPositionError", `Unsupported game tile badge position: {i}`)
		end
		if var1 and #v > 0 then
			local var2 = v[1]
			
			if var2.tileBadgeType and var2.analyticsId then
				t[i] = { v[1] }
			else
				mutedError("Invalid tile badge metadata.")
			end
		end
	end
	return t
end