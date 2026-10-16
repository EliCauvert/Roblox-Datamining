local GameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local CryoModule = require(GameDetailRodux.Parent.Cryo)
local SetAgeRecommendationHeadersModule = require(GameDetailRodux.AgeRecommendations.SetAgeRecommendationHeaders)

return function(p1, p2) --[[ Line: 7 ]]
	-- upvalues: SetAgeRecommendationHeadersModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetAgeRecommendationHeadersModule.name then
		P0 = CryoModule.Dictionary.join(P0, {
			headerDisplayName = p2.headerDisplayName,
			headerDisplayNameShort = p2.headerDisplayNameShort
		})
	end
	return P0
end