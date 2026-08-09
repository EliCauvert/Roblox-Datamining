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
local seeMoreCurrentlyWearingCompact = game:DefineFastFlag("SeeMoreCurrentlyWearingCompact", false)
local seeMoreCurrentlyWearingWide = game:DefineFastFlag("SeeMoreCurrentlyWearingWide", false)
local profilePlatformUseNewLayoutForAssetsCarousel = game:DefineFastFlag("ProfilePlatformUseNewLayoutForAssetsCarousel", false)
local useTokens = foundationModule.Hooks.useTokens
local var17 = 2

return function(value) --[[ line: 76 | named "AssetsCarousel" ]]
	-- upvalues: fFlagAXEnableProfileTab (ref), enumsModule (ref), useProfileFormFactorModule (ref), fFlagAddIEMProfilePage (ref), useProfileWrapperContextModule (ref), profilePlatformUseNewLayoutForAssetsCarousel (ref), useTokens (ref), fFlagProfilePlatformEnableVRModule (ref), useIsSpatial (ref), fFlagProfilePlatformDisableCurrentlyWearingOnConsoleModule (ref), usePreferredInput (ref), responsiveModule (ref), useScreenSize (ref), useScreenSize_1 (ref), useDynamicSizeMarginModule (ref), reactModule (ref), fFlagProfilePlatformEnableInventory (ref), useLocalization (ref), textKeysModule (ref), seeMoreCurrentlyWearingCompact (ref), seeMoreCurrentlyWearingWide (ref), useSelector (ref), formFactor (ref), var17 (write), useBreakpointX (ref), marketplaceAssetTileModule (ref), assetTileModule (ref), fFlagProfilePlatformFixResaleLimitedPriceModule (ref), fFlagProfilePlatformEnableBundlesInAssetsCarousel (ref), collectionCarousel (ref)
	local var19
	local var18 = fFlagAXEnableProfileTab and value.tileVariant == enumsModule.ProfileTabVariants.MeTab
	
	if fFlagAXEnableProfileTab then
		var19 = useProfileFormFactorModule().formFactor == enumsModule.ProfileFormFactor.Wide
		var19 = nil
	else
		var19 = nil
	end
	local var23
	local var20 = if fFlagAddIEMProfilePage then useProfileWrapperContextModule().sourceInfo.source else nil
	local var21 = if profilePlatformUseNewLayoutForAssetsCarousel then useTokens() else nil
	local var22 = if fFlagProfilePlatformEnableVRModule then useIsSpatial() else nil
	
	if fFlagProfilePlatformDisableCurrentlyWearingOnConsoleModule then
		var23 = usePreferredInput() == responsiveModule.Input.Directional
		var23 = nil
	else
		var23 = false
	end
	local var24 = if fFlagProfilePlatformEnableVRModule then var22 else fFlagProfilePlatformDisableCurrentlyWearingOnConsoleModule and var23
	local var25 = useScreenSize()
	local var26 = if fFlagAddIEMProfilePage then useScreenSize_1() else nil
	
	if fFlagAddIEMProfilePage and var20 == enumsModule.Sources.InExperienceProfile then
		var25 = var26
	end
	local var27, var28 = useDynamicSizeMarginModule()
	local var29, var30 = reactModule.useState(0)
	local var31 = if fFlagProfilePlatformEnableInventory then value.title else useLocalization({ currentlyWearing = textKeysModule.CurrentlyWearing })
	
	if seeMoreCurrentlyWearingCompact or seeMoreCurrentlyWearingWide then
		local var32 = useSelector(function(p0) --[[ line: 105 ]]
			-- upvalues: formFactor (copy)
			return p0.FormFactor == formFactor.WIDE
		end)
		
		if seeMoreCurrentlyWearingWide and var32 then
			var17 = 4
		elseif seeMoreCurrentlyWearingCompact and not var32 then
			var17 = 3
		end
	end
	local var33 = if fFlagAddIEMProfilePage then useBreakpointX() else nil
	
	if fFlagAddIEMProfilePage and var20 == enumsModule.Sources.InExperienceProfile then
		var17 = if var33 == responsiveModule.Keys.XSmall then 2 elseif var33 == responsiveModule.Keys.Small then 3 else 5
	end
	local var34 = if fFlagAXEnableProfileTab and var18 and var19 then 5 else var17
	
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, var29 + 42 + (if fFlagAddIEMProfilePage and var20 == enumsModule.Sources.InExperienceProfile then 16 else 0) + (if var34 < #value.assets then 0 else 60 + var25.Y * 0.01)),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = value.layoutOrder,
		[reactModule.Change.AbsoluteSize] = var28
	}, {
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			fractionalItemAmount = 0.8,
			LayoutOrder = value.layoutOrder,
			title = if fFlagProfilePlatformEnableInventory then value.title else var31.currentlyWearing,
			items = value.assets,
			renderItem = reactModule.useCallback(function(p1, p2, p3) --[[ line: 137 ]]
				-- upvalues: reactModule (copy), var18 (ref), marketplaceAssetTileModule (copy), assetTileModule (copy), fFlagProfilePlatformFixResaleLimitedPriceModule (copy), fFlagProfilePlatformEnableBundlesInAssetsCarousel (copy), var24 (ref), value (ref)
				return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = p3, LayoutOrder = p2 }, {
					[`{p1.name}`] = reactModule.createElement(if var18 then marketplaceAssetTileModule else assetTileModule, {
						name = p1.name,
						price = p1.price,
						isOffSale = if p1.isOffSale then true else nil,
						lowestResalePrice = if fFlagProfilePlatformFixResaleLimitedPriceModule then p1.lowestResalePrice else nil,
						assetId = p1.id,
						itemType = if fFlagProfilePlatformEnableBundlesInAssetsCarousel then p1.itemType else "Asset",
						onActivated = function() --[[ line: 159 ]]
							-- upvalues: var24 (copy), value (copy), p1 (ref), p2 (ref)
							if var24 then
								return
							end
							value.openItemDetails(p1.id, p1.itemType, nil, nil, p2)
						end
					})
				}), "CW_Tile"
			end, {
				value.openItemDetails,
				var24,
				if fFlagAXEnableProfileTab then var18 else nil
			}),
			getItemHeight = reactModule.useCallback(function(p4) --[[ line: 174 ]]
				-- upvalues: var30 (ref), fFlagAddIEMProfilePage (copy), var20 (ref), enumsModule (copy)
				var30(p4)
				
				return p4 + 42 + (if fFlagAddIEMProfilePage and var20 == enumsModule.Sources.InExperienceProfile then 16 else 0)
			end, {}),
			numColumns = if fFlagAXEnableProfileTab then var34 else var17,
			columnGap = if fFlagAXEnableProfileTab and var18 and var19 then 12 elseif profilePlatformUseNewLayoutForAssetsCarousel then var21.Gap.Medium else 8,
			sideMargin = var27,
			onActivateHeader = if fFlagProfilePlatformEnableInventory and not var24 then value.onActivateHeader else nil
		})
	})
end