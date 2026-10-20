local DependenciesModule = require(script:FindFirstAncestor("SocialReducerAdaptors").dependencies)
local Players = DependenciesModule.Players
local Llama = DependenciesModule.llama

return function(p1, p2)
	-- upvalues: Players (copy), Llama (copy)
	local function friendshipCreatedWithUser(User)
		-- upvalues: p1 (copy), p2 (copy), Players (upval)
		return p1.Actions.FriendshipCreated(User.id, p2 or tostring(Players.LocalPlayer.UserId))
	end
	
	return {
		AddUser = function(p3)
			-- upvalues: friendshipCreatedWithUser (copy)
			return if p3.user.isFriend then { friendshipCreatedWithUser(p3.user) } else { p3 }
		end,
		AddUsers = function(p3)
			-- upvalues: Llama (upval), friendshipCreatedWithUser (copy)
			return Llama.Dictionary.values(Llama.Dictionary.map(p3.users, function(p4, _)
				-- upvalues: friendshipCreatedWithUser (upval)
				return if p4.isFriend then friendshipCreatedWithUser(p4) else nil
			end))
		end,
		SetFriendRequestsCount = function(p3)
			-- upvalues: p1 (copy)
			return { p1.Actions.RequestReceivedCountUpdated(p3.count) }
		end
	}
end