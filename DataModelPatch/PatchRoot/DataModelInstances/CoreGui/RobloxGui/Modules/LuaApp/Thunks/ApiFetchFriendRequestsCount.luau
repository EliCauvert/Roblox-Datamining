local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PerformFetch = require(game:GetService("CorePackages").Workspace.Packages.Http).PerformFetch
local GetFriendRequestsCountModule = require(Modules.LuaApp.Http.Requests.GetFriendRequestsCount)
local SetFriendRequestsCountModule = require(Modules.LuaApp.Actions.SetFriendRequestsCount)

return function(p1)
	-- upvalues: PerformFetch (copy), GetFriendRequestsCountModule (copy), SetFriendRequestsCountModule (copy)
	return PerformFetch.Single("luaapp.friendsapi.friend-requests-count", function(p2)
		-- upvalues: GetFriendRequestsCountModule (upval), p1 (copy), SetFriendRequestsCountModule (upval)
		return GetFriendRequestsCountModule(p1):andThen(function(Result)
			-- upvalues: p2 (copy), SetFriendRequestsCountModule (upval)
			p2:dispatch(SetFriendRequestsCountModule(Result.responseBody.count))
			
			return Result
		end)
	end)
end