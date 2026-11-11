local CryoModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.Cryo)
local AnalyticsFactoryModule = require(script.Parent.AnalyticsFactory)
local _ = require(script.Parent.Parent.Types)

return function(p1)
	-- upvalues: CryoModule (copy), AnalyticsFactoryModule (copy)
	return function(p2)
		-- upvalues: CryoModule (upval), p1 (copy), AnalyticsFactoryModule (upval)
		return AnalyticsFactoryModule(CryoModule.Dictionary.join(p1, {
			infoForAllEvents = CryoModule.Dictionary.join(p1.staticInfoForAllEvents or {}, p2 and p2.infoForAllEvents or {})
		}))
	end
end