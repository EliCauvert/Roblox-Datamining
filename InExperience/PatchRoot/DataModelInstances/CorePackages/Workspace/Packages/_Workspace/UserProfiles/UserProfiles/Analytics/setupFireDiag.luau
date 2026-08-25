local parent = script.Parent.Parent
local socialLuaAnalyticsModule = require(parent.Parent.SocialLuaAnalytics)
local fireDiagCounter = socialLuaAnalyticsModule.Analytics.FireEvent.fireDiagCounter
local fireDiag = socialLuaAnalyticsModule.Analytics.FireEvent.fireDiag
local fFlagUserProfilesLogErrorCodesModule = require(parent.Flags.FFlagUserProfilesLogErrorCodes)
local diagCountersListModule = require(script.Parent.DiagCountersList)
local _ = require(script.Parent.EventNames)

return function(p0)
	-- upvalues: fFlagUserProfilesLogErrorCodesModule (ref), fireDiag (ref), diagCountersListModule (ref), fireDiagCounter (ref)
	if fFlagUserProfilesLogErrorCodesModule then
		local var3 = fireDiag({
			diagImpl = p0.analytics.Diag,
			eventList = diagCountersListModule
		})
		
		return function(p1, p2)
			-- upvalues: diagCountersListModule (copy), var3 (ref)
			return if diagCountersListModule[p1] then var3(p1, p2) else p1
		end
	end
	local var4 = fireDiagCounter({
		diagImpl = p0.analytics.Diag,
		eventList = diagCountersListModule
	})
	
	return function(p3)
		-- upvalues: diagCountersListModule (copy), var4 (ref)
		return if diagCountersListModule[p3] then var4(p3) else p3
	end
end