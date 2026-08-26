local dependenciesModule = require(script:FindFirstAncestor("SocialReducerAdaptors").dependencies)
local players = dependenciesModule.Players
local llama = dependenciesModule.llama

return function(p1, p2)
	-- upvalues: players (ref), llama (ref)
	local function friendshipCreatedWithUser(p3)
		-- upvalues: p1 (ref), p2 (ref), players (copy)
		return p1.Actions.FriendshipCreated(p3.id, p2 or tostring(players.LocalPlayer.UserId))
	end
	
	return {
		AddUser = function(p3)
			-- upvalues: friendshipCreatedWithUser (ref)
			return if p3.user.isFriend then { friendshipCreatedWithUser(p3.user) } else { p3 }
		end,
		AddUsers = function(p3)
			-- upvalues: llama (copy), friendshipCreatedWithUser (ref)
			return llama.Dictionary.values(llama.Dictionary.map(p3.users, function(p4, _)
				-- upvalues: friendshipCreatedWithUser (copy)
				return if p4.isFriend then friendshipCreatedWithUser(p4) else nil
			end))
		end,
		SetFriendRequestsCount = function(value)
			-- upvalues: p1 (ref)
			return { p1.Actions.RequestReceivedCountUpdated(value.count) }
		end
	}
end