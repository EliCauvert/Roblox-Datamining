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
local var15 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0)
	-- upvalues: useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useNavigation (ref), fFlagProfileMomentsFeedRootRoute (ref), useDispatch (ref), useUserMomentsModule (ref), fFlagProfileMomentsLoadFailureAnalyticsModule (ref), reactModule (ref), fireAnalyticsEvent (ref), eventNames (ref), eventNamesModule (ref), enumsModule (ref), getFFlagMomentsAnalyticsSchemaIdentity (ref), makeProfileTileFieldsModule (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var15 (ref), navigateDown (ref), momentsCarouselModule (ref)
	local var16 = useProfileWrapperContextModule()
	local var17 = useProfileAnalyticsContextModule()
	local var18 = useNavigation()
	local var19 = if fFlagProfileMomentsFeedRootRoute then useDispatch() else nil
	local profileId = var16.profileId
	local var20 = useUserMomentsModule(profileId)
	local moments = var20.moments
	
	if fFlagProfileMomentsLoadFailureAnalyticsModule then
		reactModule.useEffect(function()
			-- upvalues: var20 (ref), profileId (ref), fireAnalyticsEvent (copy), eventNames (copy)
			if var20.hasFailed and profileId ~= nil then
				fireAnalyticsEvent(eventNames.ProfileLoadFailed, { userId = profileId })
			end
		end, { var20.hasFailed, profileId })
	end
	return if #moments == 0 then reactModule.None else reactModule.createElement(momentsCarouselModule, {
		layoutOrder = p0.layoutOrder,
		moments = moments,
		onActivateHeader = reactModule.useCallback(function()
			-- upvalues: var17 (ref), eventNamesModule (copy), var18 (ref), enumsModule (copy), profileId (ref)
			var17.fireAnalyticsEvent(eventNamesModule.MomentsSeeAll)
			var18.navigate(enumsModule.Screens.MomentsAll, { extraProps = { profileId = profileId } })
		end, { var17, var18, profileId }),
		onSelectMoment = reactModule.useCallback(function(p1)
			-- upvalues: getFFlagMomentsAnalyticsSchemaIdentity (copy), moments (ref), profileId (ref), makeProfileTileFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy), var17 (ref), eventNamesModule (copy), fFlagProfileMomentsFeedRootRoute (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var15 (copy), var19 (ref), navigateDown (copy), var18 (ref), enumsModule (copy)
			if getFFlagMomentsAnalyticsSchemaIdentity() then
				local var21 = moments[p1]
				
				if var21 and profileId then
					local carousel = makeProfileTileFieldsModule.makeProfileTileInteractionFields(var21, profileId, "carousel", p1)
					
					if carousel then
						fireAnalyticsEvent(eventNames.ProfileMomentSelected, carousel)
					end
				end
			else
				var17.fireAnalyticsEvent(eventNamesModule.MomentOpened)
			end
			local t = {
				targetUserId = tonumber(profileId) or 0,
				initialIndex = p1
			}
			
			if not fFlagProfileMomentsFeedRootRoute then
				var18.navigate(enumsModule.Screens.MomentsFeed, { extraProps = t })
				
				return
			end
			local t_1 = { name = appPage.ProfileMomentsFeed, extraProps = t }
			
			if fFlagSignalsNavP3Dispatch then
				var15.down(var15.fromLegacyPage(t_1))
				
				return
			end
			var19(navigateDown(t_1))
		end, {
			var17,
			var18,
			var19,
			profileId,
			moments
		}),
		onTileImpression = if getFFlagMomentsAnalyticsSchemaIdentity() then reactModule.useCallback(function(p2)
			-- upvalues: getFFlagMomentsAnalyticsSchemaIdentity (copy), moments (ref), profileId (ref), makeProfileTileFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy)
			if not getFFlagMomentsAnalyticsSchemaIdentity() then return end
			local var25 = moments[p2]
			
			if var25 and profileId and var25.recommendationMetadata then
				local carousel = makeProfileTileFieldsModule.makeProfileTileImpressionFields(var25, profileId, "carousel", p2)
				
				if carousel then
					fireAnalyticsEvent(eventNames.ProfileMomentTileImpression, carousel)
				end
			end
		end, { profileId, moments }) else nil
	})
end