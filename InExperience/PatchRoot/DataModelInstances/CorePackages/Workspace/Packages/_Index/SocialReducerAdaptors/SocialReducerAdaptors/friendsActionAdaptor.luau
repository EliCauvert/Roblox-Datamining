local dependenciesModule = require(script:FindFirstAncestor("SocialReducerAdaptors").dependencies)
local players = dependenciesModule.Players
local llama = dependenciesModule.llama

return function(p0, p1)
	-- upvalues: players (ref), llama (ref)
	local function friendshipCreatedWithUser(p2)
		-- upvalues: p0 (ref), p1 (ref), players (copy)
		return p0.Actions.FriendshipCreated(p2.id, p1 or tostring(players.LocalPlayer.UserId))
	end
	
	return {
		AddUser = function(p3)
			-- upvalues: friendshipCreatedWithUser (ref)
			return if p3.user.isFriend then { friendshipCreatedWithUser(p3.user) } else { p3 }
		end,
		AddUsers = function(p4)
			-- upvalues: llama (copy), friendshipCreatedWithUser (ref)
			return llama.Dictionary.values(llama.Dictionary.map(p4.users, function(p5, _)
				-- upvalues: friendshipCreatedWithUser (copy)
				return if p5.isFriend then friendshipCreatedWithUser(p5) else nil
			end))
		end,
		SetFriendRequestsCount = function(value)
			-- upvalues: p0 (ref)
			return { p0.Actions.RequestReceivedCountUpdated(value.count) }
		end
	}
end