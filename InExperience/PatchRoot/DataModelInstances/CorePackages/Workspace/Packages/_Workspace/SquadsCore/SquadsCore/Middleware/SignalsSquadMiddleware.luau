local SquadsCore = script:FindFirstAncestor("SquadsCore")
local NetworkingSquadsModule = require(SquadsCore.Http.NetworkingSquads)
local GetSquadExperienceInviteStoreModule = require(SquadsCore.Stores.GetSquadExperienceInviteStore)
local config = {
	[NetworkingSquadsModule.GetExperienceInvite.Succeeded.name] = function(p1)
		-- upvalues: GetSquadExperienceInviteStoreModule (copy)
		GetSquadExperienceInviteStoreModule(false).getExperienceInviteSucceeded(p1.responseBody)
	end,
	[NetworkingSquadsModule.VoteForExperienceInvite.Succeeded.name] = function(p1)
		-- upvalues: GetSquadExperienceInviteStoreModule (copy)
		GetSquadExperienceInviteStoreModule(false).voteForExperienceInviteSucceeded(p1.responseBody)
	end
}

return function(Callback, _)
	-- upvalues: config (copy)
	return function(p1)
		-- upvalues: Callback (copy), config (upval)
		local CallbackResult = Callback(p1)
		local Entry: (any) -> () = config[p1.type]
		
		if Entry then
			Entry(p1)
		end
		return CallbackResult
	end
end