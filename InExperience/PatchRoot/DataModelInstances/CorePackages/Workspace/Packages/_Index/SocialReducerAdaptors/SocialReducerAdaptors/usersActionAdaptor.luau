local Llama = require(script:FindFirstAncestor("SocialReducerAdaptors").dependencies).llama

return function(p1) --[[ Line: 16 ]]
	-- upvalues: Llama (copy)
	local function userUpdatedFromUser(User) --[[ Line: 17 ]]
		-- upvalues: p1 (copy)
		return p1.Actions.UserUpdated({
			id = User.id,
			username = User.name,
			displayName = User.displayName,
			hasVerifiedBadge = User.hasVerifiedBadge,
			created = User.created
		})
	end
	
	return {
		AddUser = function(p2) --[[ Line: 28 ]]
			-- upvalues: userUpdatedFromUser (copy)
			return { userUpdatedFromUser(p2.user) }
		end,
		AddUsers = function(p2) --[[ Line: 32 ]]
			-- upvalues: Llama (upval), userUpdatedFromUser (copy)
			return Llama.Dictionary.values(Llama.Dictionary.map(p2.users, userUpdatedFromUser))
		end
	}
end