local squadsCore = script:FindFirstAncestor("SquadsCore")
local networkingSquadsModule = require(squadsCore.Http.NetworkingSquads)
local getSquadExperienceInviteStoreModule = require(squadsCore.Stores.GetSquadExperienceInviteStore)
local t = {
	[networkingSquadsModule.GetExperienceInvite.Succeeded.name] = function(p1)
		-- upvalues: getSquadExperienceInviteStoreModule (ref)
		getSquadExperienceInviteStoreModule(false).getExperienceInviteSucceeded(p1.responseBody)
	end,
	[networkingSquadsModule.VoteForExperienceInvite.Succeeded.name] = function(p1)
		-- upvalues: getSquadExperienceInviteStoreModule (ref)
		getSquadExperienceInviteStoreModule(false).voteForExperienceInviteSucceeded(p1.responseBody)
	end
}

return function(value, _)
	-- upvalues: t (ref)
	return function(p1)
		-- upvalues: value (ref), t (copy)
		local var1 = value(p1)
		local type = t[p1.type]
		
		if type then
			type(p1)
		end
		return var1
	end
end