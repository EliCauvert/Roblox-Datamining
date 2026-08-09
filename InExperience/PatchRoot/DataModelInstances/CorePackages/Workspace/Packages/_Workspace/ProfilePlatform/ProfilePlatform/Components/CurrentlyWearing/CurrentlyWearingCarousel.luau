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
local IXPService = game:GetService("IXPService")
local socialProfileCurrentlyWearingClickThroughLayer = game:DefineFastString("SocialProfileCurrentlyWearingClickThroughLayer", "Social.ProfileCurrentlyWearingClickThrough")
local fFlagProfilePlatformEnableBundlesInAssetsCarousel = require(parent.SharedFlags).FFlagProfilePlatformEnableBundlesInAssetsCarousel
local assetsCarouselModule = require(profilePlatform.Components.AssetsCarousel)

return function(p0) --[[ line: 47 | named "CurrentlyWearingCarousel" ]]
	-- upvalues: useDispatch (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), fFlagProfilePlatformEnableInventory (ref), useLocalization (ref), textKeysModule (ref), useMarketplaceAnalyticsContextModule (ref), fFlagAddIEMProfilePage (ref), reactModule (ref), enumsModule (ref), fFlagProfilePlatformEnableBundlesInAssetsCarousel (ref), IXPService (ref), socialProfileCurrentlyWearingClickThroughLayer (ref), fFlagProfilePlatformEnableStore (ref), eventNamesModule (ref), fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (ref), useProfileJsonComponentModule (ref), constantsModule (ref), useSelector (ref), networkingCatalogModule (ref), cryoModule (ref), useEffectOnMount (ref), networkingCurrentlyWearingModule (ref), sortCurrentlyWearingModule (ref), assetsCarouselModule (ref), fFlagAXEnableProfileTab (ref)
	local var19 = useDispatch()
	local var20 = useProfileWrapperContextModule()
	local var21 = useProfileAnalyticsContextModule()
	local var22 = if fFlagProfilePlatformEnableInventory then useLocalization({ currentlyWearing = textKeysModule.CurrentlyWearing }) else nil
	local var23 = useMarketplaceAnalyticsContextModule()
	local var24 = if fFlagAddIEMProfilePage then var20.sourceInfo.source else nil
	local var25 = reactModule.useCallback(function(p1, p2, _, _, p3) --[[ line: 62 ]]
		-- upvalues: fFlagAddIEMProfilePage (copy), var24 (ref), enumsModule (copy), var20 (ref), fFlagProfilePlatformEnableBundlesInAssetsCarousel (copy), IXPService (copy), socialProfileCurrentlyWearingClickThroughLayer (copy), fFlagProfilePlatformEnableStore (copy), var21 (ref), eventNamesModule (copy), fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (copy), var23 (ref)
		if fFlagAddIEMProfilePage and var24 == enumsModule.Sources.InExperienceProfile then
			var20.navigateTo.inspectAvatar()
			
			return
		elseif fFlagProfilePlatformEnableBundlesInAssetsCarousel then
			var20.navigateTo.itemOrBundleDetails(p1, p2)
		else
			var20.navigateTo.itemDetails(p1)
		end
		IXPService:LogFlagLinkedUserLayerExposure(socialProfileCurrentlyWearingClickThroughLayer)
		
		if fFlagProfilePlatformEnableStore then
			var21.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened, if fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule then {
				btnContext = tostring(enumsModule.Components.CurrentlyWearing),
				btnUnitId = tostring(p1),
				btnSortPosition = tostring(p3)
			} else {
				source = tostring(enumsModule.Components.CurrentlyWearing),
				positionInComponent = tostring(p3),
				component = tostring(enumsModule.Components.CurrentlyWearing),
				itemId = tostring(p1)
			})
			var20.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(var23, p1, p2, tostring(enumsModule.Components.CurrentlyWearing), p3)
			
			return
		end
		var21.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened)
		var20.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(var23, p1, p2)
	end, {
		var20.navigateTo.itemDetails,
		var20.externalAnalytics.catalogAnalytics,
		var20.navigateTo.tryOnItem,
		var20.navigateTo.inspectAvatar,
		var24
	})
	local assets = useProfileJsonComponentModule(enumsModule.Components.CurrentlyWearing).assets or {}
	local var27 = nil
	local var28 = nil
	
	if fFlagProfilePlatformEnableBundlesInAssetsCarousel then
		var27 = useSelector(reactModule.useCallback(function(p4) --[[ line: 120 ]]
			-- upvalues: constantsModule (copy), assets (ref), enumsModule (copy)
			local bundleDetails = p4[constantsModule.RODUX_KEY].BundleDetails or {}
			local assetDetails = p4[constantsModule.RODUX_KEY].AssetDetails or {}
			local t = {}
			local var34 = 1
			
			for i, v in assets do
				local var35 = if v.itemType == enumsModule.ItemTypes.Bundle then bundleDetails[tostring(v.assetId)] else assetDetails[tostring(v.assetId)]
				
				if var35 then
					var35.itemType = v.itemType
					t[var34] = var35
					var34 += 1
				end
			end
			return t
		end, { assets }))
		reactModule.useEffect(function() --[[ line: 143 ]]
			-- upvalues: assets (ref), var19 (ref), networkingCatalogModule (copy)
			if #assets > 0 then
				var19(networkingCatalogModule.GetItemAndBundleDetails.API(assets))
			end
		end, { assets, var19 })
	else
		local var29 = reactModule.useMemo(function() --[[ line: 149 ]]
			-- upvalues: cryoModule (copy), assets (ref)
			return cryoModule.List.map(assets, function(p5) --[[ line: 150 ]]
				return p5.assetId
			end)
		end, { assets })
		useEffectOnMount(function() --[[ line: 155 ]]
			-- upvalues: var19 (ref), networkingCurrentlyWearingModule (copy), var29 (ref)
			var19(networkingCurrentlyWearingModule.GetItemDetails.API(var29)):andThen(function(_) --[[ line: 157 ]] end):catch(function(_) --[[ line: 158 ]] end)
		end)
		local var30 = useSelector(function(p6) --[[ line: 163 ]]
			-- upvalues: constantsModule (copy)
			return p6[constantsModule.RODUX_KEY].ItemAssets or {}
		end)
		var28 = reactModule.useMemo(function() --[[ line: 167 ]]
			-- upvalues: var29 (ref), var30 (ref), cryoModule (copy), sortCurrentlyWearingModule (copy)
			local t = {}
			local var37 = 1
			
			for i, v in var29 do
				local var38 = var30[tostring(v)]
				
				if var38 then
					t[var37] = var38
					var37 += 1
				end
			end
			return cryoModule.List.sort(t, function(p7, p8) --[[ line: 180 ]]
				-- upvalues: sortCurrentlyWearingModule (copy)
				return sortCurrentlyWearingModule(p7, p8)
			end)
		end, { var30, var29 })
	end
	return if fFlagProfilePlatformEnableBundlesInAssetsCarousel and #var27 <= 0 then nil else reactModule.createElement(assetsCarouselModule, {
		title = if fFlagProfilePlatformEnableInventory then var22.currentlyWearing else nil,
		layoutOrder = p0.layoutOrder,
		assets = if fFlagProfilePlatformEnableBundlesInAssetsCarousel then var27 else var28,
		openItemDetails = var25,
		tileVariant = if fFlagAXEnableProfileTab then var20.currentlyWearingVariant else nil
	})
end