local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local Players = DependenciesModule.Players
local Llama = DependenciesModule.llama
local RoduxFriends = DependenciesModule.RoduxFriends

return function(p1) --[[ Line: 9 ]]
	-- upvalues: RoduxFriends (copy), Players (copy), Llama (copy)
	local function friendshipCreatedWithUser(User) --[[ Line: 10 ]]
		-- upvalues: RoduxFriends (upval), p1 (copy), Players (upval)
		return RoduxFriends.Actions.FriendshipCreated(User.id, p1 or tostring(Players.LocalPlayer.UserId))
	end
	
	return {
		AddUser = function(p2) --[[ Line: 15 ]]
			-- upvalues: friendshipCreatedWithUser (copy)
			return if p2.user.isFriend then { friendshipCreatedWithUser(p2.user) } else { p2 }
		end,
		AddUsers = function(p2) --[[ Line: 23 ]]
			-- upvalues: Llama (upval), friendshipCreatedWithUser (copy)
			return Llama.Dictionary.values(Llama.Dictionary.map(p2.users, function(p3, _) --[[ Line: 24 ]]
				-- upvalues: friendshipCreatedWithUser (upval)
				return if p3.isFriend then friendshipCreatedWithUser(p3) else nil
			end))
		end,
		SetFriendRequestsCount = function(p2) --[[ Line: 33 ]]
			-- upvalues: RoduxFriends (upval)
			return {
				RoduxFriends.Actions.RequestReceivedCountUpdated(p2.count)
			}
		end
	}
end