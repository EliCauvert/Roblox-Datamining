local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local FriendsPostRequestFriendshipModule = require(Modules.LuaApp.Http.Requests.FriendsPostRequestFriendship)
local AddFriendStatusModule = require(Modules.LuaApp.Actions.AddFriendStatus)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return function(p1, Text, p2)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), FriendsPostRequestFriendshipModule (copy), AddFriendStatusModule (copy), SetNetworkingErrorToastModule (copy), PromiseModule (copy)
	ArgCheckModule.isType(Text, "string", "Thunks.RequestFriendship.userId")
	
	return PerformFetch.Single("luaapp.friends.requestfriendship." .. Text, function(p3)
		-- upvalues: p2 (copy), FriendsPostRequestFriendshipModule (upval), p1 (copy), Text (copy), AddFriendStatusModule (upval), SetNetworkingErrorToastModule (upval), PromiseModule (upval)
		return (FriendsPostRequestFriendshipModule(p1, Text, p2 or "PlayerSearch"):andThen(function(Result)
			-- upvalues: p3 (copy), AddFriendStatusModule (upval), Text (upval)
			if Result and Result.responseBody and Result.responseBody.success == true then
				p3:dispatch(AddFriendStatusModule(Text, Enum.FriendStatus.FriendRequestSent))
			end
			return Result
		end, function(p4)
			-- upvalues: p3 (copy), SetNetworkingErrorToastModule (upval), PromiseModule (upval)
			p3:dispatch(SetNetworkingErrorToastModule(p4))
			
			return PromiseModule.reject(p4)
		end))
	end)
end