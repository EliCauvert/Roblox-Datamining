local cryoModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.Cryo)
local analyticsFactoryModule = require(script.Parent.AnalyticsFactory)
local _ = require(script.Parent.Parent.Types)

return function(value)
	-- upvalues: cryoModule (ref), analyticsFactoryModule (ref)
	return function(p0)
		-- upvalues: cryoModule (copy), value (ref), analyticsFactoryModule (copy)
		return analyticsFactoryModule(cryoModule.Dictionary.join(value, {
			infoForAllEvents = cryoModule.Dictionary.join(value.staticInfoForAllEvents or {}, if p0 then p0.infoForAllEvents else {})
		}))
	end
end