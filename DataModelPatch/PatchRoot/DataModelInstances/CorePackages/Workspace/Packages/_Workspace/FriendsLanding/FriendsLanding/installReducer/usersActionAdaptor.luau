local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local Llama = DependenciesModule.llama
local RoduxUsers = DependenciesModule.RoduxUsers

local function userUpdatedFromUser(User)
	-- upvalues: RoduxUsers (copy)
	return RoduxUsers.Actions.UserUpdated({
		id = User.id,
		username = User.name,
		displayName = User.displayName,
		hasVerifiedBadge = User.hasVerifiedBadge
	})
end

return {
	AddUser = function(p1)
		-- upvalues: userUpdatedFromUser (copy)
		return { userUpdatedFromUser(p1.user) }
	end,
	AddUsers = function(p1)
		-- upvalues: Llama (copy), userUpdatedFromUser (copy)
		return Llama.Dictionary.values(Llama.Dictionary.map(p1.users, userUpdatedFromUser))
	end
}