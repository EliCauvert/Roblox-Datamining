local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local roactAppExperimentModule = require(parent.RoactAppExperiment)
local getDeepValueModule = require(socialCarousel.Utils.getDeepValue)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local fStringNewFriendRequestsBadgeLayer = require(parent.SharedFlags).FStringNewFriendRequestsBadgeLayer
local fFlagSocialCarouselEnableNewFriendRequestsBadgeForAllModule = require(socialCarousel.Flags.FFlagSocialCarouselEnableNewFriendRequestsBadgeForAll)

return function()
	-- upvalues: fFlagSocialCarouselEnableNewFriendRequestsBadgeForAllModule (ref), roactAppExperimentModule (ref), fStringNewFriendRequestsBadgeLayer (ref), useSelector (ref), getDeepValueModule (ref)
	local var4 = useSelector(function(p0)
		-- upvalues: getDeepValueModule (copy)
		return getDeepValueModule(p0, "FriendsCarousel.Friends.requests.newFriendRequestsCount") or 0
	end)
	
	return if (if fFlagSocialCarouselEnableNewFriendRequestsBadgeForAllModule then true else roactAppExperimentModule.useUserExperiment({ fStringNewFriendRequestsBadgeLayer }, function(p1)
		-- upvalues: fStringNewFriendRequestsBadgeLayer (copy)
		return (p1[fStringNewFriendRequestsBadgeLayer] or {}).showNewFriendRequestsBadge
	end)) and var4 > 0 then tostring(var4) else nil
end