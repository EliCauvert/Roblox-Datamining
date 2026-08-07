local llama = require(script:FindFirstAncestor("SocialReducerAdaptors").dependencies).llama

return function(p0) --[[ line: 16 ]]
	-- upvalues: llama (ref)
	local function userUpdatedFromUser(p1) --[[ line: 17 ]]
		-- upvalues: p0 (ref)
		return p0.Actions.UserUpdated({
			id = p1.id,
			username = p1.name,
			displayName = p1.displayName,
			hasVerifiedBadge = p1.hasVerifiedBadge,
			created = p1.created
		})
	end
	
	return {
		AddUser = function(p2) --[[ line: 28 ]]
			-- upvalues: userUpdatedFromUser (ref)
			return { userUpdatedFromUser(p2.user) }
		end,
		AddUsers = function(p3) --[[ line: 32 ]]
			-- upvalues: llama (copy), userUpdatedFromUser (ref)
			return llama.Dictionary.values(llama.Dictionary.map(p3.users, userUpdatedFromUser))
		end
	}
end