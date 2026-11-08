local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FriendsRequestsModule = require(Parent.DataHydration.FriendsRequests)
local FriendsRequestsStore = FriendsRequestsModule.FriendsRequestsStore
local UnseenRequestsStore = FriendsRequestsModule.UnseenRequestsStore
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local UseSocialCarouselAnalyticsModule = require(SocialCarousel.Analytics.useSocialCarouselAnalytics)
local GetBadgeAnalyticsFieldsModule = require(SocialCarousel.Analytics.getBadgeAnalyticsFields)
local FStringNewFriendRequestsBadgeLayer = require(Parent.SharedFlags).FStringNewFriendRequestsBadgeLayer
local FFlagAddFriendsPageHighlightUnseenTrustedRequests = require(Parent.SharedFlags).FFlagAddFriendsPageHighlightUnseenTrustedRequests
local FFlagSocialCarouselEnableNewFriendRequestsBadgeForAllModule = require(SocialCarousel.Flags.FFlagSocialCarouselEnableNewFriendRequestsBadgeForAll)

return function(AbsolutePosition)
	-- upvalues: UseSocialCarouselAnalyticsModule (copy), UseNavigationFocusFunction (copy), ReactModule (copy), FFlagSocialCarouselEnableNewFriendRequestsBadgeForAllModule (copy), RoactAppExperimentModule (copy), FStringNewFriendRequestsBadgeLayer (copy), FFlagAddFriendsPageHighlightUnseenTrustedRequests (copy), UnseenRequestsStore (copy), FriendsRequestsStore (copy), UseSignalStateFunction (copy), GetBadgeAnalyticsFieldsModule (copy)
	local AddFriendsTileSeenFunction = UseSocialCarouselAnalyticsModule().addFriendsTileSeen
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseUserExperimentResult = nil
	UseUserExperimentResult = if FFlagSocialCarouselEnableNewFriendRequestsBadgeForAllModule then true else RoactAppExperimentModule.useUserExperiment({ FStringNewFriendRequestsBadgeLayer }, function(p1): boolean
		-- upvalues: FStringNewFriendRequestsBadgeLayer (upval)
		return (p1[FStringNewFriendRequestsBadgeLayer] or {}).showNewFriendRequestsBadge == true
	end)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagAddFriendsPageHighlightUnseenTrustedRequests (upval), UnseenRequestsStore (upval), FriendsRequestsStore (upval)
		return if FFlagAddFriendsPageHighlightUnseenTrustedRequests then UnseenRequestsStore.get().getUnseenRequestCount() else FriendsRequestsStore.get().getNewFriendsRequestCount()
	end, {})
	local UseSignalStateResult = UseSignalStateFunction(UseMemoResult.data)
	local IsReady = UseSignalStateFunction(UseMemoResult.status) == "Ready"
	local UseSignalStateResult1 = UseSignalStateResult or 0
	ReactModule.useEffect(function()
		-- upvalues: IsReady (copy), AbsolutePosition (copy), GetBadgeAnalyticsFieldsModule (upval), UseSignalStateResult1 (copy), UseUserExperimentResult (ref), UseRefResult (copy), UseRefResult1 (copy), UseNavigationFocusResult (copy), AddFriendsTileSeenFunction (copy)
		if not IsReady or AbsolutePosition == nil then return end
		local BadgeAnalyticsFieldsModule = GetBadgeAnalyticsFieldsModule(UseSignalStateResult1, UseUserExperimentResult)
		local Current = UseRefResult.current
		
		if Current == UseSignalStateResult1 and UseRefResult1.current == BadgeAnalyticsFieldsModule.badgeShown then return end
		if not UseNavigationFocusResult then return end
		if AddFriendsTileSeenFunction then
			AddFriendsTileSeenFunction({
				newRequestCount = BadgeAnalyticsFieldsModule.newRequestCount,
				previousCount = Current,
				trigger = if Current == nil then "initial" else "valueChanged",
				badgeEnabled = BadgeAnalyticsFieldsModule.badgeEnabled,
				badgeShown = BadgeAnalyticsFieldsModule.badgeShown,
				badgeCapped = BadgeAnalyticsFieldsModule.badgeCapped,
				absolutePosition = AbsolutePosition
			})
			UseRefResult.current = UseSignalStateResult1
			UseRefResult1.current = BadgeAnalyticsFieldsModule.badgeShown
			
			return
		end
	end, {
		AbsolutePosition, UseNavigationFocusResult, UseSignalStateResult1,
		UseUserExperimentResult, IsReady, AddFriendsTileSeenFunction
	})
end