local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local players = dependenciesModule.Players
local llama = dependenciesModule.llama
local roduxFriends = dependenciesModule.RoduxFriends

return function(p0) --[[ line: 9 ]]
	-- upvalues: roduxFriends (ref), players (ref), llama (ref)
	local function friendshipCreatedWithUser(p1) --[[ line: 10 ]]
		-- upvalues: roduxFriends (copy), p0 (ref), players (copy)
		return roduxFriends.Actions.FriendshipCreated(p1.id, p0 or tostring(players.LocalPlayer.UserId))
	end
	
	return {
		AddUser = function(p2) --[[ line: 15 ]]
			-- upvalues: friendshipCreatedWithUser (ref)
			return if p2.user.isFriend then { friendshipCreatedWithUser(p2.user) } else { p2 }
		end,
		AddUsers = function(p3) --[[ line: 23 ]]
			-- upvalues: llama (copy), friendshipCreatedWithUser (ref)
			return llama.Dictionary.values(llama.Dictionary.map(p3.users, function(p4, _) --[[ line: 24 ]]
				-- upvalues: friendshipCreatedWithUser (copy)
				return if p4.isFriend then friendshipCreatedWithUser(p4) else nil
			end))
		end,
		SetFriendRequestsCount = function(value) --[[ line: 33 ]]
			-- upvalues: roduxFriends (copy)
			return {
				roduxFriends.Actions.RequestReceivedCountUpdated(value.count)
			}
		end
	}
end