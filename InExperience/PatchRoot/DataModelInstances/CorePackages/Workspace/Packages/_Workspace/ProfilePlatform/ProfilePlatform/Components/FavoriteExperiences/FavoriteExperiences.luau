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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local t = {}

local function getSquareExperienceTileHeight(p1)
	return p1 + 42
end

local function useFavoriteExperiences(_)
	-- upvalues: useDispatch (ref), useProfileJsonComponentModule (ref), enumsModule (ref), t (ref), reactModule (ref), cryoModule (ref), networkingGamesModule (ref), useSelector (ref), getDeepValue (ref)
	local var2 = useDispatch()
	local experiences = useProfileJsonComponentModule(enumsModule.Components.FavoriteExperiences).experiences or t
	local var3 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), experiences (ref)
		return cryoModule.List.map(experiences, function(p1, _)
			return tostring(p1.universeId)
		end)
	end, { experiences })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), cryoModule (copy), var2 (ref), networkingGamesModule (copy)
		if var3 ~= nil and not cryoModule.isEmpty(var3) then
			var2(networkingGamesModule.GetExperiencesDetails.API(var3)):catch(function(_) end)
		end
	end, { var3 })
	local var4 = useSelector(function(p1)
		-- upvalues: getDeepValue (copy), t (copy)
		return getDeepValue(p1, "ProfilePlatform.Games.byGameId") or t
	end)
	local var5 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), var4 (ref)
		local t = {}
		
		for i, v in var3 do
			if var4[v] then
				table.insert(t, var4[v])
			end
		end
		return t
	end, { var3, var4 })
	
	return if experiences and #var5 == #var3 then var5 else t
end

return function(p1)
	-- upvalues: useDispatch (ref), useProfileWrapperContextModule (ref), profilePlatformFavoritesEnableProfilePlatformClickAnalytics (ref), useProfileAnalyticsContextModule (ref), fFlagProfilePlatformEnableImpressions (ref), useGenerateImpressionsTagModule (ref), enumsModule (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), eventNamesModule (ref), profilePlatformFavoritesNavigateToWebV2 (ref), appPage (ref), url (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), getSquareExperienceTileHeight (ref), useFavoriteExperiences (ref), fFlagProfilePlatformFavoritesEnableGameDetailAnalytics (ref), useRoactService (ref), roactAnalyticsCommonGameEvents (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (ref), useRenderExperienceTileModule (ref), useRenderExperienceTileDEPRECATEDModule (ref), formatExperienceDetailsForImpressionsModule (ref), useSendItemImpressionsModule (ref), contentType (ref), cryoModule (ref), squareCollectionGridViewModule (ref)
	local var6 = useDispatch()
	local var7 = useProfileWrapperContextModule()
	local var8 = if profilePlatformFavoritesEnableProfilePlatformClickAnalytics then useProfileAnalyticsContextModule() else nil
	local var9 = if fFlagProfilePlatformEnableImpressions then useGenerateImpressionsTagModule(enumsModule.Components.FavoriteExperiences) else nil
	local profileId = var7.profileId
	local var10 = useLocalization({ title = textKeysModule.Favorites })
	local var11 = reactModule.useCallback(function()
		-- upvalues: profilePlatformFavoritesEnableProfilePlatformClickAnalytics (copy), var8 (ref), eventNamesModule (copy), profilePlatformFavoritesNavigateToWebV2 (copy), appPage (copy), url (copy), profileId (ref), textKeysModule (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var6 (ref), navigateDown (copy)
		if profilePlatformFavoritesEnableProfilePlatformClickAnalytics and var8 then
			var8.fireAnalyticsEvent(eventNamesModule.FavoriteExperienceSeeAll)
		end
		if profilePlatformFavoritesNavigateToWebV2 then
			local t = {
				name = appPage.GenericWebPage,
				detail = string.format("%susers/%s/favorites#!/places", url.BASE_URL, profileId),
				extraProps = { titleKey = textKeysModule.Favorites }
			}
			
			if fFlagSignalsNavP3Dispatch then
				var1.down(var1.fromLegacyPage(t))
				
				return
			end
			var6(navigateDown(t, nil))
		end
	end, if profilePlatformFavoritesEnableProfilePlatformClickAnalytics then { profileId, var8 } else nil)
	local var12 = not profilePlatformFavoritesNavigateToWebV2
	local var13 = useFavoriteExperiences(profileId)
	local var14 = if fFlagProfilePlatformFavoritesEnableGameDetailAnalytics then useRoactService(roactAnalyticsCommonGameEvents) else nil
	local var15 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: profilePlatformFavoritesEnableProfilePlatformClickAnalytics (copy), var8 (ref), eventNamesModule (copy), fFlagProfilePlatformFavoritesEnableGameDetailAnalytics (copy), var13 (ref), var14 (ref), appPage (copy), p1 (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), profileId (ref)
		if profilePlatformFavoritesEnableProfilePlatformClickAnalytics then
			var8.fireAnalyticsEvent(eventNamesModule.FavoriteExperienceOpened, { experienceId = p2.experienceId, positionInComponent = p3 })
		end
		if fFlagProfilePlatformFavoritesEnableGameDetailAnalytics then
			var14.reportOpenGameDetailFromProfile(p2.rootPlaceId, p3, if var13 then #var13 else 0, p2.experienceId, appPage.ProfilePlatform, p1.layoutOrder, p4 or 1, if fFlagProfilePlatformImproveGameDetailsAnalytics then profileId else nil)
		end
	end, if fFlagProfilePlatformFavoritesEnableGameDetailAnalytics then { var8, var13, var14, p1.layoutOrder } else { var8 })
	
	return if cryoModule.isEmpty(var13) then nil else reactModule.createElement(squareCollectionGridViewModule, {
		getItemHeight = getSquareExperienceTileHeight,
		hideHeaderButton = var12,
		items = var13,
		layoutOrder = p1.layoutOrder,
		onActivateHeader = var11,
		renderItem = if fFlagProfilePlatformEnableImpressions then useRenderExperienceTileModule(var9, "ProfileFavoriteExperienceTile", var15) else useRenderExperienceTileDEPRECATEDModule("ProfileFavoriteExperienceTile", var15),
		title = var10.title,
		impressionsTag = if fFlagProfilePlatformEnableImpressions then var9 else nil,
		sendImpressions = if fFlagProfilePlatformEnableImpressions then if fFlagProfilePlatformEnableImpressions then useSendItemImpressionsModule(if fFlagProfilePlatformEnableImpressions then reactModule.useMemo(function()
			-- upvalues: formatExperienceDetailsForImpressionsModule (copy), var13 (ref)
			return formatExperienceDetailsForImpressionsModule(var13)
		end, { var13 }) else nil, 3, contentType.Game, p1.layoutOrder, enumsModule.Components.FavoriteExperiences) else nil else nil,
		overrides = { numColumns = 3 }
	})
end