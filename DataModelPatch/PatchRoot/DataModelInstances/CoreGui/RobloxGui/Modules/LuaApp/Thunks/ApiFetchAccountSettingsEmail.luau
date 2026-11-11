local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local GetAccountSettingsEmailModule = require(Modules.LuaApp.Http.Requests.GetAccountSettingsEmail)
local SetEmailNotificationCountModule = require(Modules.LuaApp.Actions.SetEmailNotificationCount)

return function(p1)
	-- upvalues: PerformFetch (copy), GetAccountSettingsEmailModule (copy), SetEmailNotificationCountModule (copy)
	return PerformFetch.Single("luaapp.accountsettingsapi.email", function(p2)
		-- upvalues: GetAccountSettingsEmailModule (upval), p1 (copy), SetEmailNotificationCountModule (upval)
		return GetAccountSettingsEmailModule(p1):andThen(function(Result)
			-- upvalues: p2 (copy), SetEmailNotificationCountModule (upval)
			p2:dispatch(SetEmailNotificationCountModule(if Result.responseBody.verified == false then 1 else 0))
			
			return Result
		end)
	end)
end