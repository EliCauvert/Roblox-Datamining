local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local PromiseModule = require(Parent.Promise)
local AuthPlatformDisconnectModule = require(AuthCommon.Http.Requests.AuthPlatformDisconnect)
local EnableConsoleDisconnectNetworkingErrorToast = game:DefineFastFlag("EnableConsoleDisconnectNetworkingErrorToast", false)
local SetNetworkingErrorToastFunction = require(Parent.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast

return function(p1, p2, Callback) --[[ Line: 12 | Named "ConsoleDisconnect" ]]
	-- upvalues: AuthPlatformDisconnectModule (copy), PromiseModule (copy), EnableConsoleDisconnectNetworkingErrorToast (copy), SetNetworkingErrorToastFunction (copy)
	return function(p3) --[[ Line: 13 ]]
		-- upvalues: AuthPlatformDisconnectModule (upval), p1 (copy), Callback (copy), p2 (copy), PromiseModule (upval), EnableConsoleDisconnectNetworkingErrorToast (upval), SetNetworkingErrorToastFunction (upval)
		return AuthPlatformDisconnectModule(p1):andThen(function() --[[ Line: 14 ]]
			-- upvalues: p3 (copy), Callback (upval), p1 (upval), p2 (upval), PromiseModule (upval)
			p3:dispatch(Callback(p1, p2))
			
			return PromiseModule.resolve()
		end, function(p4) --[[ Line: 19 ]]
			-- upvalues: EnableConsoleDisconnectNetworkingErrorToast (upval), p3 (copy), SetNetworkingErrorToastFunction (upval), PromiseModule (upval)
			if EnableConsoleDisconnectNetworkingErrorToast then
				p3:dispatch(SetNetworkingErrorToastFunction(p4))
			end
			return PromiseModule.reject(p4)
		end)
	end
end