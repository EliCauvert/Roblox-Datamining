local filterStatesModule = require(script:FindFirstAncestor("FriendsLanding").Friends.filterStates)

return function(p0, _)
	-- upvalues: filterStatesModule (ref)
	return {
		{ text = p0.all, id = filterStatesModule.All },
		{ text = p0.online, id = filterStatesModule.Online },
		{
			text = p0.inExperience,
			id = filterStatesModule.InExperience
		}
	}
end