local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local priceFooterModule = require(script.Parent.PriceFooter)
local userLibModule = require(parent.UserLib)
local constants = userLibModule.Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local UIBloxModule = require(parent.UIBlox)
local enumsModule = require(profilePlatform.Common.Enums)
local fFlagProfilePlatformEnableBundlesInAssetsCarousel = require(parent.SharedFlags).FFlagProfilePlatformEnableBundlesInAssetsCarousel
local fFlagProfilePlatformFixResaleLimitedPriceModule = require(profilePlatform.Flags.FFlagProfilePlatformFixResaleLimitedPrice)
local itemTile = UIBloxModule.Tile.ItemTile

return function(value) --[[ line: 36 | named "AssetTile" ]]
	-- upvalues: fFlagProfilePlatformEnableBundlesInAssetsCarousel (ref), enumsModule (ref), constants (ref), getRbxthumbWithTypeSizeAndOptions (ref), reactModule (ref), itemTile (ref), priceFooterModule (ref), fFlagProfilePlatformFixResaleLimitedPriceModule (ref)
	return reactModule.createElement(itemTile, {
		useMaxTitleHeight = false,
		titleTextLineCount = 1,
		Selectable = true,
		name = value.name,
		thumbnail = getRbxthumbWithTypeSizeAndOptions(value.assetId, if fFlagProfilePlatformEnableBundlesInAssetsCarousel and value.itemType and value.itemType == enumsModule.ItemTypes.Bundle then constants.RbxthumbTypes.BundleThumbnail else constants.RbxthumbTypes.Asset, 150),
		onActivated = value.onActivated,
		footer = reactModule.createElement(priceFooterModule, {
			price = value.price,
			isOffSale = value.isOffSale,
			lowestResalePrice = if fFlagProfilePlatformFixResaleLimitedPriceModule then value.lowestResalePrice else nil
		})
	})
end