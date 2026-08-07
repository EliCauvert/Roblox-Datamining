local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local constantsModule = require(profilePlatform.Common.Constants)
local sortCurrentlyWearingModule = require(profilePlatform.Components.CurrentlyWearing.SortCurrentlyWearing)
local roactUtilsModule = require(parent.RoactUtils)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEffectOnMount = roactUtilsModule.Hooks.useEffectOnMount
local enumsModule = require(profilePlatform.Common.Enums)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local networkingCurrentlyWearingModule = require(profilePlatform.Networking.NetworkingCurrentlyWearing)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local useMarketplaceAnalyticsContextModule = require(profilePlatform.Hooks.useMarketplaceAnalyticsContext)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(profilePlatform.Common.AssetInfo)
local networkingCatalogModule = require(profilePlatform.Networking.NetworkingCatalog)
local fFlagProfilePlatformEnableInventory = require(parent.SharedFlags).FFlagProfilePlatformEnableInventory
local fFlagProfilePlatformEnableStore = require(parent.SharedFlags).FFlagProfilePlatformEnableStore
local fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule = require(profilePlatform.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields)
local fFlagAddIEMProfilePage = require(parent.SharedFlags).FFlagAddIEMProfilePage
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local fFlagProfileInspectAvatarCWEntryModule = require(profilePlatform.Flags.FFlagProfileInspectAvatarCWEntry)
local fFlagProfileInspectAndBuyRefactorTooltipModule = require(profilePlatform.Flags.FFlagProfileInspectAndBuyRefactorTooltip)
local getInspectAvatarTooltipStoreModule = require(profilePlatform.Stores.GetInspectAvatarTooltipStore)
local useNavigation = require(parent.Navigation).useNavigation
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local IXPService = game:GetService("IXPService")
local socialProfileCurrentlyWearingClickThroughLayer = game:DefineFastString("SocialProfileCurrentlyWearingClickThroughLayer", "Social.ProfileCurrentlyWearingClickThrough")
local fFlagProfilePlatformEnableBundlesInAssetsCarousel = require(parent.SharedFlags).FFlagProfilePlatformEnableBundlesInAssetsCarousel
local assetsCarouselModule = require(profilePlatform.Components.AssetsCarousel)

