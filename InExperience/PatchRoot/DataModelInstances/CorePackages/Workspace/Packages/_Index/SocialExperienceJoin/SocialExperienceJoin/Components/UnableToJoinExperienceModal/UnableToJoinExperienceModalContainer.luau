local SocialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local Parent = SocialExperienceJoin.Parent
local ReactModule = require(Parent.React)
local UserProfilesModule = require(Parent.UserProfiles)
local InitializeSocialExperienceJoinAnalyticsModule = require(SocialExperienceJoin.Analytics.initializeSocialExperienceJoinAnalytics)
local EventNamesModule = require(SocialExperienceJoin.Analytics.EventNames)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseNavigationPropsFunction = require(Parent.RobloxAppNavigation).useNavigationProps
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local UnableToJoinExperienceModalModule = require(script.Parent.UnableToJoinExperienceModal)

return function(p1) --[[ Line: 25 ]]
	-- upvalues: UseNavigationFunction (copy), UseNavigationPropsFunction (copy), ReactModule (copy), InitializeSocialExperienceJoinAnalyticsModule (copy), UseScreenSizeFunction (copy), UserProfilesModule (copy), EventNamesModule (copy), UnableToJoinExperienceModalModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(UniverseId, p2) --[[ Line: 27 ]]
		return {
			universeId = UniverseId,
			userId = p2.userId,
			openGameDetailsPeekViewClosed = p2.openGameDetailsPeekViewClosed,
			analyticProps = p2.analyticProps
		}
	end)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 36 ]]
		-- upvalues: InitializeSocialExperienceJoinAnalyticsModule (upval), UseNavigationPropsResult (copy)
		return InitializeSocialExperienceJoinAnalyticsModule(UseNavigationPropsResult.analyticProps)
	end, { UseNavigationPropsResult.analyticProps })
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { UseNavigationPropsResult.userId },
		query = UserProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 49 ]]
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.pop()
	end, { UseNavigationResult })
	
	return ReactModule.createElement(UnableToJoinExperienceModalModule, {
		cancel = ReactModule.useCallback(function() --[[ Line: 53 ]]
			-- upvalues: UseMemoResult (copy), EventNamesModule (upval), UseNavigationPropsResult (copy), UseResult (copy)
			UseMemoResult.fireAnalyticsEvent(EventNamesModule.UnableToJoinCancel, {
				universeId = UseNavigationPropsResult.universeId,
				profileUserId = UseNavigationPropsResult.userId
			})
			UseResult()
		end, { UseResult }),
		openGameDetailsPeekView = ReactModule.useCallback(function() --[[ Line: 63 ]]
			-- upvalues: UseMemoResult (copy), EventNamesModule (upval), UseNavigationPropsResult (copy), UseResult (copy), p1 (copy)
			UseMemoResult.fireAnalyticsEvent(EventNamesModule.UnableToJoinViewDetails, {
				universeId = UseNavigationPropsResult.universeId,
				profileUserId = UseNavigationPropsResult.userId
			})
			UseResult()
			p1.openGameDetailsPeekView(UseNavigationPropsResult.universeId, {
				mountAsFullView = true,
				showBackButton = true,
				onPeekViewClosed = UseNavigationPropsResult.openGameDetailsPeekViewClosed
			})
		end, {
			UseNavigationResult, UseNavigationPropsResult.universeId,
			UseNavigationPropsResult.userId,
			UseNavigationPropsResult.openGameDetailsPeekViewClosed,
			p1.openGameDetailsPeekView, UseResult
		}),
		screenSize = UseScreenSizeFunction(),
		userPrimaryName = if UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, UseNavigationPropsResult.userId) else ""
	})
end