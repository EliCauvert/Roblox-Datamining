local gameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local cryoModule = require(gameDetailRodux.Parent.Cryo)
local setAgeRecommendationModule = require(gameDetailRodux.AgeRecommendations.SetAgeRecommendation)

return function(p1, p2)
	-- upvalues: setAgeRecommendationModule (ref), cryoModule (ref)
	p1 = p1 or {}
	
	if p2.type == setAgeRecommendationModule.name then
		p1 = cryoModule.Dictionary.join(p1, { [p2.universeId] = p2.ageRecommendationDetails })
	end
	return p1
end