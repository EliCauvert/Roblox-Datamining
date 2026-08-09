local authAnalytics = script:FindFirstAncestor("AuthAnalytics")
local telemetryConfigsModule = require(authAnalytics.RobloxTelemetry.TelemetryConfigs)
local loginStatus = require(authAnalytics.Parent.RobloxAppEnums).LoginStatus
local t = {
	[loginStatus.UNKNOWN] = true,
	[loginStatus.LOGGED_OUT] = true,
	[loginStatus.LOGGED_IN] = true
}

local function _(p0) --[[ line: 17 | named "normalizeAuthenticationStatusForTelemetry" ]]
	-- upvalues: t (ref)
	return if p0 == nil then "NIL" elseif t[p0] then p0 else "UNRECOGNIZED"
end

return function(p1, p2, p3) --[[ line: 27 ]]
	-- upvalues: loginStatus (ref), telemetryConfigsModule (ref), t (ref)
	return function(p4) --[[ line: 30 ]]
		-- upvalues: loginStatus (copy), p3 (ref), p1 (ref), p2 (ref), telemetryConfigsModule (copy), t (copy)
		local status = p4:getState().AuthenticationStatus.status
		
		if status == loginStatus.LOGGED_IN then
			return
		end
		p3(p1):andThen(function(_) --[[ line: 43 ]]
			-- upvalues: p2 (copy), telemetryConfigsModule (copy), status (ref), t (copy)
			p2:logRobloxTelemetryCounter(telemetryConfigsModule.ValidCookieForNoCachedUserTelemetryConfig, 1, {
				authenticationStatus = if status == nil then "NIL" elseif t[status] then status else "UNRECOGNIZED"
			})
		end):catch(function(_) --[[ line: 54 ]] end)
	end
end