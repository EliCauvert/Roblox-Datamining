local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local AppPage = require(Parent.RobloxAppEnums).AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local Url = require(Parent.Http).Url
local NetworkingGamesModule = require(ProfilePlatform.Networking.NetworkingGames)
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local SquareCollectionGridViewModule = require(ProfilePlatform.BaseComponents.CollectionGridViews.SquareCollectionGridView)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseRenderExperienceTileModule = require(ProfilePlatform.Hooks.Tiles.useRenderExperienceTile)
local UseRenderExperienceTileDEPRECATEDModule = require(ProfilePlatform.Hooks.Tiles.useRenderExperienceTile_DEPRECATED)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local UseSendItemImpressionsModule = require(ProfilePlatform.Hooks.useSendItemImpressions)
local UseGenerateImpressionsTagModule = require(ProfilePlatform.Hooks.useGenerateImpressionsTag)
local FormatExperienceDetailsForImpressionsModule = require(ProfilePlatform.Hooks.formatExperienceDetailsForImpressions)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local _ = require(ProfilePlatform.Common.Types)
local ContentType = require(Parent.UnifiedLogging).ContentType
local RoactAnalyticsCommonGameEvents = require(Parent.RoactServiceTags).RoactAnalyticsCommonGameEvents
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local SharedFlagsModule = require(Parent.SharedFlags)
local ProfilePlatformFavoritesNavigateToWebV2 = game:DefineFastFlag("ProfilePlatformFavoritesNavigateToWeb_V2", false)
local ProfilePlatformFavoritesEnableProfilePlatformClickAnalytics = game:DefineFastFlag("ProfilePlatformFavoritesEnableProfilePlatformClickAnalytics", false)
local FFlagProfilePlatformFavoritesEnableGameDetailAnalytics = SharedFlagsModule.FFlagProfilePlatformFavoritesEnableGameDetailAnalytics
local FFlagProfilePlatformEnableImpressions = require(Parent.SharedFlags).FFlagProfilePlatformEnableImpressions
local FFlagProfilePlatformImproveGameDetailsAnalytics = require(Parent.SharedFlags).FFlagProfilePlatformImproveGameDetailsAnalytics
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local t = {}

local function getSquareExperienceTileHeight(p1: number): number
	return p1 + 42
end

