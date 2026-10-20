local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local EnumsModule = require(ProfilePlatform.Common.Enums)
local CollectionCarousel = require(Parent.CollectionViews).CollectionCarousel
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseScreenSizeFunction1 = require(Parent.RobloxAppHooks).useScreenSize
local UseScreenSizeFunction = require(Parent.CoreScriptsRoactCommon).useScreenSize
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local UseDynamicSizeMarginModule = require(ProfilePlatform.Hooks.useDynamicSizeMargin)
local FormFactor = require(Parent.FormFactor).Enums.FormFactor
local ResponsiveModule = require(Parent.Responsive)
local UseBreakpointXFunction = ResponsiveModule.useBreakpointX
local UseIsSpatialFunction = require(Parent.Responsive).useIsSpatial
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local AssetTileModule = require(script.Parent.AssetTile)
local MarketplaceAssetTileModule = require(script.Parent.MarketplaceAssetTile)
local _ = require(ProfilePlatform.Common.AssetInfo)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local FFlagProfilePlatformEnableInventory = require(Parent.SharedFlags).FFlagProfilePlatformEnableInventory
local FFlagProfilePlatformEnableVRModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableVR)
local FFlagProfilePlatformDisableCurrentlyWearingOnConsoleModule = require(ProfilePlatform.Flags.FFlagProfilePlatformDisableCurrentlyWearingOnConsole)
local FFlagAddIEMProfilePage = require(Parent.SharedFlags).FFlagAddIEMProfilePage
local FFlagProfilePlatformFixResaleLimitedPriceModule = require(ProfilePlatform.Flags.FFlagProfilePlatformFixResaleLimitedPrice)
local FFlagProfilePlatformEnableBundlesInAssetsCarousel = require(Parent.SharedFlags).FFlagProfilePlatformEnableBundlesInAssetsCarousel
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local FFlagSplitPaneProfileMaxWidth = require(Parent.SharedFlags).FFlagSplitPaneProfileMaxWidth
local SeeMoreCurrentlyWearingCompact = game:DefineFastFlag("SeeMoreCurrentlyWearingCompact", false)
local SeeMoreCurrentlyWearingWide = game:DefineFastFlag("SeeMoreCurrentlyWearingWide", false)
local ProfilePlatformUseNewLayoutForAssetsCarousel = game:DefineFastFlag("ProfilePlatformUseNewLayoutForAssetsCarousel", false)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local v1 = 2

