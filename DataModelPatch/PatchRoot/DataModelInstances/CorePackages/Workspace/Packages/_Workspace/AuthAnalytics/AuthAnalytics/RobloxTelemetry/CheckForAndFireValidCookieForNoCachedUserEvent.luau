local AuthAnalytics = script:FindFirstAncestor("AuthAnalytics")
local TelemetryConfigsModule = require(AuthAnalytics.RobloxTelemetry.TelemetryConfigs)
local LoginStatus = require(AuthAnalytics.Parent.RobloxAppEnums).LoginStatus
local config = {
	[LoginStatus.UNKNOWN] = true,
	[LoginStatus.LOGGED_OUT] = true,
	[LoginStatus.LOGGED_IN] = true
}

local function _(p1)
	-- upvalues: config (copy)
	return if p1 == nil then "NIL" elseif config[p1] then p1 else "UNRECOGNIZED"
end

return function(p1, p2, Callback)
	-- upvalues: LoginStatus (copy), TelemetryConfigsModule (copy), config (copy)
	return function(p3)
		-- upvalues: LoginStatus (upval), Callback (copy), p1 (copy), p2 (copy), TelemetryConfigsModule (upval), config (upval)
		local Status = p3:getState().AuthenticationStatus.status
		
		if Status ~= LoginStatus.LOGGED_IN then
			Callback(p1):andThen(function(_)
				-- upvalues: p2 (upval), TelemetryConfigsModule (upval), Status (copy), config (upval)
				p2:logRobloxTelemetryCounter(TelemetryConfigsModule.ValidCookieForNoCachedUserTelemetryConfig, 1, {
					authenticationStatus = if Status == nil then "NIL" elseif config[Status] then Status else "UNRECOGNIZED"
				})
			end):catch(function(_) end)
			
			return
		end
	end
end