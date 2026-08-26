local llama = require(script:FindFirstAncestor("SocialReducerAdaptors").dependencies).llama

return function(p1)
	-- upvalues: llama (ref)
	local function userUpdatedFromUser(p2)
		-- upvalues: p1 (ref)
		return p1.Actions.UserUpdated({
			id = p2.id,
			username = p2.name,
			displayName = p2.displayName,
			hasVerifiedBadge = p2.hasVerifiedBadge,
			created = p2.created
		})
	end
	
	return {
		AddUser = function(p2)
			-- upvalues: userUpdatedFromUser (ref)
			return { userUpdatedFromUser(p2.user) }
		end,
		AddUsers = function(p2)
			-- upvalues: llama (copy), userUpdatedFromUser (ref)
			return llama.Dictionary.values(llama.Dictionary.map(p2.users, userUpdatedFromUser))
		end
	}
end