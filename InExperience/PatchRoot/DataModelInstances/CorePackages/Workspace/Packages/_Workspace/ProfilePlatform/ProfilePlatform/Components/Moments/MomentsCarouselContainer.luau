local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local navigationModule = require(parent.Navigation)
local navigationRoduxModule = require(parent.NavigationRodux)
local roactUtilsModule = require(parent.RoactUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local appPage = require(parent.RobloxAppEnums).AppPage
local momentsCommonModule = require(parent.MomentsCommon)
local momentsCarouselModule = require(script.Parent.MomentsCarousel)
local useUserMomentsModule = require(profilePlatform.Hooks.useUserMoments)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local enumsModule = require(profilePlatform.Common.Enums)
local makeProfileTileFieldsModule = require(profilePlatform.Analytics.makeProfileTileFields)
local fireAnalyticsEvent = momentsCommonModule.Analytics.fireAnalyticsEvent
local eventNames = momentsCommonModule.Analytics.EventNames
local getFFlagMomentsAnalyticsSchemaIdentity = momentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity
local useNavigation = navigationModule.useNavigation
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local fFlagProfileMomentsFeedRootRoute = sharedFlagsModule.FFlagProfileMomentsFeedRootRoute
local fFlagProfileMomentsLoadFailureAnalyticsModule = require(profilePlatform.Flags.FFlagProfileMomentsLoadFailureAnalytics)
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p1)
	-- upvalues: useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useNavigation (ref), fFlagProfileMomentsFeedRootRoute (ref), useDispatch (ref), useUserMomentsModule (ref), fFlagProfileMomentsLoadFailureAnalyticsModule (ref), reactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), eventNamesModule (ref), enumsModule (ref), getFFlagMomentsAnalyticsSchemaIdentity (ref), makeProfileTileFieldsModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), momentsCarouselModule (ref)
	local var2 = useProfileWrapperContextModule()
	local var3 = useProfileAnalyticsContextModule()
	local var4 = useNavigation()
	local var5 = if fFlagProfileMomentsFeedRootRoute then useDispatch() else nil
	local profileId = var2.profileId
	local var6 = useUserMomentsModule(profileId)
	local moments = var6.moments
	
	if fFlagProfileMomentsLoadFailureAnalyticsModule then
		reactModule.useEffect(function()
			-- upvalues: var6 (ref), profileId (ref), fireAnalyticsEvent (copy), eventNames (copy)
			if var6.hasFailed and profileId ~= nil then
				fireAnalyticsEvent(eventNames.ProfileLoadFailed, { userId = profileId })
			end
		end, { var6.hasFailed, profileId })
	end
	return if #moments == 0 then reactModule.None else reactModule.createElement(momentsCarouselModule, {
		layoutOrder = p1.layoutOrder,
		moments = moments,
		onActivateHeader = reactModule.useCallback(function()
			-- upvalues: var3 (ref), eventNamesModule (copy), var4 (ref), enumsModule (copy), profileId (ref)
			var3.fireAnalyticsEvent(eventNamesModule.MomentsSeeAll)
			var4.navigate(enumsModule.Screens.MomentsAll, { extraProps = { profileId = profileId } })
		end, { var3, var4, profileId }),
		onSelectMoment = reactModule.useCallback(function(p2)
			-- upvalues: getFFlagMomentsAnalyticsSchemaIdentity (copy), moments (ref), profileId (ref), makeProfileTileFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy), var3 (ref), eventNamesModule (copy), fFlagProfileMomentsFeedRootRoute (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var5 (ref), navigateDown (copy), var4 (ref), enumsModule (copy)
			if getFFlagMomentsAnalyticsSchemaIdentity() then
				local var7 = moments[p2]
				
				if var7 and profileId then
					local carousel = makeProfileTileFieldsModule.makeProfileTileInteractionFields(var7, profileId, "carousel", p2)
					
					if carousel then
						fireAnalyticsEvent(eventNames.ProfileMomentSelected, carousel)
					end
				end
			else
				var3.fireAnalyticsEvent(eventNamesModule.MomentOpened)
			end
			local t = {
				targetUserId = tonumber(profileId) or 0,
				initialIndex = p2
			}
			
			if not fFlagProfileMomentsFeedRootRoute then
				var4.navigate(enumsModule.Screens.MomentsFeed, { extraProps = t })
				
				return
			end
			local t_1 = { name = appPage.ProfileMomentsFeed, extraProps = t }
			
			if fFlagSignalsNavP3Dispatch then
				var1.down(var1.fromLegacyPage(t_1))
				
				return
			end
			var5(navigateDown(t_1))
		end, {
			var3,
			var4,
			var5,
			profileId,
			moments
		}),
		onTileImpression = if getFFlagMomentsAnalyticsSchemaIdentity() then reactModule.useCallback(function(p2)
			-- upvalues: getFFlagMomentsAnalyticsSchemaIdentity (copy), moments (ref), profileId (ref), makeProfileTileFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy)
			if not getFFlagMomentsAnalyticsSchemaIdentity() then return end
			local var7 = moments[p2]
			
			if var7 and profileId and var7.recommendationMetadata then
				local carousel = makeProfileTileFieldsModule.makeProfileTileImpressionFields(var7, profileId, "carousel", p2)
				
				if carousel then
					fireAnalyticsEvent(eventNames.ProfileMomentTileImpression, carousel)
				end
			end
		end, { profileId, moments }) else nil
	})
end