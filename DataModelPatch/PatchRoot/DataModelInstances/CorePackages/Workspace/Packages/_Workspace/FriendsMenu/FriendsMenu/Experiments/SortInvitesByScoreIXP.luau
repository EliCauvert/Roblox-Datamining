local UseUserExperimentFunction = require(script:FindFirstAncestor("FriendsMenu").Parent.RoactAppExperiment).useUserExperiment
local SortInvitesByScoreExperimentLayer = game:DefineFastString("SortInvitesByScoreExperimentLayer", "Social.Friends")

return {
	FFlagEnableSortInvitesByScoreExperiment = game:DefineFastFlag("EnableSortInvitesByScoreExperiment", false),
	FFlagSortInvitesByScoreEnabledForAll = game:DefineFastFlag("SortInvitesByScoreEnabledForAll", false),
	useSortInvitesByScoreExperiment = function()
		-- upvalues: UseUserExperimentFunction (copy), SortInvitesByScoreExperimentLayer (copy)
		return (UseUserExperimentFunction({ SortInvitesByScoreExperimentLayer }, function(p1)
			-- upvalues: SortInvitesByScoreExperimentLayer (upval)
			return (p1[SortInvitesByScoreExperimentLayer] or {}).sortInvitesByScore
		end))
	end
}