local filterStatesModule = require(script:FindFirstAncestor("FriendsLanding").Friends.filterStates)

return function(p1, _)
	-- upvalues: filterStatesModule (ref)
	return {
		{ text = p1.all, id = filterStatesModule.All },
		{ text = p1.online, id = filterStatesModule.Online },
		{
			text = p1.inExperience,
			id = filterStatesModule.InExperience
		}
	}
end