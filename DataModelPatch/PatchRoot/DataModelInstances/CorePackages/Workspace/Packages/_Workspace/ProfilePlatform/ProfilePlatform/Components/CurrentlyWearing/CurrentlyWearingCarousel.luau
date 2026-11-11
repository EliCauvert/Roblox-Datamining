local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local SortCurrentlyWearingModule = require(ProfilePlatform.Components.CurrentlyWearing.SortCurrentlyWearing)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEffectOnMountFunction = RoactUtilsModule.Hooks.useEffectOnMount
local EnumsModule = require(ProfilePlatform.Common.Enums)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local NetworkingCurrentlyWearingModule = require(ProfilePlatform.Networking.NetworkingCurrentlyWearing)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local UseMarketplaceAnalyticsContextModule = require(ProfilePlatform.Hooks.useMarketplaceAnalyticsContext)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(ProfilePlatform.Common.AssetInfo)
local NetworkingCatalogModule = require(ProfilePlatform.Networking.NetworkingCatalog)
local FFlagProfilePlatformEnableInventory = require(Parent.SharedFlags).FFlagProfilePlatformEnableInventory
local FFlagProfilePlatformEnableStore = require(Parent.SharedFlags).FFlagProfilePlatformEnableStore
local FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformUseCatalogItemOpenedNewFields)
local FFlagAddIEMProfilePage = require(Parent.SharedFlags).FFlagAddIEMProfilePage
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local IXPService = game:GetService("IXPService")
local SocialProfileCurrentlyWearingClickThroughLayer = game:DefineFastString("SocialProfileCurrentlyWearingClickThroughLayer", "Social.ProfileCurrentlyWearingClickThrough")
local FFlagProfilePlatformEnableBundlesInAssetsCarousel = require(Parent.SharedFlags).FFlagProfilePlatformEnableBundlesInAssetsCarousel
local AssetsCarouselModule = require(ProfilePlatform.Components.AssetsCarousel)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseProfileWrapperContextModule (copy), UseProfileAnalyticsContextModule (copy), FFlagProfilePlatformEnableInventory (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UseMarketplaceAnalyticsContextModule (copy), FFlagAddIEMProfilePage (copy), ReactModule (copy), EnumsModule (copy), FFlagProfilePlatformEnableBundlesInAssetsCarousel (copy), IXPService (copy), SocialProfileCurrentlyWearingClickThroughLayer (copy), FFlagProfilePlatformEnableStore (copy), EventNamesModule (copy), FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (copy), UseProfileJsonComponentModule (copy), ConstantsModule (copy), UseSelectorFunction (copy), NetworkingCatalogModule (copy), CryoModule (copy), UseEffectOnMountFunction (copy), NetworkingCurrentlyWearingModule (copy), SortCurrentlyWearingModule (copy), AssetsCarouselModule (copy), FFlagAXEnableProfileTab (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseLocalizationResult = if FFlagProfilePlatformEnableInventory then UseLocalizationFunction({ currentlyWearing = TextKeysModule.CurrentlyWearing }) else nil
	local UseMarketplaceAnalyticsContextModuleResult = UseMarketplaceAnalyticsContextModule()
	local Source = if FFlagAddIEMProfilePage then UseProfileWrapperContextModuleResult.sourceInfo.source else nil
	local UseResult = ReactModule.useCallback(function(p2, p3, _, _, p4)
		-- upvalues: FFlagAddIEMProfilePage (upval), Source (copy), EnumsModule (upval), UseProfileWrapperContextModuleResult (copy), FFlagProfilePlatformEnableBundlesInAssetsCarousel (upval), IXPService (upval), SocialProfileCurrentlyWearingClickThroughLayer (upval), FFlagProfilePlatformEnableStore (upval), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule (upval), UseMarketplaceAnalyticsContextModuleResult (copy)
		if FFlagAddIEMProfilePage and Source == EnumsModule.Sources.InExperienceProfile then
			UseProfileWrapperContextModuleResult.navigateTo.inspectAvatar()
			
			return
		end
		if FFlagProfilePlatformEnableBundlesInAssetsCarousel then
			UseProfileWrapperContextModuleResult.navigateTo.itemOrBundleDetails(p2, p3)
		else
			UseProfileWrapperContextModuleResult.navigateTo.itemDetails(p2)
		end
		IXPService:LogFlagLinkedUserLayerExposure(SocialProfileCurrentlyWearingClickThroughLayer)
		
		if FFlagProfilePlatformEnableStore then
			UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CatalogItemOpened, if FFlagProfilePlatformUseCatalogItemOpenedNewFieldsModule then {
				btnContext = tostring(EnumsModule.Components.CurrentlyWearing),
				btnUnitId = tostring(p2),
				btnSortPosition = tostring(p4)
			} else {
				source = tostring(EnumsModule.Components.CurrentlyWearing),
				positionInComponent = tostring(p4),
				component = tostring(EnumsModule.Components.CurrentlyWearing),
				itemId = tostring(p2)
			})
			UseProfileWrapperContextModuleResult.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(UseMarketplaceAnalyticsContextModuleResult, p2, p3, tostring(EnumsModule.Components.CurrentlyWearing), p4)
			
			return
		else
			UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.CatalogItemOpened)
			UseProfileWrapperContextModuleResult.externalAnalytics.catalogAnalytics.clickCatalogItemFromProfile(UseMarketplaceAnalyticsContextModuleResult, p2, p3)
		end
	end, {
		UseProfileWrapperContextModuleResult.navigateTo.itemDetails,
		UseProfileWrapperContextModuleResult.externalAnalytics.catalogAnalytics,
		UseProfileWrapperContextModuleResult.navigateTo.tryOnItem,
		UseProfileWrapperContextModuleResult.navigateTo.inspectAvatar,
		Source
	})
	local Assets = UseProfileJsonComponentModule(EnumsModule.Components.CurrentlyWearing).assets or {}
	local v1 = nil
	local UseMemoResult = nil
	
	if FFlagProfilePlatformEnableBundlesInAssetsCarousel then
		v1 = UseSelectorFunction((ReactModule.useCallback(function(p2)
			-- upvalues: ConstantsModule (upval), Assets (copy), EnumsModule (upval)
			local BundleDetails = p2[ConstantsModule.RODUX_KEY].BundleDetails or {}
			local AssetDetails = p2[ConstantsModule.RODUX_KEY].AssetDetails or {}
			local t = {}
			local Count = 1
			
			for _, asset in Assets do
				local BundleDetail = if asset.itemType == EnumsModule.ItemTypes.Bundle then BundleDetails[tostring(asset.assetId)] else AssetDetails[tostring(asset.assetId)]
				
				if BundleDetail then
					BundleDetail.itemType = asset.itemType
					t[Count] = BundleDetail
					Count += 1
				end
			end
			return t
		end, { Assets })))
		ReactModule.useEffect(function()
			-- upvalues: Assets (copy), UseDispatchResult (copy), NetworkingCatalogModule (upval)
			if #Assets > 0 then
				UseDispatchResult(NetworkingCatalogModule.GetItemAndBundleDetails.API(Assets))
			end
		end, { Assets, UseDispatchResult })
	else
		local UseMemoResult1 = ReactModule.useMemo(function()
			-- upvalues: CryoModule (upval), Assets (copy)
			return CryoModule.List.map(Assets, function(p3)
				return p3.assetId
			end)
		end, { Assets })
		UseEffectOnMountFunction(function()
			-- upvalues: UseDispatchResult (copy), NetworkingCurrentlyWearingModule (upval), UseMemoResult1 (copy)
			UseDispatchResult(NetworkingCurrentlyWearingModule.GetItemDetails.API(UseMemoResult1)):andThen(function(_) end):catch(function(_) end)
		end)
		local UseSelectorResult = UseSelectorFunction(function(p3)
			-- upvalues: ConstantsModule (upval)
			return p3[ConstantsModule.RODUX_KEY].ItemAssets or {}
		end)
		UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: UseMemoResult1 (copy), UseSelectorResult (copy), CryoModule (upval), SortCurrentlyWearingModule (upval)
			local t = {}
			local Count = 1
			
			for _, value in UseMemoResult1 do
				local UseSelectorResultEntry = UseSelectorResult[tostring(value)]
				
				if UseSelectorResultEntry then
					t[Count] = UseSelectorResultEntry
					Count += 1
				end
			end
			return CryoModule.List.sort(t, function(p3, p4)
				-- upvalues: SortCurrentlyWearingModule (upval)
				return SortCurrentlyWearingModule(p3, p4)
			end)
		end, { UseSelectorResult, UseMemoResult1 })
	end
	return if FFlagProfilePlatformEnableBundlesInAssetsCarousel and #v1 <= 0 then nil else ReactModule.createElement(AssetsCarouselModule, {
		title = if FFlagProfilePlatformEnableInventory then UseLocalizationResult.currentlyWearing else nil,
		layoutOrder = p1.layoutOrder,
		assets = if FFlagProfilePlatformEnableBundlesInAssetsCarousel then v1 else UseMemoResult,
		openItemDetails = UseResult,
		tileVariant = if FFlagAXEnableProfileTab then UseProfileWrapperContextModuleResult.currentlyWearingVariant else nil
	})
end