return function(p1)
	-- upvalues: FFlagAXEnableProfileTab (copy), EnumsModule (copy), UseProfileFormFactorModule (copy), FFlagAddIEMProfilePage (copy), UseProfileWrapperContextModule (copy), ProfilePlatformUseNewLayoutForAssetsCarousel (copy), UseTokensFunction (copy), FFlagProfilePlatformEnableVRModule (copy), UseIsSpatialFunction (copy), FFlagProfilePlatformDisableCurrentlyWearingOnConsoleModule (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), UseScreenSizeFunction1 (copy), UseScreenSizeFunction (copy), UseDynamicSizeMarginModule (copy), ReactModule (copy), FFlagProfilePlatformEnableInventory (copy), UseLocalizationFunction (copy), TextKeysModule (copy), SeeMoreCurrentlyWearingCompact (copy), SeeMoreCurrentlyWearingWide (copy), UseSelectorFunction (copy), FormFactor (copy), v1 (ref), UseBreakpointXFunction (copy), MarketplaceAssetTileModule (copy), AssetTileModule (copy), FFlagProfilePlatformFixResaleLimitedPriceModule (copy), FFlagProfilePlatformEnableBundlesInAssetsCarousel (copy), FFlagSplitPaneProfileMaxWidth (copy), CollectionCarousel (copy)
	local IsTileVariantMatch: boolean = FFlagAXEnableProfileTab and p1.tileVariant == EnumsModule.ProfileTabVariants.MeTab
	local IsFormFactorMatch = if FFlagAXEnableProfileTab then UseProfileFormFactorModule().formFactor == EnumsModule.ProfileFormFactor.Wide else nil
	local Source = if FFlagAddIEMProfilePage then UseProfileWrapperContextModule().sourceInfo.source else nil
	local UseTokensResult = if ProfilePlatformUseNewLayoutForAssetsCarousel then UseTokensFunction() else nil
	local UseIsSpatialResult = if FFlagProfilePlatformEnableVRModule then UseIsSpatialFunction() else nil
	local IsUsePreferredInputResultMatch: boolean = if FFlagProfilePlatformDisableCurrentlyWearingOnConsoleModule then UsePreferredInputFunction() == ResponsiveModule.Input.Directional else false
	local UseIsSpatialResult1 = FFlagProfilePlatformEnableVRModule and UseIsSpatialResult or FFlagProfilePlatformDisableCurrentlyWearingOnConsoleModule and IsUsePreferredInputResultMatch
	local UseScreenSizeResult = UseScreenSizeFunction1()
	local UseScreenSizeResult1 = if FFlagAddIEMProfilePage then UseScreenSizeFunction() else nil
	
	if FFlagAddIEMProfilePage and Source == EnumsModule.Sources.InExperienceProfile then
		UseScreenSizeResult = UseScreenSizeResult1
	end
	local UseDynamicSizeMarginModuleResult, UseDynamicSizeMarginModuleResult2 = UseDynamicSizeMarginModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local Title = if FFlagProfilePlatformEnableInventory then p1.title else UseLocalizationFunction({ currentlyWearing = TextKeysModule.CurrentlyWearing })
	
	if SeeMoreCurrentlyWearingCompact or SeeMoreCurrentlyWearingWide then
		local UseSelectorResult = UseSelectorFunction(function(p2): boolean
			-- upvalues: FormFactor (upval)
			return p2.FormFactor == FormFactor.WIDE
		end)
		
		if SeeMoreCurrentlyWearingWide and UseSelectorResult then
			v1 = 4
		elseif SeeMoreCurrentlyWearingCompact and not UseSelectorResult then
			v1 = 3
		end
	end
	local UseBreakpointXResult = if FFlagAddIEMProfilePage then UseBreakpointXFunction() else nil
	
	if FFlagAddIEMProfilePage and Source == EnumsModule.Sources.InExperienceProfile then
		v1 = if UseBreakpointXResult == ResponsiveModule.Keys.XSmall then 2 elseif UseBreakpointXResult == ResponsiveModule.Keys.Small then 3 else 5
	end
	local v2: number = if FFlagAXEnableProfileTab and IsTileVariantMatch and IsFormFactorMatch then 5 else v1
	local UseResult = ReactModule.useCallback(function(p2, LayoutOrder, Size)
		-- upvalues: ReactModule (upval), IsTileVariantMatch (copy), MarketplaceAssetTileModule (upval), AssetTileModule (upval), FFlagProfilePlatformFixResaleLimitedPriceModule (upval), FFlagProfilePlatformEnableBundlesInAssetsCarousel (upval), UseIsSpatialResult1 (copy), p1 (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = Size,
			LayoutOrder = LayoutOrder
		}, {
			[`{p2.name}`] = ReactModule.createElement(if IsTileVariantMatch then MarketplaceAssetTileModule else AssetTileModule, {
				name = p2.name,
				price = p2.price,
				isOffSale = if p2.isOffSale then true else nil,
				lowestResalePrice = if FFlagProfilePlatformFixResaleLimitedPriceModule then p2.lowestResalePrice else nil,
				assetId = p2.id,
				itemType = if FFlagProfilePlatformEnableBundlesInAssetsCarousel then p2.itemType else "Asset",
				onActivated = function()
					-- upvalues: UseIsSpatialResult1 (upval), p1 (upval), p2 (copy), LayoutOrder (copy)
					if not UseIsSpatialResult1 then
						p1.openItemDetails(p2.id, p2.itemType, nil, nil, LayoutOrder)
						
						return
					end
				end
			})
		}), "CW_Tile"
	end, {
		p1.openItemDetails,
		UseIsSpatialResult1,
		if FFlagAXEnableProfileTab then IsTileVariantMatch else nil
	})
	local UseResult1 = ReactModule.useCallback(function(p2: number): number
		-- upvalues: UseStateResult2 (copy), FFlagAddIEMProfilePage (upval), Source (copy), EnumsModule (upval)
		UseStateResult2(p2)
		
		return p2 + 42 + (if FFlagAddIEMProfilePage and Source == EnumsModule.Sources.InExperienceProfile then 16 else 0)
	end, {})
	local v3 = v2 < #p1.assets
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, UseStateResult + 42 + (if FFlagAddIEMProfilePage and Source == EnumsModule.Sources.InExperienceProfile then 16 else 0) + (if v3 then 0 else 60 + UseScreenSizeResult.Y * 0.01)),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		[ReactModule.Change.AbsoluteSize] = UseDynamicSizeMarginModuleResult2
	}, {
		ConstrainedCarousel = if FFlagSplitPaneProfileMaxWidth then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromOffset(0, 0)
		}, {
			MaxWidthConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(850, 1e999) }),
			CollectionCarousel = ReactModule.createElement(CollectionCarousel, {
				fractionalItemAmount = 0.8,
				LayoutOrder = p1.layoutOrder,
				title = if FFlagProfilePlatformEnableInventory then p1.title else Title.currentlyWearing,
				items = p1.assets,
				renderItem = UseResult,
				getItemHeight = UseResult1,
				numColumns = if FFlagAXEnableProfileTab then v2 else v1,
				columnGap = if FFlagAXEnableProfileTab and IsTileVariantMatch and IsFormFactorMatch then 12 elseif ProfilePlatformUseNewLayoutForAssetsCarousel then UseTokensResult.Gap.Medium else 8,
				sideMargin = UseDynamicSizeMarginModuleResult,
				onActivateHeader = p1.onActivateHeader
			})
		}) else nil,
		CollectionCarousel = if FFlagSplitPaneProfileMaxWidth then nil else ReactModule.createElement(CollectionCarousel, {
			fractionalItemAmount = 0.8,
			LayoutOrder = p1.layoutOrder,
			title = if FFlagProfilePlatformEnableInventory then p1.title else Title.currentlyWearing,
			items = p1.assets,
			renderItem = UseResult,
			getItemHeight = UseResult1,
			numColumns = if FFlagAXEnableProfileTab then v2 else v1,
			columnGap = if FFlagAXEnableProfileTab and IsTileVariantMatch and IsFormFactorMatch then 12 elseif ProfilePlatformUseNewLayoutForAssetsCarousel then UseTokensResult.Gap.Medium else 8,
			sideMargin = UseDynamicSizeMarginModuleResult,
			onActivateHeader = p1.onActivateHeader
		})
	})
end