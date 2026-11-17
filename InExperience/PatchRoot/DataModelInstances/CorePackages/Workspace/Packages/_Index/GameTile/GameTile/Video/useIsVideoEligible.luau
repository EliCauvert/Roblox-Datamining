local Parent = script:FindFirstAncestor("GameTile").Parent
local FetchGamePlayabilityAndProductInfo = require(Parent.GameDetailRodux).FetchGamePlayabilityAndProductInfo
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local IsVideoEligibleForPlayabilityFunction = require(Parent.VideoUtils).isVideoEligibleForPlayability
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1, p2)
	-- upvalues: UseSelectorFunction (copy), FetchGamePlayabilityAndProductInfo (copy), IsVideoEligibleForPlayabilityFunction (copy), RetrievalStatus (copy)
	return IsVideoEligibleForPlayabilityFunction(UseSelectorFunction(function(p3)
		-- upvalues: FetchGamePlayabilityAndProductInfo (upval), p1 (copy)
		return FetchGamePlayabilityAndProductInfo.GetFetchingStatus(p3, p1)
	end) == RetrievalStatus.Done, UseSelectorFunction(function(p3)
		-- upvalues: p1 (copy)
		return p3.PlayabilityStatus and p3.PlayabilityStatus[p1] or nil
	end), p2)
end