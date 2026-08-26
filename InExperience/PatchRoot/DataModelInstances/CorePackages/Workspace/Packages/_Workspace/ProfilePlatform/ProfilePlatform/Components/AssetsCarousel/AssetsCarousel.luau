local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local enumsModule = require(profilePlatform.Common.Enums)
local collectionCarousel = require(parent.CollectionViews).CollectionCarousel
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useScreenSize_1 = require(parent.CoreScriptsRoactCommon).useScreenSize
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local useDynamicSizeMarginModule = require(profilePlatform.Hooks.useDynamicSizeMargin)
local formFactor = require(parent.FormFactor).Enums.FormFactor
local responsiveModule = require(parent.Responsive)
local useBreakpointX = responsiveModule.useBreakpointX
local useIsSpatial = require(parent.Responsive).useIsSpatial
local usePreferredInput = responsiveModule.usePreferredInput
local foundationModule = require(parent.Foundation)
local assetTileModule = require(script.Parent.AssetTile)
local marketplaceAssetTileModule = require(script.Parent.MarketplaceAssetTile)
local _ = require(profilePlatform.Common.AssetInfo)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local fFlagProfilePlatformEnableInventory = require(parent.SharedFlags).FFlagProfilePlatformEnableInventory
local fFlagProfilePlatformEnableVRModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableVR)
local fFlagProfilePlatformDisableCurrentlyWearingOnConsoleModule = require(profilePlatform.Flags.FFlagProfilePlatformDisableCurrentlyWearingOnConsole)
local fFlagAddIEMProfilePage = require(parent.SharedFlags).FFlagAddIEMProfilePage
local fFlagProfilePlatformFixResaleLimitedPriceModule = require(profilePlatform.Flags.FFlagProfilePlatformFixResaleLimitedPrice)
local fFlagProfilePlatformEnableBundlesInAssetsCarousel = require(parent.SharedFlags).FFlagProfilePlatformEnableBundlesInAssetsCarousel
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local fFlagAssetsCarouselPassActivateHeaderPropModule = require(profilePlatform.Flags.FFlagAssetsCarouselPassActivateHeaderProp)
local seeMoreCurrentlyWearingCompact = game:DefineFastFlag("SeeMoreCurrentlyWearingCompact", false)
local seeMoreCurrentlyWearingWide = game:DefineFastFlag("SeeMoreCurrentlyWearingWide", false)
local profilePlatformUseNewLayoutForAssetsCarousel = game:DefineFastFlag("ProfilePlatformUseNewLayoutForAssetsCarousel", false)
local useTokens = foundationModule.Hooks.useTokens
local var1 = 2

