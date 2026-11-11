local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
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
local GetFFlagMomentsAnalyticsSchemaIdentityFunction = MomentsCommonModule.Flags.GetFFlagMomentsAnalyticsSchemaIdentity
local UseNavigationFunction = require(Parent.Navigation).useNavigation

return function(p1)
	-- upvalues: UseProfileWrapperContextModule (copy), UseProfileAnalyticsContextModule (copy), UseNavigationFunction (copy), UseUserMomentsModule (copy), ReactModule (copy), EventNamesModule (copy), EnumsModule (copy), GetFFlagMomentsAnalyticsSchemaIdentityFunction (copy), MakeProfileTileFieldsModule (copy), FireAnalyticsEventFunction (copy), EventNames (copy), MomentsCarouselModule (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseNavigationResult = UseNavigationFunction()
	local ProfileId = UseProfileWrapperContextModuleResult.profileId
	local Moments = UseUserMomentsModule(ProfileId).moments
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), UseNavigationResult (copy), EnumsModule (upval), ProfileId (copy)
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.MomentsSeeAll)
		UseNavigationResult.navigate(EnumsModule.Screens.MomentsAll, { extraProps = { profileId = ProfileId } })
	end, {
		UseProfileAnalyticsContextModuleResult,
		UseNavigationResult,
		ProfileId
	})
	local UseResult1 = ReactModule.useCallback(function(InitialIndex)
		-- upvalues: GetFFlagMomentsAnalyticsSchemaIdentityFunction (upval), Moments (copy), ProfileId (copy), MakeProfileTileFieldsModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), UseNavigationResult (copy), EnumsModule (upval)
		if GetFFlagMomentsAnalyticsSchemaIdentityFunction() then
			local Moment = Moments[InitialIndex]
			
			if Moment and ProfileId then
				local Carousel = MakeProfileTileFieldsModule.makeProfileTileInteractionFields(Moment, ProfileId, "carousel", InitialIndex)
				
				if Carousel then
					FireAnalyticsEventFunction(EventNames.ProfileMomentSelected, Carousel)
				end
			end
		else
			UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.MomentOpened)
		end
		UseNavigationResult.navigate(EnumsModule.Screens.MomentsFeed, {
			extraProps = {
				targetUserId = tonumber(ProfileId) or 0,
				initialIndex = InitialIndex
			}
		})
	end, {
		UseProfileAnalyticsContextModuleResult,
		UseNavigationResult,
		ProfileId,
		Moments
	})
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: GetFFlagMomentsAnalyticsSchemaIdentityFunction (upval), Moments (copy), ProfileId (copy), MakeProfileTileFieldsModule (upval), FireAnalyticsEventFunction (upval), EventNames (upval)
		if not GetFFlagMomentsAnalyticsSchemaIdentityFunction() then return end
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
		onTileImpression = if GetFFlagMomentsAnalyticsSchemaIdentityFunction() then UseResult2 else nil
	})
end