local parent = script.Parent.Parent
local socialLuaAnalyticsModule = require(parent.Parent.SocialLuaAnalytics)
local fireDiagCounter = socialLuaAnalyticsModule.Analytics.FireEvent.fireDiagCounter
local fireDiag = socialLuaAnalyticsModule.Analytics.FireEvent.fireDiag
local fFlagUserProfilesLogErrorCodesModule = require(parent.Flags.FFlagUserProfilesLogErrorCodes)
local diagCountersListModule = require(script.Parent.DiagCountersList)
local _ = require(script.Parent.EventNames)

return function(p1)
	-- upvalues: fFlagUserProfilesLogErrorCodesModule (ref), fireDiag (ref), diagCountersListModule (ref), fireDiagCounter (ref)
	if fFlagUserProfilesLogErrorCodesModule then
		local var1 = fireDiag({
			diagImpl = p1.analytics.Diag,
			eventList = diagCountersListModule
		})
		
		return function(p2, p3)
			-- upvalues: diagCountersListModule (copy), var1 (ref)
			return if diagCountersListModule[p2] then var1(p2, p3) else p2
		end
	end
	local var2 = fireDiagCounter({
		diagImpl = p1.analytics.Diag,
		eventList = diagCountersListModule
	})
	
	return function(p2)
		-- upvalues: diagCountersListModule (copy), var2 (ref)
		return if diagCountersListModule[p2] then var2(p2) else p2
	end
end