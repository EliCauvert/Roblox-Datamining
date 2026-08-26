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
local fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module = require(profilePlatform.Flags.FFlagSocialEnableProfileInspectAndBuyAnalyticsV2)
local useNavigation = require(parent.Navigation).useNavigation
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local IXPService = game:GetService("IXPService")
local socialProfileCurrentlyWearingClickThroughLayer = game:DefineFastString("SocialProfileCurrentlyWearingClickThroughLayer", "Social.ProfileCurrentlyWearingClickThrough")
local fFlagProfilePlatformEnableBundlesInAssetsCarousel = require(parent.SharedFlags).FFlagProfilePlatformEnableBundlesInAssetsCarousel
local assetsCarouselModule = require(profilePlatform.Components.AssetsCarousel)

return function(p1)
	-- upvalues: useDispatch (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), fFlagProfilePlatformEnableInventory (ref), useLocalization (ref), textKeysModule (ref), useMarketplaceAnalyticsContextModule (ref), fFlagAddIEMProfilePage (ref), fFlagProfileInspectAvatarCWEntryModule (ref), useLocalUserId (ref), enumsModule (ref), useNavigation (ref), reactModule (ref), fFlagProfileInspectAndBuyRefactorTooltipModule (ref), getInspectAvatarTooltipStoreModule (ref), fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module (ref), eventNamesModule (ref), fFlagProfilePlatformEnableBundlesInAssetsCarousel (ref), IXPService (ref), socialProfileCurrentlyWearingClickThroughLayer (ref), fFlagProfilePlatformEnableStore (ref), fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (ref), useProfileJsonComponentModule (ref), constantsModule (ref), useSelector (ref), networkingCatalogModule (ref), cryoModule (ref), useEffectOnMount (ref), networkingCurrentlyWearingModule (ref), sortCurrentlyWearingModule (ref), assetsCarouselModule (ref), fFlagAXEnableProfileTab (ref)
	local var1
	local var2 = useDispatch()
	local var3 = useProfileWrapperContextModule()
	local var4 = useProfileAnalyticsContextModule()
	local var5 = if fFlagProfilePlatformEnableInventory then useLocalization({ currentlyWearing = textKeysModule.CurrentlyWearing }) else nil
	local var6 = useMarketplaceAnalyticsContextModule()
	local var7 = if fFlagAddIEMProfilePage then var3.sourceInfo.source else nil
	local var8 = if fFlagProfileInspectAvatarCWEntryModule then useLocalUserId() else nil
	
	if fFlagProfileInspectAvatarCWEntryModule then
		var1 = tostring(var3.profileId) == tostring(var8)
		var1 = nil
	else
		var1 = nil
	end
	local var9 = fFlagProfileInspectAvatarCWEntryModule and (not var1 and var7 ~= enumsModule.Sources.InExperienceProfile)
	local var10 = if fFlagProfileInspectAvatarCWEntryModule then useNavigation() else nil
	local var11 = if fFlagProfileInspectAvatarCWEntryModule then reactModule.useCallback(function()
		-- upvalues: fFlagProfileInspectAndBuyRefactorTooltipModule (copy), getInspectAvatarTooltipStoreModule (copy), fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module (copy), var4 (ref), eventNamesModule (copy), var10 (ref), enumsModule (copy)
		if fFlagProfileInspectAndBuyRefactorTooltipModule then
			getInspectAvatarTooltipStoreModule(false).permanentlyDismiss()
		end
		if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then
			var4.fireAnalyticsEvent(eventNamesModule.CurrentlyWearingHeaderButton)
		end
		var10.navigate(enumsModule.Screens.InspectAvatarSheet)
	end, {
		var10,
		if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then var4 else nil
	}) else nil
	local var12 = reactModule.useCallback(function(p2, p3, _, _, p4)
		-- upvalues: fFlagAddIEMProfilePage (copy), var7 (ref), enumsModule (copy), var3 (ref), fFlagProfilePlatformEnableBundlesInAssetsCarousel (copy), IXPService (copy), socialProfileCurrentlyWearingClickThroughLayer (copy), fFlagProfilePlatformEnableStore (copy), var4 (ref), eventNamesModule (copy), fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (copy), var6 (ref)
		if fFlagAddIEMProfilePage and var7 == enumsModule.Sources.InExperienceProfile then
			var3.navigateTo.inspectAvatar()
			
			return
		elseif fFlagProfilePlatformEnableBundlesInAssetsCarousel then
			var3.navigateTo.itemOrBundleDetails(p2, p3)
		else
			var3.navigateTo.itemDetails(p2)
		end
		IXPService:LogFlagLinkedUserLayerExposure(socialProfileCurrentlyWearingClickThroughLayer)
		
		if fFlagProfilePlatformEnableStore then
			var4.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened, if fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule then {
				btnContext = tostring(enumsModule.Components.CurrentlyWearing),
				btnUnitId = tostring(p2),
				btnSortPosition = tostring(p4)
			} else {
				source = tostring(enumsModule.Components.CurrentlyWearing),
				positionInComponent = tostring(p4),
				component = tostring(enumsModule.Components.CurrentlyWearing),
				itemId = tostring(p2)
			})
			var3.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(var6, p2, p3, tostring(enumsModule.Components.CurrentlyWearing), p4)
			
			return
		end
		var4.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened)
		var3.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(var6, p2, p3)
	end, {
		var3.navigateTo.itemDetails,
		var3.externalAnalytics.catalogAnalytics,
		var3.navigateTo.tryOnItem,
		var3.navigateTo.inspectAvatar,
		var7
	})
	local assets = useProfileJsonComponentModule(enumsModule.Components.CurrentlyWearing).assets or {}
	local var13 = nil
	local var14 = nil
	
	if fFlagProfilePlatformEnableBundlesInAssetsCarousel then
		var13 = useSelector(reactModule.useCallback(function(p2)
			-- upvalues: constantsModule (copy), assets (ref), enumsModule (copy)
			local bundleDetails = p2[constantsModule.RODUX_KEY].BundleDetails or {}
			local assetDetails = p2[constantsModule.RODUX_KEY].AssetDetails or {}
			local t = {}
			local var15 = 1
			
			for i, v in assets do
				local var16 = if v.itemType == enumsModule.ItemTypes.Bundle then bundleDetails[tostring(v.assetId)] else assetDetails[tostring(v.assetId)]
				
				if var16 then
					var16.itemType = v.itemType
					t[var15] = var16
					var15 += 1
				end
			end
			return t
		end, { assets }))
		reactModule.useEffect(function()
			-- upvalues: assets (ref), var2 (ref), networkingCatalogModule (copy)
			if #assets > 0 then
				var2(networkingCatalogModule.GetItemAndBundleDetails.API(assets))
			end
		end, { assets, var2 })
	else
		local var17 = reactModule.useMemo(function()
			-- upvalues: cryoModule (copy), assets (ref)
			return cryoModule.List.map(assets, function(p3)
				return p3.assetId
			end)
		end, { assets })
		useEffectOnMount(function()
			-- upvalues: var2 (ref), networkingCurrentlyWearingModule (copy), var17 (ref)
			var2(networkingCurrentlyWearingModule.GetItemDetails.API(var17)):andThen(function(_) end):catch(function(_) end)
		end)
		local var18 = useSelector(function(p3)
			-- upvalues: constantsModule (copy)
			return p3[constantsModule.RODUX_KEY].ItemAssets or {}
		end)
		var14 = reactModule.useMemo(function()
			-- upvalues: var17 (ref), var18 (ref), cryoModule (copy), sortCurrentlyWearingModule (copy)
			local t = {}
			local var19 = 1
			
			for i, v in var17 do
				local var20 = var18[tostring(v)]
				
				if var20 then
					t[var19] = var20
					var19 += 1
				end
			end
			return cryoModule.List.sort(t, function(p3, p4)
				-- upvalues: sortCurrentlyWearingModule (copy)
				return sortCurrentlyWearingModule(p3, p4)
			end)
		end, { var18, var17 })
	end
	return if fFlagProfilePlatformEnableBundlesInAssetsCarousel and #var13 <= 0 then nil else reactModule.createElement(assetsCarouselModule, {
		title = if fFlagProfilePlatformEnableInventory then var5.currentlyWearing else nil,
		layoutOrder = p1.layoutOrder,
		assets = if fFlagProfilePlatformEnableBundlesInAssetsCarousel then var13 else var14,
		openItemDetails = var12,
		onActivateHeader = if var9 then var11 else nil,
		tileVariant = if fFlagAXEnableProfileTab then var3.currentlyWearingVariant else nil
	})
end