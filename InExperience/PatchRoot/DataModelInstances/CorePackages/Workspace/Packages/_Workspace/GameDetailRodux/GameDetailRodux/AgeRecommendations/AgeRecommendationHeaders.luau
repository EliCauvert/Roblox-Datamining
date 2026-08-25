local gameDetailRodux = script:FindFirstAncestor("GameDetailRodux")
local cryoModule = require(gameDetailRodux.Parent.Cryo)
local setAgeRecommendationHeadersModule = require(gameDetailRodux.AgeRecommendations.SetAgeRecommendationHeaders)

return function(p0, p1)
	-- upvalues: setAgeRecommendationHeadersModule (ref), cryoModule (ref)
	p0 = p0 or {}
	
	if p1.type == setAgeRecommendationHeadersModule.name then
		p0 = cryoModule.Dictionary.join(p0, {
			headerDisplayName = p1.headerDisplayName,
			headerDisplayNameShort = p1.headerDisplayNameShort
		})
	end
	return p0
end