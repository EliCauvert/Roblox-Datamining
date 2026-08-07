local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local roactUtilsModule = require(parent.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local appPage = require(parent.RobloxAppEnums).AppPage
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local url = require(parent.Http).Url
local networkingGamesModule = require(profilePlatform.Networking.NetworkingGames)
local getDeepValue = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local squareCollectionGridViewModule = require(profilePlatform.BaseComponents.CollectionGridViews.SquareCollectionGridView)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useRenderExperienceTileModule = require(profilePlatform.Hooks.Tiles.useRenderExperienceTile)
local useRenderExperienceTileDEPRECATEDModule = require(profilePlatform.Hooks.Tiles.useRenderExperienceTile_DEPRECATED)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local useSendItemImpressionsModule = require(profilePlatform.Hooks.useSendItemImpressions)
local useGenerateImpressionsTagModule = require(profilePlatform.Hooks.useGenerateImpressionsTag)
local formatExperienceDetailsForImpressionsModule = require(profilePlatform.Hooks.formatExperienceDetailsForImpressions)
local enumsModule = require(profilePlatform.Common.Enums)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local _ = require(profilePlatform.Common.Types)
local contentType = require(parent.UnifiedLogging).ContentType
local roactAnalyticsCommonGameEvents = require(parent.RoactServiceTags).RoactAnalyticsCommonGameEvents
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local sharedFlagsModule = require(parent.SharedFlags)
local profilePlatformFavoritesNavigateToWebV2 = game:DefineFastFlag("ProfilePlatformFavoritesNavigateToWeb_V2", false)
local profilePlatformFavoritesEnableProfilePlatformClickAnalytics = game:DefineFastFlag("ProfilePlatformFavoritesEnableProfilePlatformClickAnalytics", false)
local fFlagProfilePlatformFavoritesEnableGameDetailAnalytics = sharedFlagsModule.FFlagProfilePlatformFavoritesEnableGameDetailAnalytics
local fFlagProfilePlatformEnableImpressions = require(parent.SharedFlags).FFlagProfilePlatformEnableImpressions
local fFlagProfilePlatformImproveGameDetailsAnalytics = require(parent.SharedFlags).FFlagProfilePlatformImproveGameDetailsAnalytics
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local var20 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local t = {}

local function getSquareExperienceTileHeight(p0) --[[ line: 65 ]]
	return p0 + 42
end

local function useFavoriteExperiences(_) --[[ line: 69 ]]
	-- upvalues: useDispatch (ref), useProfileJsonComponentModule (ref), enumsModule (ref), t (ref), reactModule (ref), cryoModule (ref), networkingGamesModule (ref), useSelector (ref), getDeepValue (ref)
	local var24 = useDispatch()
	local experiences = useProfileJsonComponentModule(enumsModule.Components.FavoriteExperiences).experiences or t
	local var26 = reactModule.useMemo(function() --[[ line: 75 ]]
		-- upvalues: cryoModule (copy), experiences (ref)
		return cryoModule.List.map(experiences, function(p1, _) --[[ line: 76 ]]
			return tostring(p1.universeId)
		end)
	end, { experiences })
	reactModule.useEffect(function() --[[ line: 81 ]]
		-- upvalues: var26 (ref), cryoModule (copy), var24 (ref), networkingGamesModule (copy)
		if var26 ~= nil and not cryoModule.isEmpty(var26) then
			var24(networkingGamesModule.GetExperiencesDetails.API(var26)):catch(function(_) --[[ line: 83 ]] end)
		end
	end, { var26 })
	local var27 = useSelector(function(p2) --[[ line: 89 ]]
		-- upvalues: getDeepValue (copy), t (copy)
		return getDeepValue(p2, "ProfilePlatform.Games.byGameId") or t
	end)
	local var28 = reactModule.useMemo(function() --[[ line: 93 ]]
		-- upvalues: var26 (ref), var27 (ref)
		local t = {}
		
		for i, v in var26 do
			if var27[v] then
				table.insert(t, var27[v])
			end
		end
		return t
	end, { var26, var27 })
	
	return if experiences and #var28 == #var26 then var28 else t
end

return function(p3) --[[ line: 114 | named "FavoriteExperiences" ]]
	-- upvalues: useDispatch (ref), useProfileWrapperContextModule (ref), profilePlatformFavoritesEnableProfilePlatformClickAnalytics (ref), useProfileAnalyticsContextModule (ref), fFlagProfilePlatformEnableImpressions (ref), useGenerateImpressionsTagModule (ref), enumsModule (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), eventNamesModule (ref), profilePlatformFavoritesNavigateToWebV2 (ref), appPage (ref), url (ref), fFlagSignalsNavP3Dispatch (ref), var20 (ref), navigateDown (ref), getSquareExperienceTileHeight (ref), useFavoriteExperiences (ref), fFlagProfilePlatformFavoritesEnableGameDetailAnalytics (ref), useRoactService (ref), roactAnalyticsCommonGameEvents (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (ref), useRenderExperienceTileModule (ref), useRenderExperienceTileDEPRECATEDModule (ref), formatExperienceDetailsForImpressionsModule (ref), useSendItemImpressionsModule (ref), contentType (ref), cryoModule (ref), squareCollectionGridViewModule (ref)
	local var30 = useDispatch()
	local var31 = useProfileWrapperContextModule()
	local var32 = if profilePlatformFavoritesEnableProfilePlatformClickAnalytics then useProfileAnalyticsContextModule() else nil
	local var33 = if fFlagProfilePlatformEnableImpressions then useGenerateImpressionsTagModule(enumsModule.Components.FavoriteExperiences) else nil
	local profileId = var31.profileId
	local var34 = useLocalization({ title = textKeysModule.Favorites })
	local var35 = reactModule.useCallback(function() --[[ line: 131 ]]
		-- upvalues: profilePlatformFavoritesEnableProfilePlatformClickAnalytics (copy), var32 (ref), eventNamesModule (copy), profilePlatformFavoritesNavigateToWebV2 (copy), appPage (copy), url (copy), profileId (ref), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var20 (copy), var30 (ref), navigateDown (copy)
		if profilePlatformFavoritesEnableProfilePlatformClickAnalytics and var32 then
			var32.fireAnalyticsEvent(eventNamesModule.FavoriteExperienceSeeAll)
		end
		if profilePlatformFavoritesNavigateToWebV2 then
			local t = {
				name = appPage.GenericWebPage,
				detail = string.format("%susers/%s/favorites#!/places", url.BASE_URL, profileId),
				extraProps = { titleKey = textKeysModule.Favorites }
			}
			
			if fFlagSignalsNavP3Dispatch then
				var20.down(var20.fromLegacyPage(t))
				
				return
			end
			var30(navigateDown(t, nil))
		end
	end, if profilePlatformFavoritesEnableProfilePlatformClickAnalytics then { profileId, var32 } else nil)
	local var36 = not profilePlatformFavoritesNavigateToWebV2
	local var37 = useFavoriteExperiences(profileId)
	local var38 = if fFlagProfilePlatformFavoritesEnableGameDetailAnalytics then useRoactService(roactAnalyticsCommonGameEvents) else nil
	local var39 = reactModule.useCallback(function(p4, p5, p6) --[[ line: 165 ]]
		-- upvalues: profilePlatformFavoritesEnableProfilePlatformClickAnalytics (copy), var32 (ref), eventNamesModule (copy), fFlagProfilePlatformFavoritesEnableGameDetailAnalytics (copy), var37 (ref), var38 (ref), appPage (copy), p3 (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), profileId (ref)
		if profilePlatformFavoritesEnableProfilePlatformClickAnalytics then
			var32.fireAnalyticsEvent(eventNamesModule.FavoriteExperienceOpened, { experienceId = p4.experienceId, positionInComponent = p5 })
		end
		if fFlagProfilePlatformFavoritesEnableGameDetailAnalytics then
			var38.reportOpenGameDetailFromProfile(p4.rootPlaceId, p5, if var37 then #var37 else 0, p4.experienceId, appPage.ProfilePlatform, p3.layoutOrder, p6 or 1, if fFlagProfilePlatformImproveGameDetailsAnalytics then profileId else nil)
		end
	end, if fFlagProfilePlatformFavoritesEnableGameDetailAnalytics then { var32, var37, var38, p3.layoutOrder } else { var32 })
	
	return if cryoModule.isEmpty(var37) then nil else reactModule.createElement(squareCollectionGridViewModule, {
		getItemHeight = getSquareExperienceTileHeight,
		hideHeaderButton = var36,
		items = var37,
		layoutOrder = p3.layoutOrder,
		onActivateHeader = var35,
		renderItem = if fFlagProfilePlatformEnableImpressions then useRenderExperienceTileModule(var33, "ProfileFavoriteExperienceTile", var39) else useRenderExperienceTileDEPRECATEDModule("ProfileFavoriteExperienceTile", var39),
		title = var34.title,
		impressionsTag = if fFlagProfilePlatformEnableImpressions then var33 else nil,
		sendImpressions = if fFlagProfilePlatformEnableImpressions then if fFlagProfilePlatformEnableImpressions then useSendItemImpressionsModule(if fFlagProfilePlatformEnableImpressions then reactModule.useMemo(function() --[[ line: 198 ]]
			-- upvalues: formatExperienceDetailsForImpressionsModule (copy), var37 (ref)
			return formatExperienceDetailsForImpressionsModule(var37)
		end, { var37 }) else nil, 3, contentType.Game, p3.layoutOrder, enumsModule.Components.FavoriteExperiences) else nil else nil,
		overrides = { numColumns = 3 }
	})
end