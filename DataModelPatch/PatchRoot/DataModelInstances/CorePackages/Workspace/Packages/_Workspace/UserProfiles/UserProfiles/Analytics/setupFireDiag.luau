local Parent = script.Parent.Parent
local SocialLuaAnalyticsModule = require(Parent.Parent.SocialLuaAnalytics)
local FireDiagCounterFunction = SocialLuaAnalyticsModule.Analytics.FireEvent.fireDiagCounter
local FireDiagFunction = SocialLuaAnalyticsModule.Analytics.FireEvent.fireDiag
local FFlagUserProfilesLogErrorCodesModule = require(Parent.Flags.FFlagUserProfilesLogErrorCodes)
local DiagCountersListModule = require(script.Parent.DiagCountersList)
local _ = require(script.Parent.EventNames)

return function(p1)
	-- upvalues: FFlagUserProfilesLogErrorCodesModule (copy), FireDiagFunction (copy), DiagCountersListModule (copy), FireDiagCounterFunction (copy)
	if FFlagUserProfilesLogErrorCodesModule then
		local FireDiagResult = FireDiagFunction({
			diagImpl = p1.analytics.Diag,
			eventList = DiagCountersListModule
		})
		
		return function(p2, p3)
			-- upvalues: DiagCountersListModule (upval), FireDiagResult (copy)
			return if DiagCountersListModule[p2] then FireDiagResult(p2, p3) else p2
		end
	else
		local FireDiagCounterResult = FireDiagCounterFunction({
			diagImpl = p1.analytics.Diag,
			eventList = DiagCountersListModule
		})
		
		return function(p2)
			-- upvalues: DiagCountersListModule (upval), FireDiagCounterResult (copy)
			return if DiagCountersListModule[p2] then FireDiagCounterResult(p2) else p2
		end
	end
end