local Llama = require(script:FindFirstAncestor("SocialReducerAdaptors").dependencies).llama

return function(p1)
	-- upvalues: Llama (copy)
	local function userUpdatedFromUser(User)
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
		AddUser = function(p2)
			-- upvalues: userUpdatedFromUser (copy)
			return { userUpdatedFromUser(p2.user) }
		end,
		AddUsers = function(p2)
			-- upvalues: Llama (upval), userUpdatedFromUser (copy)
			return Llama.Dictionary.values(Llama.Dictionary.map(p2.users, userUpdatedFromUser))
		end
	}
end