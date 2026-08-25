local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local players = dependenciesModule.Players
local llama = dependenciesModule.llama
local roduxFriends = dependenciesModule.RoduxFriends

return function(p0)
	-- upvalues: roduxFriends (ref), players (ref), llama (ref)
	local function friendshipCreatedWithUser(p1)
		-- upvalues: roduxFriends (copy), p0 (ref), players (copy)
		return roduxFriends.Actions.FriendshipCreated(p1.id, p0 or tostring(players.LocalPlayer.UserId))
	end
	
	return {
		AddUser = function(p2)
			-- upvalues: friendshipCreatedWithUser (ref)
			return if p2.user.isFriend then { friendshipCreatedWithUser(p2.user) } else { p2 }
		end,
		AddUsers = function(p3)
			-- upvalues: llama (copy), friendshipCreatedWithUser (ref)
			return llama.Dictionary.values(llama.Dictionary.map(p3.users, function(p4, _)
				-- upvalues: friendshipCreatedWithUser (copy)
				return if p4.isFriend then friendshipCreatedWithUser(p4) else nil
			end))
		end,
		SetFriendRequestsCount = function(value)
			-- upvalues: roduxFriends (copy)
			return {
				roduxFriends.Actions.RequestReceivedCountUpdated(value.count)
			}
		end
	}
end