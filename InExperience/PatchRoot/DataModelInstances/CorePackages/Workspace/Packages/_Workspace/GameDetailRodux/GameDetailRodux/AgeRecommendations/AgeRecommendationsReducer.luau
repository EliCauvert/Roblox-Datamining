local GameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local CryoModule = require(GameDetailRodux.Parent.Cryo)
local SetAgeRecommendationModule = require(GameDetailRodux.AgeRecommendations.SetAgeRecommendation)

return function(p1, p2) --[[ Line: 7 ]]
	-- upvalues: SetAgeRecommendationModule (copy), CryoModule (copy)
	local P0 = p1 or {}
	
	if p2.type == SetAgeRecommendationModule.name then
		P0 = CryoModule.Dictionary.join(P0, { [p2.universeId] = p2.ageRecommendationDetails })
	end
	return P0
end