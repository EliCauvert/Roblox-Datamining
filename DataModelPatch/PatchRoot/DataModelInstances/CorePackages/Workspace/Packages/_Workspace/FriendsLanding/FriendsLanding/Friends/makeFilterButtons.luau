local FilterStatesModule = require(script:FindFirstAncestor("FriendsLanding").Friends.filterStates)

return function(p1, _)
	-- upvalues: FilterStatesModule (copy)
	return {
		{ text = p1.all, id = FilterStatesModule.All },
		{ text = p1.online, id = FilterStatesModule.Online },
		{
			text = p1.inExperience,
			id = FilterStatesModule.InExperience
		}
	}
end