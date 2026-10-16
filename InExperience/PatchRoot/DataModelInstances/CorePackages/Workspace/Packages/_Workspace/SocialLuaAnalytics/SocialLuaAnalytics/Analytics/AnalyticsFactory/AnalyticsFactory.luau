local SocialLuaAnalytics = script:FindFirstAncestor("SocialLuaAnalytics")
local CryoModule = require(SocialLuaAnalytics.Parent.Cryo)
local CreateFireEventModule = require(SocialLuaAnalytics.Analytics.FireEvent.createFireEvent)
local _ = require(script.Parent.Parent.Types)

return function(p1) --[[ Line: 34 | Named "AnalyticsFactory" ]]
	-- upvalues: CryoModule (copy), CreateFireEventModule (copy)
	local InfoForAllEvents = p1.infoForAllEvents or {}
	
	local function GetInfoForAllEvents() --[[ Line: 42 ]]
		-- upvalues: InfoForAllEvents (ref)
		return InfoForAllEvents
	end
	
	return {
		fireAnalyticsEvent = CreateFireEventModule({
			EventStream = p1.eventLists.EventStream,
			Diag = p1.eventLists.Diag,
			Telemetry = p1.eventLists.Telemetry
		})({
			analytics = {
				EventStream = p1.analyticsImpl.EventStream,
				Diag = p1.analyticsImpl.Diag,
				Telemetry = p1.analyticsImpl.Telemetry
			},
			getInfoForAllEvents = GetInfoForAllEvents,
			loggerImpl = p1.loggerImpl
		}),
		updateInfoForAllEvents = function(p2) --[[ Line: 37 ]]
			-- upvalues: InfoForAllEvents (ref), CryoModule (upval)
			InfoForAllEvents = CryoModule.Dictionary.join(InfoForAllEvents, p2)
			
			return InfoForAllEvents
		end,
		getInfoForAllEvents = GetInfoForAllEvents
	}
end