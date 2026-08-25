local socialLuaAnalytics = script:FindFirstAncestor("SocialLuaAnalytics")
local cryoModule = require(socialLuaAnalytics.Parent.Cryo)
local eventTypes = require(socialLuaAnalytics.Analytics.Enums).EventTypes

return function(p0, p1)
	-- upvalues: eventTypes (ref), cryoModule (ref)
	p1 = p1 or {}
	
	return table.concat(cryoModule.Dictionary.values({
		p0 or eventTypes.LoadingTime,
		p1.fetch,
		if p1.nextPage then "nextPage" else nil,
		p1.status
	}), "_")
end