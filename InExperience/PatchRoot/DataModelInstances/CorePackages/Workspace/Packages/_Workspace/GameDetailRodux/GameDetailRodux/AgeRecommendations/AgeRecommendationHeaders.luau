local gameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local cryoModule = require(gameDetailRodux.Parent.Cryo)
local setAgeRecommendationHeadersModule = require(gameDetailRodux.AgeRecommendations.SetAgeRecommendationHeaders)

return function(p1, p2)
	-- upvalues: setAgeRecommendationHeadersModule (ref), cryoModule (ref)
	p1 = p1 or {}
	
	if p2.type == setAgeRecommendationHeadersModule.name then
		p1 = cryoModule.Dictionary.join(p1, {
			headerDisplayName = p2.headerDisplayName,
			headerDisplayNameShort = p2.headerDisplayNameShort
		})
	end
	return p1
end