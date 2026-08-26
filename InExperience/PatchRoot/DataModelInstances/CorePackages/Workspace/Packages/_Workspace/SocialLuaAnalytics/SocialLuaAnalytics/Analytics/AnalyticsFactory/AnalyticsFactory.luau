local socialLuaAnalytics = script:FindFirstAncestor("SocialLuaAnalytics")
local cryoModule = require(socialLuaAnalytics.Parent.Cryo)
local createFireEventModule = require(socialLuaAnalytics.Analytics.FireEvent.createFireEvent)
local _ = require(script.Parent.Parent.Types)

return function(p1)
	-- upvalues: cryoModule (ref), createFireEventModule (ref)
	local infoForAllEvents = p1.infoForAllEvents or {}
	
	local var1 = function()
		-- upvalues: infoForAllEvents (write)
		return infoForAllEvents
	end
	
	return {
		fireAnalyticsEvent = createFireEventModule({
			EventStream = p1.eventLists.EventStream,
			Diag = p1.eventLists.Diag,
			Telemetry = p1.eventLists.Telemetry
		})({
			analytics = {
				EventStream = p1.analyticsImpl.EventStream,
				Diag = p1.analyticsImpl.Diag,
				Telemetry = p1.analyticsImpl.Telemetry
			},
			getInfoForAllEvents = var1,
			loggerImpl = p1.loggerImpl
		}),
		updateInfoForAllEvents = function(p2)
			-- upvalues: infoForAllEvents (write), cryoModule (copy)
			infoForAllEvents = cryoModule.Dictionary.join(infoForAllEvents, p2)
			
			return infoForAllEvents
		end,
		getInfoForAllEvents = var1
	}
end