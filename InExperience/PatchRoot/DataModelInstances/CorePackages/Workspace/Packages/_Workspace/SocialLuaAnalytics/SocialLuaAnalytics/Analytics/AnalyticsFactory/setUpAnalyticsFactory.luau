local cryoModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.Cryo)
local analyticsFactoryModule = require(script.Parent.AnalyticsFactory)
local _ = require(script.Parent.Parent.Types)

return function(value) --[[ line: 29 | named "setUpAnalyticsFactory" ]]
	-- upvalues: cryoModule (ref), analyticsFactoryModule (ref)
	return function(p0) --[[ line: 30 ]]
		-- upvalues: cryoModule (copy), value (ref), analyticsFactoryModule (copy)
		return analyticsFactoryModule(cryoModule.Dictionary.join(value, {
			infoForAllEvents = cryoModule.Dictionary.join(value.staticInfoForAllEvents or {}, if p0 then p0.infoForAllEvents else {})
		}))
	end
end