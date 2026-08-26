local useUserExperiment = require(script:FindFirstAncestor("FriendsMenu").Parent.RoactAppExperiment).useUserExperiment
local sortInvitesByScoreExperimentLayer = game:DefineFastString("SortInvitesByScoreExperimentLayer", "Social.Friends")

return {
	FFlagEnableSortInvitesByScoreExperiment = game:DefineFastFlag("EnableSortInvitesByScoreExperiment", false),
	FFlagSortInvitesByScoreEnabledForAll = game:DefineFastFlag("SortInvitesByScoreEnabledForAll", false),
	useSortInvitesByScoreExperiment = function()
		-- upvalues: useUserExperiment (ref), sortInvitesByScoreExperimentLayer (ref)
		return useUserExperiment({ sortInvitesByScoreExperimentLayer }, function(p1)
			-- upvalues: sortInvitesByScoreExperimentLayer (copy)
			return (p1[sortInvitesByScoreExperimentLayer] or {}).sortInvitesByScore
		end)
	end
}