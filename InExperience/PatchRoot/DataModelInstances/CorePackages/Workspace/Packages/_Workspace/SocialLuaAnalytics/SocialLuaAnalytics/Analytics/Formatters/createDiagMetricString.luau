local SocialLuaAnalytics = script:FindFirstAncestor("SocialLuaAnalytics")
local CryoModule = require(SocialLuaAnalytics.Parent.Cryo)
local EventTypes = require(SocialLuaAnalytics.Analytics.Enums).EventTypes

return function(p1, p2): string --[[ Line: 16 | Named "createDiagMetricString" ]]
	-- upvalues: EventTypes (copy), CryoModule (copy)
	local P1 = p2 or {}
	
	return table.concat(CryoModule.Dictionary.values({
		p1 or EventTypes.LoadingTime,
		P1.fetch,
		if P1.nextPage then "nextPage" else nil,
		P1.status
	}), "_")
end