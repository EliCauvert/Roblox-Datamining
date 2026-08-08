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

return function(p0) --[[ line: 54 | named "CurrentlyWearingCarousel" ]]
	-- upvalues: useDispatch (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), fFlagProfilePlatformEnableInventory (ref), useLocalization (ref), textKeysModule (ref), useMarketplaceAnalyticsContextModule (ref), fFlagAddIEMProfilePage (ref), fFlagProfileInspectAvatarCWEntryModule (ref), useLocalUserId (ref), enumsModule (ref), useNavigation (ref), reactModule (ref), fFlagProfileInspectAndBuyRefactorTooltipModule (ref), getInspectAvatarTooltipStoreModule (ref), fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module (ref), eventNamesModule (ref), fFlagProfilePlatformEnableBundlesInAssetsCarousel (ref), IXPService (ref), socialProfileCurrentlyWearingClickThroughLayer (ref), fFlagProfilePlatformEnableStore (ref), fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (ref), useProfileJsonComponentModule (ref), constantsModule (ref), useSelector (ref), networkingCatalogModule (ref), cryoModule (ref), useEffectOnMount (ref), networkingCurrentlyWearingModule (ref), sortCurrentlyWearingModule (ref), assetsCarouselModule (ref), fFlagAXEnableProfileTab (ref)
	local var30
	local var23 = useDispatch()
	local var24 = useProfileWrapperContextModule()
	local var25 = useProfileAnalyticsContextModule()
	local var26 = if fFlagProfilePlatformEnableInventory then useLocalization({ currentlyWearing = textKeysModule.CurrentlyWearing }) else nil
	local var27 = useMarketplaceAnalyticsContextModule()
	local var28 = if fFlagAddIEMProfilePage then var24.sourceInfo.source else nil
	local var29 = if fFlagProfileInspectAvatarCWEntryModule then useLocalUserId() else nil
	
	if fFlagProfileInspectAvatarCWEntryModule then
		var30 = tostring(var24.profileId) == tostring(var29)
		var30 = nil
	else
		var30 = nil
	end
	local var31 = fFlagProfileInspectAvatarCWEntryModule and (not var30 and var28 ~= enumsModule.Sources.InExperienceProfile)
	local var32 = if fFlagProfileInspectAvatarCWEntryModule then useNavigation() else nil
	local var33 = if fFlagProfileInspectAvatarCWEntryModule then reactModule.useCallback(function() --[[ line: 79 ]]
		-- upvalues: fFlagProfileInspectAndBuyRefactorTooltipModule (copy), getInspectAvatarTooltipStoreModule (copy), fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module (copy), var25 (ref), eventNamesModule (copy), var32 (ref), enumsModule (copy)
		if fFlagProfileInspectAndBuyRefactorTooltipModule then
			getInspectAvatarTooltipStoreModule(false).permanentlyDismiss()
		end
		if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then
			var25.fireAnalyticsEvent(eventNamesModule.CurrentlyWearingHeaderButton)
		end
		var32.navigate(enumsModule.Screens.InspectAvatarSheet)
	end, {
		var32,
		if fFlagSocialEnableProfileInspectAndBuyAnalyticsV2Module then var25 else nil
	}) else nil
	local var34 = reactModule.useCallback(function(p1, p2, _, _, p3) --[[ line: 96 ]]
		-- upvalues: fFlagAddIEMProfilePage (copy), var28 (ref), enumsModule (copy), var24 (ref), fFlagProfilePlatformEnableBundlesInAssetsCarousel (copy), IXPService (copy), socialProfileCurrentlyWearingClickThroughLayer (copy), fFlagProfilePlatformEnableStore (copy), var25 (ref), eventNamesModule (copy), fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (copy), var27 (ref)
		if fFlagAddIEMProfilePage and var28 == enumsModule.Sources.InExperienceProfile then
			var24.navigateTo.inspectAvatar()
			
			return
		elseif fFlagProfilePlatformEnableBundlesInAssetsCarousel then
			var24.navigateTo.itemOrBundleDetails(p1, p2)
		else
			var24.navigateTo.itemDetails(p1)
		end
		IXPService:LogFlagLinkedUserLayerExposure(socialProfileCurrentlyWearingClickThroughLayer)
		
		if fFlagProfilePlatformEnableStore then
			var25.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened, if fFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule then {
				btnContext = tostring(enumsModule.Components.CurrentlyWearing),
				btnUnitId = tostring(p1),
				btnSortPosition = tostring(p3)
			} else {
				source = tostring(enumsModule.Components.CurrentlyWearing),
				positionInComponent = tostring(p3),
				component = tostring(enumsModule.Components.CurrentlyWearing),
				itemId = tostring(p1)
			})
			var24.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(var27, p1, p2, tostring(enumsModule.Components.CurrentlyWearing), p3)
			
			return
		end
		var25.fireAnalyticsEvent(eventNamesModule.CatalogItemOpened)
		var24.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(var27, p1, p2)
	end, {
		var24.navigateTo.itemDetails,
		var24.externalAnalytics.catalogAnalytics,
		var24.navigateTo.tryOnItem,
		var24.navigateTo.inspectAvatar,
		var28
	})
	local assets = useProfileJsonComponentModule(enumsModule.Components.CurrentlyWearing).assets or {}
	local var36 = nil
	local var37 = nil
	
	if fFlagProfilePlatformEnableBundlesInAssetsCarousel then
		var36 = useSelector(reactModule.useCallback(function(p4) --[[ line: 154 ]]
			-- upvalues: constantsModule (copy), assets (ref), enumsModule (copy)
			local bundleDetails = p4[constantsModule.RODUX_KEY].BundleDetails or {}
			local assetDetails = p4[constantsModule.RODUX_KEY].AssetDetails or {}
			local t = {}
			local var43 = 1
			
			for i, v in assets do
				local var44 = if v.itemType == enumsModule.ItemTypes.Bundle then bundleDetails[tostring(v.assetId)] else assetDetails[tostring(v.assetId)]
				
				if var44 then
					var44.itemType = v.itemType
					t[var43] = var44
					var43 += 1
				end
			end
			return t
		end, { assets }))
		reactModule.useEffect(function() --[[ line: 177 ]]
			-- upvalues: assets (ref), var23 (ref), networkingCatalogModule (copy)
			if #assets > 0 then
				var23(networkingCatalogModule.GetItemAndBundleDetails.API(assets))
			end
		end, { assets, var23 })
	else
		local var38 = reactModule.useMemo(function() --[[ line: 183 ]]
			-- upvalues: cryoModule (copy), assets (ref)
			return cryoModule.List.map(assets, function(p5) --[[ line: 184 ]]
				return p5.assetId
			end)
		end, { assets })
		useEffectOnMount(function() --[[ line: 189 ]]
			-- upvalues: var23 (ref), networkingCurrentlyWearingModule (copy), var38 (ref)
			var23(networkingCurrentlyWearingModule.GetItemDetails.API(var38)):andThen(function(_) --[[ line: 191 ]] end):catch(function(_) --[[ line: 192 ]] end)
		end)
		local var39 = useSelector(function(p6) --[[ line: 197 ]]
			-- upvalues: constantsModule (copy)
			return p6[constantsModule.RODUX_KEY].ItemAssets or {}
		end)
		var37 = reactModule.useMemo(function() --[[ line: 201 ]]
			-- upvalues: var38 (ref), var39 (ref), cryoModule (copy), sortCurrentlyWearingModule (copy)
			local t = {}
			local var46 = 1
			
			for i, v in var38 do
				local var47 = var39[tostring(v)]
				
				if var47 then
					t[var46] = var47
					var46 += 1
				end
			end
			return cryoModule.List.sort(t, function(p7, p8) --[[ line: 214 ]]
				-- upvalues: sortCurrentlyWearingModule (copy)
				return sortCurrentlyWearingModule(p7, p8)
			end)
		end, { var39, var38 })
	end
	return if fFlagProfilePlatformEnableBundlesInAssetsCarousel and #var36 <= 0 then nil else reactModule.createElement(assetsCarouselModule, {
		title = if fFlagProfilePlatformEnableInventory then var26.currentlyWearing else nil,
		layoutOrder = p0.layoutOrder,
		assets = if fFlagProfilePlatformEnableBundlesInAssetsCarousel then var36 else var37,
		openItemDetails = var34,
		onActivateHeader = if var31 then var33 else nil,
		tileVariant = if fFlagAXEnableProfileTab then var24.currentlyWearingVariant else nil
	})
end