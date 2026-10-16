local FilterStatesModule = require(script:FindFirstAncestor("FriendsLanding").Friends.filterStates)

return function(p1, _) --[[ Line: 4 ]]
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