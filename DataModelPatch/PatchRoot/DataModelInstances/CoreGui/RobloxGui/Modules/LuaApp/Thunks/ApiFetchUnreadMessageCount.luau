local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local GetUnreadMessagesCountModule = require(Modules.LuaApp.Http.Requests.GetUnreadMessagesCount)
local SetUnreadMessageCountModule = require(Modules.LuaApp.Actions.SetUnreadMessageCount)

return function(p1)
	-- upvalues: PerformFetch (copy), GetUnreadMessagesCountModule (copy), SetUnreadMessageCountModule (copy)
	return PerformFetch.Single("luaapp.apiProxy.incoming-items-count", function(p2)
		-- upvalues: GetUnreadMessagesCountModule (upval), p1 (copy), SetUnreadMessageCountModule (upval)
		return GetUnreadMessagesCountModule(p1):andThen(function(Result)
			-- upvalues: p2 (copy), SetUnreadMessageCountModule (upval)
			p2:dispatch(SetUnreadMessageCountModule(Result.responseBody.count))
			
			return Result
		end)
	end)
end