local authAnalytics = script:FindFirstAncestor("AuthAnalytics")
local parent = authAnalytics.Parent
local telemetryConfigsModule = require(authAnalytics.RobloxTelemetry.TelemetryConfigs)
local loginStatus = require(parent.RobloxAppEnums).LoginStatus
local fFlagUseSignalsForAuthenticationStatus = require(parent.SharedFlags).FFlagUseSignalsForAuthenticationStatus
local var1 = if fFlagUseSignalsForAuthenticationStatus then require(parent.AuthenticationStatus).GetAuthenticationStatusStore else nil
local t = {
	[loginStatus.UNKNOWN] = true,
	[loginStatus.LOGGED_OUT] = true,
	[loginStatus.LOGGED_IN] = true
}

local function _(p1)
	-- upvalues: t (ref)
	return if p1 == nil then "NIL" elseif t[p1] then p1 else "UNRECOGNIZED"
end

return function(p1, p2, p3)
	-- upvalues: fFlagUseSignalsForAuthenticationStatus (ref), var1 (ref), loginStatus (ref), telemetryConfigsModule (ref), t (ref)
	return function(p4)
		-- upvalues: fFlagUseSignalsForAuthenticationStatus (copy), var1 (copy), loginStatus (copy), p3 (ref), p1 (ref), p2 (ref), telemetryConfigsModule (copy), t (copy)
		local var2 = if fFlagUseSignalsForAuthenticationStatus then var1(false).getStatus(false) else p4:getState().AuthenticationStatus.status
		
		if var2 == loginStatus.LOGGED_IN then
			return
		end
		p3(p1):andThen(function(_)
			-- upvalues: p2 (copy), telemetryConfigsModule (copy), var2 (ref), t (copy)
			p2:logRobloxTelemetryCounter(telemetryConfigsModule.ValidCookieForNoCachedUserTelemetryConfig, 1, {
				authenticationStatus = if var2 == nil then "NIL" elseif t[var2] then var2 else "UNRECOGNIZED"
			})
		end):catch(function(_) end)
	end
end