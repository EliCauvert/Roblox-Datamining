local ReactModule = require(script:FindFirstAncestor("TrustedFriendCandidates").Parent.React)
local TrustedFriendCandidatesSectionViewModule = require(script.Parent.TrustedFriendCandidatesSectionView)
local UseTrustedFriendCandidatesSectionViewModelModule = require(script.Parent.useTrustedFriendCandidatesSectionViewModel)

return function(p1)
	-- upvalues: UseTrustedFriendCandidatesSectionViewModelModule (copy), ReactModule (copy), TrustedFriendCandidatesSectionViewModule (copy)
	return ReactModule.createElement(TrustedFriendCandidatesSectionViewModule, (UseTrustedFriendCandidatesSectionViewModelModule(p1)))
end