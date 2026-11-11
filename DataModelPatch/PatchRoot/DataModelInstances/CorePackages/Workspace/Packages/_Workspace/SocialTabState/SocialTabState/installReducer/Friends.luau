local DependenciesModule = require(script:FindFirstAncestor("SocialTabState").dependencies)
local Llama = DependenciesModule.llama
local RoduxFriends = DependenciesModule.RoduxFriends

local function friendshipCreatedWithUser(User)
	-- upvalues: RoduxFriends (copy)
	return RoduxFriends.Actions.FriendshipCreated(User.id, "localUserId")
end

local config = {
	AddUser = function(p1)
		-- upvalues: friendshipCreatedWithUser (copy)
		return if p1.user.isFriend then { friendshipCreatedWithUser(p1.user) } else { p1 }
	end,
	AddUsers = function(p1)
		-- upvalues: Llama (copy), friendshipCreatedWithUser (copy)
		return Llama.Dictionary.values(Llama.Dictionary.map(p1.users, function(p2, _)
			-- upvalues: friendshipCreatedWithUser (upval)
			return if p2.isFriend then friendshipCreatedWithUser(p2) else nil
		end))
	end,
	SetFriendRequestsCount = function(p1)
		-- upvalues: RoduxFriends (copy)
		return {
			RoduxFriends.Actions.RequestReceivedCountUpdated(p1.count)
		}
	end
}
local InstallReducerResult = RoduxFriends.installReducer()

return function(p1, p2)
	-- upvalues: config (copy), Llama (copy), InstallReducerResult (copy)
	local P6 = p1 or {
		countsByUserId = {},
		byUserId = {},
		requests = { receivedCount = 0 }
	}
	local list = { p2 }
	local Entry = config[p2.type]
	
	if Entry then
		list = Entry(p2)
	end
	return Llama.List.reduce(list, InstallReducerResult, P6)
end