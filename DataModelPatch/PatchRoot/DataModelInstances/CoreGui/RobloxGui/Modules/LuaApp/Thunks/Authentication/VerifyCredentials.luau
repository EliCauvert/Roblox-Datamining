local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local AuthVerifyCredentialsModule = require(Modules.LuaApp.Http.Requests.AuthVerifyCredentials)

return function(p1, p2, p3, p4)
	-- upvalues: AuthVerifyCredentialsModule (copy), SetNetworkingErrorToastModule (copy)
	return function(p5)
		-- upvalues: AuthVerifyCredentialsModule (upval), p1 (copy), p2 (copy), p3 (copy), p4 (copy), SetNetworkingErrorToastModule (upval)
		return AuthVerifyCredentialsModule(p1, p2, p3, p4):andThen(nil, function(p6)
			-- upvalues: p5 (copy), SetNetworkingErrorToastModule (upval)
			p5:dispatch(SetNetworkingErrorToastModule(p6))
		end)
	end
end