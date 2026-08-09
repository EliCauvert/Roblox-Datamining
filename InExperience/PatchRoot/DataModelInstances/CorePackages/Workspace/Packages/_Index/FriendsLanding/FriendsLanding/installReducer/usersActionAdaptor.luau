local dependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local llama = dependenciesModule.llama
local roduxUsers = dependenciesModule.RoduxUsers

local function userUpdatedFromUser(p0) --[[ line: 7 ]]
	-- upvalues: roduxUsers (ref)
	return roduxUsers.Actions.UserUpdated({
		id = p0.id,
		username = p0.name,
		displayName = p0.displayName,
		hasVerifiedBadge = p0.hasVerifiedBadge
	})
end

return {
	AddUser = function(p1) --[[ line: 17 ]]
		-- upvalues: userUpdatedFromUser (ref)
		return { userUpdatedFromUser(p1.user) }
	end,
	AddUsers = function(p2) --[[ line: 21 ]]
		-- upvalues: llama (ref), userUpdatedFromUser (ref)
		return llama.Dictionary.values(llama.Dictionary.map(p2.users, userUpdatedFromUser))
	end
}