local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local promiseModule = require(parent.Promise)
local authPlatformDisconnectModule = require(authCommon.Http.Requests.AuthPlatformDisconnect)
local enableConsoleDisconnectNetworkingErrorToast = game:DefineFastFlag("EnableConsoleDisconnectNetworkingErrorToast", false)
local setNetworkingErrorToast = require(parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast

return function(p1, p2, p3)
	-- upvalues: authPlatformDisconnectModule (ref), promiseModule (ref), enableConsoleDisconnectNetworkingErrorToast (ref), setNetworkingErrorToast (ref)
	return function(p4)
		-- upvalues: authPlatformDisconnectModule (copy), p1 (ref), p3 (ref), p2 (ref), promiseModule (copy), enableConsoleDisconnectNetworkingErrorToast (copy), setNetworkingErrorToast (copy)
		return authPlatformDisconnectModule(p1):andThen(function()
			-- upvalues: p4 (ref), p3 (copy), p1 (copy), p2 (copy), promiseModule (copy)
			p4:dispatch(p3(p1, p2))
			
			return promiseModule.resolve()
		end, function(p5)
			-- upvalues: enableConsoleDisconnectNetworkingErrorToast (copy), p4 (ref), setNetworkingErrorToast (copy), promiseModule (copy)
			if enableConsoleDisconnectNetworkingErrorToast then
				p4:dispatch(setNetworkingErrorToast(p5))
			end
			return promiseModule.reject(p5)
		end)
	end
end