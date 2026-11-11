local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local FriendsPostDeclineFriendRequestModule = require(Modules.LuaApp.Http.Requests.FriendsPostDeclineFriendRequest)
local AddFriendStatusModule = require(Modules.LuaApp.Actions.AddFriendStatus)
local SetNetworkingErrorToastModule = require(Modules.LuaApp.Thunks.SetNetworkingErrorToast)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)

return function(p1, Text)
	-- upvalues: ArgCheckModule (copy), PerformFetch (copy), FriendsPostDeclineFriendRequestModule (copy), AddFriendStatusModule (copy), SetNetworkingErrorToastModule (copy), PromiseModule (copy)
	ArgCheckModule.isType(Text, "string", "Thunks.DeclineFriendRequest.userId")
	
	return PerformFetch.Single("luaapp.friends.declinefriendrequest." .. Text, function(p2)
		-- upvalues: FriendsPostDeclineFriendRequestModule (upval), p1 (copy), Text (copy), AddFriendStatusModule (upval), SetNetworkingErrorToastModule (upval), PromiseModule (upval)
		return FriendsPostDeclineFriendRequestModule(p1, Text):andThen(function(_)
			-- upvalues: p2 (copy), AddFriendStatusModule (upval), Text (upval)
			p2:dispatch(AddFriendStatusModule(Text, Enum.FriendStatus.NotFriend))
		end, function(p3)
			-- upvalues: p2 (copy), SetNetworkingErrorToastModule (upval), PromiseModule (upval)
			p2:dispatch(SetNetworkingErrorToastModule(p3))
			
			return PromiseModule.reject(p3)
		end)
	end)
end