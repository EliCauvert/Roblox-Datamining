local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local promiseModule = require(parent.Promise)
local authPlatformDisconnectModule = require(authCommon.Http.Requests.AuthPlatformDisconnect)
local enableConsoleDisconnectNetworkingErrorToast = game:DefineFastFlag("EnableConsoleDisconnectNetworkingErrorToast", false)
local setNetworkingErrorToast = require(parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast

return function(p0, p1, p2) --[[ line: 12 | named "ConsoleDisconnect" ]]
	-- upvalues: authPlatformDisconnectModule (ref), promiseModule (ref), enableConsoleDisconnectNetworkingErrorToast (ref), setNetworkingErrorToast (ref)
	return function(p3) --[[ line: 13 ]]
		-- upvalues: authPlatformDisconnectModule (copy), p0 (ref), p2 (ref), p1 (ref), promiseModule (copy), enableConsoleDisconnectNetworkingErrorToast (copy), setNetworkingErrorToast (copy)
		return authPlatformDisconnectModule(p0):andThen(function() --[[ line: 14 ]]
			-- upvalues: p3 (ref), p2 (copy), p0 (copy), p1 (copy), promiseModule (copy)
			p3:dispatch(p2(p0, p1))
			
			return promiseModule.resolve()
		end, function(p4) --[[ line: 19 ]]
			-- upvalues: enableConsoleDisconnectNetworkingErrorToast (copy), p3 (ref), setNetworkingErrorToast (copy), promiseModule (copy)
			if enableConsoleDisconnectNetworkingErrorToast then
				p3:dispatch(setNetworkingErrorToast(p4))
			end
			return promiseModule.reject(p4)
		end)
	end
end