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
local var14 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil

return function(p0) --[[ line: 41 | named "MomentsCarouselContainer" ]]
	-- upvalues: useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), useNavigation (ref), fFlagProfileMomentsFeedRootRoute (ref), useDispatch (ref), useUserMomentsModule (ref), reactModule (ref), eventNamesModule (ref), enumsModule (ref), getFFlagMomentsAnalyticsSchemaIdentity (ref), makeProfileTileFieldsModule (ref), fireAnalyticsEvent (ref), eventNames (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var14 (ref), navigateDown (ref), momentsCarouselModule (ref)
	local var15 = useProfileWrapperContextModule()
	local var16 = useProfileAnalyticsContextModule()
	local var17 = useNavigation()
	local var18 = if fFlagProfileMomentsFeedRootRoute then useDispatch() else nil
	local profileId = var15.profileId
	local moments = useUserMomentsModule(profileId).moments
	
	return if #moments == 0 then reactModule.None else reactModule.createElement(momentsCarouselModule, {
		layoutOrder = p0.layoutOrder,
		moments = moments,
		onActivateHeader = reactModule.useCallback(function() --[[ line: 50 ]]
			-- upvalues: var16 (ref), eventNamesModule (copy), var17 (ref), enumsModule (copy), profileId (ref)
			var16.fireAnalyticsEvent(eventNamesModule.MomentsSeeAll)
			var17.navigate(enumsModule.Screens.MomentsAll, { extraProps = { profileId = profileId } })
		end, { var16, var17, profileId }),
		onSelectMoment = reactModule.useCallback(function(p1) --[[ line: 59 ]]
			-- upvalues: getFFlagMomentsAnalyticsSchemaIdentity (copy), moments (ref), profileId (ref), makeProfileTileFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy), var16 (ref), eventNamesModule (copy), fFlagProfileMomentsFeedRootRoute (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var14 (copy), var18 (ref), navigateDown (copy), var17 (ref), enumsModule (copy)
			if getFFlagMomentsAnalyticsSchemaIdentity() then
				local var19 = moments[p1]
				
				if var19 and profileId then
					local carousel = makeProfileTileFieldsModule.makeProfileTileInteractionFields(var19, profileId, "carousel", p1)
					
					if carousel then
						fireAnalyticsEvent(eventNames.ProfileMomentSelected, carousel)
					end
				end
			else
				var16.fireAnalyticsEvent(eventNamesModule.MomentOpened)
			end
			local t = {
				targetUserId = tonumber(profileId) or 0,
				initialIndex = p1
			}
			
			if not fFlagProfileMomentsFeedRootRoute then
				var17.navigate(enumsModule.Screens.MomentsFeed, { extraProps = t })
				
				return
			end
			local t_1 = { name = appPage.ProfileMomentsFeed, extraProps = t }
			
			if fFlagSignalsNavP3Dispatch then
				var14.down(var14.fromLegacyPage(t_1))
				
				return
			end
			var18(navigateDown(t_1))
		end, {
			var16,
			var17,
			var18,
			profileId,
			moments
		}),
		onTileImpression = if getFFlagMomentsAnalyticsSchemaIdentity() then reactModule.useCallback(function(p2) --[[ line: 100 ]]
			-- upvalues: getFFlagMomentsAnalyticsSchemaIdentity (copy), moments (ref), profileId (ref), makeProfileTileFieldsModule (copy), fireAnalyticsEvent (copy), eventNames (copy)
			if not getFFlagMomentsAnalyticsSchemaIdentity() then return end
			local var23 = moments[p2]
			
			if var23 and profileId and var23.recommendationMetadata then
				local carousel = makeProfileTileFieldsModule.makeProfileTileImpressionFields(var23, profileId, "carousel", p2)
				
				if carousel then
					fireAnalyticsEvent(eventNames.ProfileMomentTileImpression, carousel)
				end
			end
		end, { profileId, moments }) else nil
	})
end