return function(p0) --[[ line: 52 | named "CurrentlyWearingCarousel" ]]
	-- upvalues: useDispatch (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), fFlagProfilePlatformEnableInventory (ref), useLocalization (ref), textKeysModule (ref), useMarketplaceAnalyticsContextModule (ref), fFlagAddIEMProfilePage (ref), fFlagProfileInspectAvatarCWEntryModule (ref), useLocalUserId (ref), enumsModule (ref), useNavigation (ref), reactModule (ref), fFlagProfileInspectAndBuyRefactorTooltipModule (ref), getInspectAvatarTooltipStoreModule (ref), fFlagProfilePlatformEnableBundlesInAssetsCarousel (ref), IXPService (ref), socialProfileCurrentlyWearingClickThroughLayer (ref), fFlagProfilePlatformEnableStore (ref), eventNamesModule (ref), fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (ref), useProfileJsonComponentModule (ref), constantsModule (ref), useSelector (ref), networkingCatalogModule (ref), cryoModule (ref), useEffectOnMount (ref), networkingCurrentlyWearingModule (ref), sortCurrentlyWearingModule (ref), assetsCarouselModule (ref), fFlagAXEnableProfileTab (ref)
	local var29
	local var22 = useDispatch()
	local var23 = useProfileWrapperContextModule()
	local var24 = useProfileAnalyticsContextModule()
	local var25 = if fFlagProfilePlatformEnableInventory then useLocalization({ currentlyWearing = textKeysModule.CurrentlyWearing }) else nil
	local var26 = useMarketplaceAnalyticsContextModule()
	local var27 = if fFlagAddIEMProfilePage then var23.sourceInfo.source else nil
	local var28 = if fFlagProfileInspectAvatarCWEntryModule then useLocalUserId() else nil
	
	if fFlagProfileInspectAvatarCWEntryModule then
		var29 = tostring(var23.profileId) == tostring(var28)
		var29 = nil
	else
		var29 = nil
	end
	local var30 = fFlagProfileInspectAvatarCWEntryModule and (not var29 and var27 ~= enumsModule.Sources.InExperienceProfile)
	local var31 = if fFlagProfileInspectAvatarCWEntryModule then useNavigation() else nil
	local var32 = if fFlagProfileInspectAvatarCWEntryModule then reactModule.useCallback(function() --[[ line: 76 ]]
		-- upvalues: fFlagProfileInspectAndBuyRefactorTooltipModule (copy), getInspectAvatarTooltipStoreModule (copy), var31 (ref), enumsModule (copy)
		if fFlagProfileInspectAndBuyRefactorTooltipModule then
			getInspectAvatarTooltipStoreModule(false).permanentlyDismiss()
		end
		var31.navigate(enumsModule.Screens.InspectAvatarSheet)
	end, { var31 }) else nil
	local var33 = reactModule.useCallback(function(p1, p2, _, _, p3) --[[ line: 85 ]]
		-- upvalues: fFlagAddIEMProfilePage (copy), var27 (ref), enumsModule (copy), var23 (ref), fFlagProfilePlatformEnableBundlesInAssetsCarousel (copy), IXPService (copy), socialProfileCurrentlyWearingClickThroughLayer (copy), fFlagProfilePlatformEnableStore (copy), var24 (ref), eventNamesModule (copy), fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (copy), var26 (ref)
		if fFlagAddIEMProfilePage and var27 == enumsModule.Sources.InExperienceProfile then
			var23.navigateTo.inspectAvatar()
			
			return
		elseif fFlagProfilePlatformEnableBundlesInAssetsCarousel then
			var23.navigateTo.itemOrBundleDetails(p1, p2)
		else
			var23.navigateTo.itemDetails(p1)
		end
		IXPService:LogFlagLinkedUserLayerExposure(socialProfileCurrentlyWearingClickThroughLayer)
		
		if fFlagProfilePlatformEnableStore then
			var24.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened, if fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule then {
				btnContext = tostring(enumsModule.Components.CurrentlyWearing),
				btnUnitId = tostring(p1),
				btnSortPosition = tostring(p3)
			} else {
				source = tostring(enumsModule.Components.CurrentlyWearing),
				positionInComponent = tostring(p3),
				component = tostring(enumsModule.Components.CurrentlyWearing),
				itemId = tostring(p1)
			})
			var23.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(var26, p1, p2, tostring(enumsModule.Components.CurrentlyWearing), p3)
			
			return
		end
		var24.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened)
		var23.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(var26, p1, p2)
	end, {
		var23.navigateTo.itemDetails,
		var23.externalAnalytics.catalogAnalytics,
		var23.navigateTo.tryOnItem,
		var23.navigateTo.inspectAvatar,
		var27
	})
	local assets = useProfileJsonComponentModule(enumsModule.Components.CurrentlyWearing).assets or {}
	local var35 = nil
	local var36 = nil
	
	if fFlagProfilePlatformEnableBundlesInAssetsCarousel then
		var35 = useSelector(reactModule.useCallback(function(p4) --[[ line: 143 ]]
			-- upvalues: constantsModule (copy), assets (ref), enumsModule (copy)
			local bundleDetails = p4[constantsModule.RODUX_KEY].BundleDetails or {}
			local assetDetails = p4[constantsModule.RODUX_KEY].AssetDetails or {}
			local t = {}
			local var42 = 1
			
			for i, v in assets do
				local var43 = if v.itemType == enumsModule.ItemTypes.Bundle then bundleDetails[tostring(v.assetId)] else assetDetails[tostring(v.assetId)]
				
				if var43 then
					var43.itemType = v.itemType
					t[var42] = var43
					var42 += 1
				end
			end
			return t
		end, { assets }))
		reactModule.useEffect(function() --[[ line: 166 ]]
			-- upvalues: assets (ref), var22 (ref), networkingCatalogModule (copy)
			if #assets > 0 then
				var22(networkingCatalogModule.GetItemAndBundleDetails.API(assets))
			end
		end, { assets, var22 })
	else
		local var37 = reactModule.useMemo(function() --[[ line: 172 ]]
			-- upvalues: cryoModule (copy), assets (ref)
			return cryoModule.List.map(assets, function(p5) --[[ line: 173 ]]
				return p5.assetId
			end)
		end, { assets })
		useEffectOnMount(function() --[[ line: 178 ]]
			-- upvalues: var22 (ref), networkingCurrentlyWearingModule (copy), var37 (ref)
			var22(networkingCurrentlyWearingModule.GetItemDetails.API(var37)):andThen(function(_) --[[ line: 180 ]] end):catch(function(_) --[[ line: 181 ]] end)
		end)
		local var38 = useSelector(function(p6) --[[ line: 186 ]]
			-- upvalues: constantsModule (copy)
			return p6[constantsModule.RODUX_KEY].ItemAssets or {}
		end)
		var36 = reactModule.useMemo(function() --[[ line: 190 ]]
			-- upvalues: var37 (ref), var38 (ref), cryoModule (copy), sortCurrentlyWearingModule (copy)
			local t = {}
			local var45 = 1
			
			for i, v in var37 do
				local var46 = var38[tostring(v)]
				
				if var46 then
					t[var45] = var46
					var45 += 1
				end
			end
			return cryoModule.List.sort(t, function(p7, p8) --[[ line: 203 ]]
				-- upvalues: sortCurrentlyWearingModule (copy)
				return sortCurrentlyWearingModule(p7, p8)
			end)
		end, { var38, var37 })
	end
	return if fFlagProfilePlatformEnableBundlesInAssetsCarousel and #var35 <= 0 then nil else reactModule.createElement(assetsCarouselModule, {
		title = if fFlagProfilePlatformEnableInventory then var25.currentlyWearing else nil,
		layoutOrder = p0.layoutOrder,
		assets = if fFlagProfilePlatformEnableBundlesInAssetsCarousel then var35 else var36,
		openItemDetails = var33,
		onActivateHeader = if var30 then var32 else nil,
		tileVariant = if fFlagAXEnableProfileTab then var23.currentlyWearingVariant else nil
	})
end