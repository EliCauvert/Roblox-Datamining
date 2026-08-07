local useUserExperiment = require(script:FindFirstAncestor("FriendsMenu").Parent.RoactAppExperiment).useUserExperiment
local sortInvitesByScoreExperimentLayer = game:DefineFastString("SortInvitesByScoreExperimentLayer", "Social.Friends")

return {
	FFlagEnableSortInvitesByScoreExperiment = game:DefineFastFlag("EnableSortInvitesByScoreExperiment", false),
	FFlagSortInvitesByScoreEnabledForAll = game:DefineFastFlag("SortInvitesByScoreEnabledForAll", false),
	useSortInvitesByScoreExperiment = function() --[[ line: 16 ]]
		-- upvalues: useUserExperiment (ref), sortInvitesByScoreExperimentLayer (ref)
		return useUserExperiment({ sortInvitesByScoreExperimentLayer }, function(p0) --[[ line: 19 ]]
			-- upvalues: sortInvitesByScoreExperimentLayer (copy)
			return (p0[sortInvitesByScoreExperimentLayer] or {}).sortInvitesByScore
		end)
	end
}