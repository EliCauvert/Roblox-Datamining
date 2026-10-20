local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local GetPasswordStatusModule = require(Modules.LuaApp.Http.Requests.GetPasswordStatus)
local SetPasswordNotificationCountModule = require(Modules.LuaApp.Actions.SetPasswordNotificationCount)

return function(p1)
	-- upvalues: PerformFetch (copy), GetPasswordStatusModule (copy), SetPasswordNotificationCountModule (copy)
	return PerformFetch.Single("luaapp.authapi.passwords-current-status", function(p2)
		-- upvalues: GetPasswordStatusModule (upval), p1 (copy), SetPasswordNotificationCountModule (upval)
		return GetPasswordStatusModule(p1):andThen(function(Result)
			-- upvalues: p2 (copy), SetPasswordNotificationCountModule (upval)
			p2:dispatch(SetPasswordNotificationCountModule(if Result.responseBody.valid == false then 1 else 0))
			
			return Result
		end)
	end)
end