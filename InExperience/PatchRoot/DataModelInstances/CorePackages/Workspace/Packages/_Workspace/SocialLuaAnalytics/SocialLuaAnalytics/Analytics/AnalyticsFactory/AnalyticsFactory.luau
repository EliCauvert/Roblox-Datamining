local socialLuaAnalytics = script:FindFirstAncestor("SocialLuaAnalytics")
local cryoModule = require(socialLuaAnalytics.Parent.Cryo)
local createFireEventModule = require(socialLuaAnalytics.Analytics.FireEvent.createFireEvent)
local _ = require(script.Parent.Parent.Types)

return function(p0) --[[ line: 34 | named "AnalyticsFactory" ]]
	-- upvalues: cryoModule (ref), createFireEventModule (ref)
	local infoForAllEvents = p0.infoForAllEvents or {}
	
	local var4 = function() --[[ line: 42 ]]
		-- upvalues: infoForAllEvents (write)
		return infoForAllEvents
	end
	
	return {
		fireAnalyticsEvent = createFireEventModule({
			EventStream = p0.eventLists.EventStream,
			Diag = p0.eventLists.Diag,
			Telemetry = p0.eventLists.Telemetry
		})({
			analytics = {
				EventStream = p0.analyticsImpl.EventStream,
				Diag = p0.analyticsImpl.Diag,
				Telemetry = p0.analyticsImpl.Telemetry
			},
			getInfoForAllEvents = var4,
			loggerImpl = p0.loggerImpl
		}),
		updateInfoForAllEvents = function(p1) --[[ line: 37 ]]
			-- upvalues: infoForAllEvents (write), cryoModule (copy)
			infoForAllEvents = cryoModule.Dictionary.join(infoForAllEvents, p1)
			
			return infoForAllEvents
		end,
		getInfoForAllEvents = var4
	}
end