return function(value)
	-- upvalues: fFlagAXEnableProfileTab (ref), enumsModule (ref), useProfileFormFactorModule (ref), fFlagAddIEMProfilePage (ref), useProfileWrapperContextModule (ref), profilePlatformUseNewLayoutForAssetsCarousel (ref), useTokens (ref), fFlagProfilePlatformEnableVRModule (ref), useIsSpatial (ref), fFlagProfilePlatformDisableCurrentlyWearingOnConsoleModule (ref), usePreferredInput (ref), responsiveModule (ref), useScreenSize (ref), useScreenSize_1 (ref), useDynamicSizeMarginModule (ref), reactModule (ref), fFlagProfilePlatformEnableInventory (ref), useLocalization (ref), textKeysModule (ref), seeMoreCurrentlyWearingCompact (ref), seeMoreCurrentlyWearingWide (ref), useSelector (ref), formFactor (ref), var1 (write), useBreakpointX (ref), marketplaceAssetTileModule (ref), assetTileModule (ref), fFlagProfilePlatformFixResaleLimitedPriceModule (ref), fFlagProfilePlatformEnableBundlesInAssetsCarousel (ref), collectionCarousel (ref), fFlagAssetsCarouselPassActivateHeaderPropModule (ref)
	local var2
	local var3 = fFlagAXEnableProfileTab and value.tileVariant == enumsModule.ProfileTabVariants.MeTab
	
	if fFlagAXEnableProfileTab then
		var2 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
		var2 = nil
	else
		var2 = nil
	end
	local var4
	local var5 = if fFlagAddIEMProfilePage then useProfileWrapperContextModule().sourceInfo.source else nil
	local var6 = if profilePlatformUseNewLayoutForAssetsCarousel then useTokens() else nil
	local var7 = if fFlagProfilePlatformEnableVRModule then useIsSpatial() else nil
	
	if fFlagProfilePlatformDisableCurrentlyWearingOnConsoleModule then
		var4 = usePreferredInput() == responsiveModule.Input.Directional
		var4 = nil
	else
		var4 = false
	end
	local var8 = if fFlagProfilePlatformEnableVRModule then var7 else fFlagProfilePlatformDisableCurrentlyWearingOnConsoleModule and var4
	local var9 = useScreenSize()
	local var10 = if fFlagAddIEMProfilePage then useScreenSize_1() else nil
	
	if fFlagAddIEMProfilePage and var5 == enumsModule.Sources.InExperienceProfile then
		var9 = var10
	end
	local var11, var12 = useDynamicSizeMarginModule()
	local var13, var14 = reactModule.useState(0)
	local var15 = if fFlagProfilePlatformEnableInventory then value.title else useLocalization({ currentlyWearing = textKeysModule.CurrentlyWearing })
	
	if seeMoreCurrentlyWearingCompact or seeMoreCurrentlyWearingWide then
		local var16 = useSelector(function(p1)
			-- upvalues: formFactor (copy)
			return p1.FormFactor == formFactor.WIDE
		end)
		
		if seeMoreCurrentlyWearingWide and var16 then
			var1 = 4
		elseif seeMoreCurrentlyWearingCompact and not var16 then
			var1 = 3
		end
	end
	local var17 = if fFlagAddIEMProfilePage then useBreakpointX() else nil
	
	if fFlagAddIEMProfilePage and var5 == enumsModule.Sources.InExperienceProfile then
		var1 = if var17 == responsiveModule.Keys.XSmall then 2 elseif var17 == responsiveModule.Keys.Small then 3 else 5
	end
	local var18 = if fFlagAXEnableProfileTab and var3 and var2 then 5 else var1
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, var13 + 42 + (if fFlagAddIEMProfilePage and var5 == enumsModule.Sources.InExperienceProfile then 16 else 0) + (if var18 < #value.assets then 0 else 60 + var9.Y * 0.01)),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = value.layoutOrder,
		[reactModule.Change.AbsoluteSize] = var12
	}, {
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			fractionalItemAmount = 0.8,
			LayoutOrder = value.layoutOrder,
			title = if fFlagProfilePlatformEnableInventory then value.title else var15.currentlyWearing,
			items = value.assets,
			renderItem = reactModule.useCallback(function(p1, p2, p3)
				-- upvalues: reactModule (copy), var3 (ref), marketplaceAssetTileModule (copy), assetTileModule (copy), fFlagProfilePlatformFixResaleLimitedPriceModule (copy), fFlagProfilePlatformEnableBundlesInAssetsCarousel (copy), var8 (ref), value (ref)
				return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = p3, LayoutOrder = p2 }, {
					[`{p1.name}`] = reactModule.createElement(if var3 then marketplaceAssetTileModule else assetTileModule, {
						name = p1.name,
						price = p1.price,
						isOffSale = if p1.isOffSale then true else nil,
						lowestResalePrice = if fFlagProfilePlatformFixResaleLimitedPriceModule then p1.lowestResalePrice else nil,
						assetId = p1.id,
						itemType = if fFlagProfilePlatformEnableBundlesInAssetsCarousel then p1.itemType else "Asset",
						onActivated = function()
							-- upvalues: var8 (copy), value (copy), p1 (ref), p2 (ref)
							if var8 then
								return
							end
							value.openItemDetails(p1.id, p1.itemType, nil, nil, p2)
						end
					})
				}), "CW_Tile"
			end, {
				value.openItemDetails,
				var8,
				if fFlagAXEnableProfileTab then var3 else nil
			}),
			getItemHeight = reactModule.useCallback(function(p1)
				-- upvalues: var14 (ref), fFlagAddIEMProfilePage (copy), var5 (ref), enumsModule (copy)
				var14(p1)
				
				return p1 + 42 + (if fFlagAddIEMProfilePage and var5 == enumsModule.Sources.InExperienceProfile then 16 else 0)
			end, {}),
			numColumns = if fFlagAXEnableProfileTab then var18 else var1,
			columnGap = if fFlagAXEnableProfileTab and var3 and var2 then 12 elseif profilePlatformUseNewLayoutForAssetsCarousel then var6.Gap.Medium else 8,
			sideMargin = var11,
			onActivateHeader = if fFlagAssetsCarouselPassActivateHeaderPropModule then value.onActivateHeader elseif fFlagProfilePlatformEnableInventory and not var8 then value.onActivateHeader else nil
		})
	})
end