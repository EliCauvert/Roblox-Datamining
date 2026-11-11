local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local GetDeepValueModule = require(SocialCarousel.Utils.getDeepValue)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FStringNewFriendRequestsBadgeLayer = require(Parent.SharedFlags).FStringNewFriendRequestsBadgeLayer
local FFlagSocialCarouselEnableNewFriendRequestsBadgeForAllModule = require(SocialCarousel.Flags.FFlagSocialCarouselEnableNewFriendRequestsBadgeForAll)

return function()
	-- upvalues: FFlagSocialCarouselEnableNewFriendRequestsBadgeForAllModule (copy), RoactAppExperimentModule (copy), FStringNewFriendRequestsBadgeLayer (copy), UseSelectorFunction (copy), GetDeepValueModule (copy)
	local UseSelectorResult: number = UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValueModule (upval)
		return GetDeepValueModule(p1, "FriendsCarousel.Friends.requests.newFriendRequestsCount") or 0
	end)
	local Text = tostring(UseSelectorResult)
	
	return if (if FFlagSocialCarouselEnableNewFriendRequestsBadgeForAllModule then true else RoactAppExperimentModule.useUserExperiment({ FStringNewFriendRequestsBadgeLayer }, function(p1)
		-- upvalues: FStringNewFriendRequestsBadgeLayer (upval)
		return (p1[FStringNewFriendRequestsBadgeLayer] or {}).showNewFriendRequestsBadge
	end)) and UseSelectorResult > 0 then Text else nil
end