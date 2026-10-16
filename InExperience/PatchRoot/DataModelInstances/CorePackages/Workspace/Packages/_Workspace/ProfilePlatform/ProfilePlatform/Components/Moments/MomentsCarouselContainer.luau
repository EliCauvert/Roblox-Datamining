local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local MomentsCommonModule = require(Parent.MomentsCommon)
local MomentsCarouselModule = require(script.Parent.MomentsCarousel)
local UseUserMomentsModule = require(ProfilePlatform.Hooks.useUserMoments)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local MakeProfileTileFieldsModule = require(ProfilePlatform.Analytics.makeProfileTileFields)
local FireAnalyticsEventFunction = MomentsCommonModule.Analytics.fireAnalyticsEvent
local EventNames = MomentsCommonModule.Analytics.EventNames
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagMomentsOptimisticProfilePending = SharedFlagsModule.FFlagMomentsOptimisticProfilePending
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local FFlagProfileMomentsFeedRootRoute = SharedFlagsModule.FFlagProfileMomentsFeedRootRoute
local FFlagProfileMomentsLoadFailureAnalyticsModule = require(ProfilePlatform.Flags.FFlagProfileMomentsLoadFailureAnalytics)
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1) --[[ Line: 42 | Named "MomentsCarouselContainer" ]]
	-- upvalues: UseProfileWrapperContextModule (copy), UseProfileAnalyticsContextModule (copy), UseNavigationFunction (copy), FFlagProfileMomentsFeedRootRoute (copy), UseDispatchFunction (copy), UseUserMomentsModule (copy), FFlagProfileMomentsLoadFailureAnalyticsModule (copy), ReactModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), EventNamesModule (copy), EnumsModule (copy), MakeProfileTileFieldsModule (copy), FFlagMomentsOptimisticProfilePending (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), MomentsCarouselModule (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = if FFlagProfileMomentsFeedRootRoute then UseDispatchFunction() else nil
	local ProfileId = UseProfileWrapperContextModuleResult.profileId
	local UseUserMomentsModuleResult = UseUserMomentsModule(ProfileId)
	local Moments = UseUserMomentsModuleResult.moments
	
	if FFlagProfileMomentsLoadFailureAnalyticsModule then
		ReactModule.useEffect(function() --[[ Line: 53 ]]
			-- upvalues: UseUserMomentsModuleResult (copy), ProfileId (copy), FireAnalyticsEventFunction (upval), EventNames (upval)
			if UseUserMomentsModuleResult.hasFailed and ProfileId ~= nil then
				FireAnalyticsEventFunction(EventNames.ProfileLoadFailed, { userId = ProfileId })
			end
		end, { UseUserMomentsModuleResult.hasFailed, ProfileId })
	end
	local UseResult = ReactModule.useCallback(function() --[[ Line: 62 ]]
		-- upvalues: UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), UseNavigationResult (copy), EnumsModule (upval), ProfileId (copy)
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.MomentsSeeAll)
		UseNavigationResult.navigate(EnumsModule.Screens.MomentsAll, { extraProps = { profileId = ProfileId } })
	end, {
		UseProfileAnalyticsContextModuleResult,
		UseNavigationResult,
		ProfileId
	})
	local UseResult1 = ReactModule.useCallback(function(InitialIndex) --[[ Line: 71 ]]
		-- upvalues: Moments (copy), ProfileId (copy), MakeProfileTileFieldsModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval), FFlagMomentsOptimisticProfilePending (upval), FFlagProfileMomentsFeedRootRoute (upval), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval), UseNavigationResult (copy), EnumsModule (upval)
		local Moment = Moments[InitialIndex]
		
		if Moment and ProfileId then
			local Carousel = MakeProfileTileFieldsModule.makeProfileTileInteractionFields(Moment, ProfileId, "carousel", InitialIndex)
			
			if Carousel then
				FireAnalyticsEventFunction(EventNames.ProfileMomentSelected, Carousel)
			end
		end
		local ExtraProps = {
			targetUserId = tonumber(ProfileId) or 0,
			initialIndex = InitialIndex,
			initialMomentId = if FFlagMomentsOptimisticProfilePending and Moment ~= nil then Moment.momentId else nil
		}
		
		if not FFlagProfileMomentsFeedRootRoute then
			UseNavigationResult.navigate(EnumsModule.Screens.MomentsFeed, { extraProps = ExtraProps })
			
			return
		end
		local config = {
			name = AppPage.ProfileMomentsFeed,
			extraProps = ExtraProps
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, {
		UseProfileAnalyticsContextModuleResult,
		UseNavigationResult,
		UseDispatchResult,
		ProfileId,
		Moments
	})
	local UseResult2 = ReactModule.useCallback(function(p2) --[[ Line: 106 ]]
		-- upvalues: Moments (copy), ProfileId (copy), MakeProfileTileFieldsModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval)
		local Moment = Moments[p2]
		
		if Moment and ProfileId and Moment.recommendationMetadata then
			local Carousel = MakeProfileTileFieldsModule.makeProfileTileImpressionFields(Moment, ProfileId, "carousel", p2)
			
			if Carousel then
				FireAnalyticsEventFunction(EventNames.ProfileMomentTileImpression, Carousel)
			end
		end
	end, { ProfileId, Moments })
	
	return if #Moments == 0 then ReactModule.None else ReactModule.createElement(MomentsCarouselModule, {
		layoutOrder = p1.layoutOrder,
		moments = Moments,
		onActivateHeader = UseResult,
		onSelectMoment = UseResult1,
		onTileImpression = UseResult2
	})
end