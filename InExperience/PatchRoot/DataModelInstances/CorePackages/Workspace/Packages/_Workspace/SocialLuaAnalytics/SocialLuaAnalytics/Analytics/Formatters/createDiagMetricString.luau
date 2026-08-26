local socialLuaAnalytics = script:FindFirstAncestor("SocialLuaAnalytics")
local cryoModule = require(socialLuaAnalytics.Parent.Cryo)
local eventTypes = require(socialLuaAnalytics.Analytics.Enums).EventTypes

return function(p1, p2)
	-- upvalues: eventTypes (ref), cryoModule (ref)
	p2 = p2 or {}
	
	return table.concat(cryoModule.Dictionary.values({
		p1 or eventTypes.LoadingTime,
		p2.fetch,
		if p2.nextPage then "nextPage" else nil,
		p2.status
	}), "_")
end