local function useFavoriteExperiences(_)
	-- upvalues: UseDispatchFunction (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), t (copy), ReactModule (copy), CryoModule (copy), NetworkingGamesModule (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local Experiences = UseProfileJsonComponentModule(EnumsModule.Components.FavoriteExperiences).experiences or t
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), Experiences (copy)
		return CryoModule.List.map(Experiences, function(p1, _): string
			return (tostring(p1.universeId))
		end)
	end, { Experiences })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy), CryoModule (upval), UseDispatchResult (copy), NetworkingGamesModule (upval)
		if UseMemoResult ~= nil and not CryoModule.isEmpty(UseMemoResult) then
			UseDispatchResult(NetworkingGamesModule.GetExperiencesDetails.API(UseMemoResult)):catch(function(_) end)
		end
	end, { UseMemoResult })
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValueFunction (upval), t (upval)
		return GetDeepValueFunction(p1, "ProfilePlatform.Games.byGameId") or t
	end)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), UseSelectorResult (copy)
		local List = {}
		
		for _, value in UseMemoResult do
			if UseSelectorResult[value] then
				table.insert(List, UseSelectorResult[value])
			end
		end
		return List
	end, { UseMemoResult, UseSelectorResult })
	
	return if Experiences and #UseMemoResult1 == #UseMemoResult then UseMemoResult1 else t
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseProfileWrapperContextModule (copy), ProfilePlatformFavoritesEnableProfilePlatformClickAnalytics (copy), UseProfileAnalyticsContextModule (copy), FFlagProfilePlatformEnableImpressions (copy), UseGenerateImpressionsTagModule (copy), EnumsModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), EventNamesModule (copy), ProfilePlatformFavoritesNavigateToWebV2 (copy), AppPage (copy), Url (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), getSquareExperienceTileHeight (copy), useFavoriteExperiences (copy), FFlagProfilePlatformFavoritesEnableGameDetailAnalytics (copy), UseRoactServiceFunction (copy), RoactAnalyticsCommonGameEvents (copy), FFlagProfilePlatformImproveGameDetailsAnalytics (copy), UseRenderExperienceTileModule (copy), UseRenderExperienceTileDEPRECATEDModule (copy), FormatExperienceDetailsForImpressionsModule (copy), UseSendItemImpressionsModule (copy), ContentType (copy), CryoModule (copy), SquareCollectionGridViewModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseProfileAnalyticsContextModuleResult = if ProfilePlatformFavoritesEnableProfilePlatformClickAnalytics then UseProfileAnalyticsContextModule() else nil
	local UseGenerateImpressionsTagModuleResult = if FFlagProfilePlatformEnableImpressions then UseGenerateImpressionsTagModule(EnumsModule.Components.FavoriteExperiences) else nil
	local ProfileId = UseProfileWrapperContextModule().profileId
	local UseLocalizationResult = UseLocalizationFunction({ title = TextKeysModule.Favorites })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: ProfilePlatformFavoritesEnableProfilePlatformClickAnalytics (upval), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), ProfilePlatformFavoritesNavigateToWebV2 (upval), AppPage (upval), Url (upval), ProfileId (copy), TextKeysModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval)
		if ProfilePlatformFavoritesEnableProfilePlatformClickAnalytics and UseProfileAnalyticsContextModuleResult then
			UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.FavoriteExperienceSeeAll)
		end
		if ProfilePlatformFavoritesNavigateToWebV2 then
			local config = {
				name = AppPage.GenericWebPage,
				detail = string.format("%susers/%s/favorites#!/places", Url.BASE_URL, ProfileId),
				extraProps = { titleKey = TextKeysModule.Favorites }
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			end
			UseDispatchResult(NavigateDownFunction(config, nil))
		end
	end, if ProfilePlatformFavoritesEnableProfilePlatformClickAnalytics then { ProfileId, UseProfileAnalyticsContextModuleResult } else nil)
	local NoProfilePlatformFavoritesNavigateToWebV2 = not ProfilePlatformFavoritesNavigateToWebV2
	local UseFavoriteExperiencesResult = useFavoriteExperiences(ProfileId)
	local UseRoactServiceResult = if FFlagProfilePlatformFavoritesEnableGameDetailAnalytics then UseRoactServiceFunction(RoactAnalyticsCommonGameEvents) else nil
	local UseResult1 = ReactModule.useCallback(function(p2, PositionInComponent, p3)
		-- upvalues: ProfilePlatformFavoritesEnableProfilePlatformClickAnalytics (upval), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), FFlagProfilePlatformFavoritesEnableGameDetailAnalytics (upval), UseFavoriteExperiencesResult (copy), UseRoactServiceResult (copy), AppPage (upval), p1 (copy), FFlagProfilePlatformImproveGameDetailsAnalytics (upval), ProfileId (copy)
		if ProfilePlatformFavoritesEnableProfilePlatformClickAnalytics then
			UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.FavoriteExperienceOpened, {
				experienceId = p2.experienceId,
				positionInComponent = PositionInComponent
			})
		end
		if FFlagProfilePlatformFavoritesEnableGameDetailAnalytics then
			UseRoactServiceResult.reportOpenGameDetailFromProfile(p2.rootPlaceId, PositionInComponent, if UseFavoriteExperiencesResult then #UseFavoriteExperiencesResult else 0, p2.experienceId, AppPage.ProfilePlatform, p1.layoutOrder, p3 or 1, if FFlagProfilePlatformImproveGameDetailsAnalytics then ProfileId else nil)
		end
	end, if FFlagProfilePlatformFavoritesEnableGameDetailAnalytics then {
		UseProfileAnalyticsContextModuleResult,
		UseFavoriteExperiencesResult,
		UseRoactServiceResult,
		p1.layoutOrder
	} else { UseProfileAnalyticsContextModuleResult })
	local ProfileFavoriteExperienceTile = if FFlagProfilePlatformEnableImpressions then UseRenderExperienceTileModule(UseGenerateImpressionsTagModuleResult, "ProfileFavoriteExperienceTile", UseResult1) else UseRenderExperienceTileDEPRECATEDModule("ProfileFavoriteExperienceTile", UseResult1)
	local UseMemoResult = if FFlagProfilePlatformEnableImpressions then ReactModule.useMemo(function()
		-- upvalues: FormatExperienceDetailsForImpressionsModule (upval), UseFavoriteExperiencesResult (copy)
		return FormatExperienceDetailsForImpressionsModule(UseFavoriteExperiencesResult)
	end, { UseFavoriteExperiencesResult }) else nil
	local UseSendItemImpressionsModuleResult = if FFlagProfilePlatformEnableImpressions then UseSendItemImpressionsModule(UseMemoResult, 3, ContentType.Game, p1.layoutOrder, EnumsModule.Components.FavoriteExperiences) else nil
	
	return if CryoModule.isEmpty(UseFavoriteExperiencesResult) then nil else ReactModule.createElement(SquareCollectionGridViewModule, {
		getItemHeight = getSquareExperienceTileHeight,
		hideHeaderButton = NoProfilePlatformFavoritesNavigateToWebV2,
		items = UseFavoriteExperiencesResult,
		layoutOrder = p1.layoutOrder,
		onActivateHeader = UseResult,
		renderItem = ProfileFavoriteExperienceTile,
		title = UseLocalizationResult.title,
		impressionsTag = if FFlagProfilePlatformEnableImpressions then UseGenerateImpressionsTagModuleResult else nil,
		sendImpressions = if FFlagProfilePlatformEnableImpressions then UseSendItemImpressionsModuleResult else nil,
		overrides = { numColumns = 3 }
	})
end