local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local players = dependenciesModule.Players
local llama = dependenciesModule.llama
local roduxFriends = dependenciesModule.RoduxFriends

return function(p1)
	-- upvalues: roduxFriends (ref), players (ref), llama (ref)
	local function friendshipCreatedWithUser(p2)
		-- upvalues: roduxFriends (copy), p1 (ref), players (copy)
		return roduxFriends.Actions.FriendshipCreated(p2.id, p1 or tostring(players.LocalPlayer.UserId))
	end
	
	return {
		AddUser = function(p2)
			-- upvalues: friendshipCreatedWithUser (ref)
			return if p2.user.isFriend then { friendshipCreatedWithUser(p2.user) } else { p2 }
		end,
		AddUsers = function(p2)
			-- upvalues: llama (copy), friendshipCreatedWithUser (ref)
			return llama.Dictionary.values(llama.Dictionary.map(p2.users, function(p3, _)
				-- upvalues: friendshipCreatedWithUser (copy)
				return if p3.isFriend then friendshipCreatedWithUser(p3) else nil
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