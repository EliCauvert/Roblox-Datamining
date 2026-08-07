local gameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local cryoModule = require(gameDetailRodux.Parent.Cryo)
local setAgeRecommendationModule = require(gameDetailRodux.AgeRecommendations.SetAgeRecommendation)

return function(p0, p1) --[[ line: 7 ]]
	-- upvalues: setAgeRecommendationModule (ref), cryoModule (ref)
	p0 = p0 or {}
	
	if p1.type == setAgeRecommendationModule.name then
		p0 = cryoModule.Dictionary.join(p0, { [p1.universeId] = p1.ageRecommendationDetails })
	end
	return p0
end