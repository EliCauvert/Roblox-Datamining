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
local var18 = 2

return function(value) --[[ line: 78 | named "AssetsCarousel" ]]
	-- upvalues: fFlagAXEnableProfileTab (ref), enumsModule (ref), useProfileFormFactorModule (ref), fFlagAddIEMProfilePage (ref), useProfileWrapperContextModule (ref), profilePlatformUseNewLayoutForAssetsCarousel (ref), useTokens (ref), fFlagProfilePlatformEnableVRModule (ref), useIsSpatial (ref), fFlagProfilePlatformDisableCurrentlyWearingOnConsoleModule (ref), usePreferredInput (ref), responsiveModule (ref), useScreenSize (ref), useScreenSize_1 (ref), useDynamicSizeMarginModule (ref), reactModule (ref), fFlagProfilePlatformEnableInventory (ref), useLocalization (ref), textKeysModule (ref), seeMoreCurrentlyWearingCompact (ref), seeMoreCurrentlyWearingWide (ref), useSelector (ref), formFactor (ref), var18 (write), useBreakpointX (ref), marketplaceAssetTileModule (ref), assetTileModule (ref), fFlagProfilePlatformFixResaleLimitedPriceModule (ref), fFlagProfilePlatformEnableBundlesInAssetsCarousel (ref), collectionCarousel (ref), fFlagAssetsCarouselPassActivateHeaderPropModule (ref)
	local var20
	local var19 = fFlagAXEnableProfileTab and value.tileVariant == enumsModule.ProfileTabVariants.MeTab
	
	if fFlagAXEnableProfileTab then
		var20 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
		var20 = nil
	else
		var20 = nil
	end
	local var24
	local var21 = if fFlagAddIEMProfilePage then useProfileWrapperContextModule().sourceInfo.source else nil
	local var22 = if profilePlatformUseNewLayoutForAssetsCarousel then useTokens() else nil
	local var23 = if fFlagProfilePlatformEnableVRModule then useIsSpatial() else nil
	
	if fFlagProfilePlatformDisableCurrentlyWearingOnConsoleModule then
		var24 = usePreferredInput() == responsiveModule.Input.Directional
		var24 = nil
	else
		var24 = false
	end
	local var25 = if fFlagProfilePlatformEnableVRModule then var23 else fFlagProfilePlatformDisableCurrentlyWearingOnConsoleModule and var24
	local var26 = useScreenSize()
	local var27 = if fFlagAddIEMProfilePage then useScreenSize_1() else nil
	
	if fFlagAddIEMProfilePage and var21 == enumsModule.Sources.InExperienceProfile then
		var26 = var27
	end
	local var28, var29 = useDynamicSizeMarginModule()
	local var30, var31 = reactModule.useState(0)
	local var32 = if fFlagProfilePlatformEnableInventory then value.title else useLocalization({ currentlyWearing = textKeysModule.CurrentlyWearing })
	
	if seeMoreCurrentlyWearingCompact or seeMoreCurrentlyWearingWide then
		local var33 = useSelector(function(p0) --[[ line: 107 ]]
			-- upvalues: formFactor (copy)
			return p0.FormFactor == formFactor.WIDE
		end)
		
		if seeMoreCurrentlyWearingWide and var33 then
			var18 = 4
		elseif seeMoreCurrentlyWearingCompact and not var33 then
			var18 = 3
		end
	end
	local var34 = if fFlagAddIEMProfilePage then useBreakpointX() else nil
	
	if fFlagAddIEMProfilePage and var21 == enumsModule.Sources.InExperienceProfile then
		var18 = if var34 == responsiveModule.Keys.XSmall then 2 elseif var34 == responsiveModule.Keys.Small then 3 else 5
	end
	local var35 = if fFlagAXEnableProfileTab and var19 and var20 then 5 else var18
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, var30 + 42 + (if fFlagAddIEMProfilePage and var21 == enumsModule.Sources.InExperienceProfile then 16 else 0) + (if var35 < #value.assets then 0 else 60 + var26.Y * 0.01)),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = value.layoutOrder,
		[reactModule.Change.AbsoluteSize] = var29
	}, {
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			fractionalItemAmount = 0.8,
			LayoutOrder = value.layoutOrder,
			title = if fFlagProfilePlatformEnableInventory then value.title else var32.currentlyWearing,
			items = value.assets,
			renderItem = reactModule.useCallback(function(p1, p2, p3) --[[ line: 139 ]]
				-- upvalues: reactModule (copy), var19 (ref), marketplaceAssetTileModule (copy), assetTileModule (copy), fFlagProfilePlatformFixResaleLimitedPriceModule (copy), fFlagProfilePlatformEnableBundlesInAssetsCarousel (copy), var25 (ref), value (ref)
				return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = p3, LayoutOrder = p2 }, {
					[`{p1.name}`] = reactModule.createElement(if var19 then marketplaceAssetTileModule else assetTileModule, {
						name = p1.name,
						price = p1.price,
						isOffSale = if p1.isOffSale then true else nil,
						lowestResalePrice = if fFlagProfilePlatformFixResaleLimitedPriceModule then p1.lowestResalePrice else nil,
						assetId = p1.id,
						itemType = if fFlagProfilePlatformEnableBundlesInAssetsCarousel then p1.itemType else "Asset",
						onActivated = function() --[[ line: 161 ]]
							-- upvalues: var25 (copy), value (copy), p1 (ref), p2 (ref)
							if var25 then
								return
							end
							value.openItemDetails(p1.id, p1.itemType, nil, nil, p2)
						end
					})
				}), "CW_Tile"
			end, {
				value.openItemDetails,
				var25,
				if fFlagAXEnableProfileTab then var19 else nil
			}),
			getItemHeight = reactModule.useCallback(function(p4) --[[ line: 176 ]]
				-- upvalues: var31 (ref), fFlagAddIEMProfilePage (copy), var21 (ref), enumsModule (copy)
				var31(p4)
				
				return p4 + 42 + (if fFlagAddIEMProfilePage and var21 == enumsModule.Sources.InExperienceProfile then 16 else 0)
			end, {}),
			numColumns = if fFlagAXEnableProfileTab then var35 else var18,
			columnGap = if fFlagAXEnableProfileTab and var19 and var20 then 12 elseif profilePlatformUseNewLayoutForAssetsCarousel then var22.Gap.Medium else 8,
			sideMargin = var28,
			onActivateHeader = if fFlagAssetsCarouselPassActivateHeaderPropModule then value.onActivateHeader elseif fFlagProfilePlatformEnableInventory and not var25 then value.onActivateHeader else nil
		})
	})
end