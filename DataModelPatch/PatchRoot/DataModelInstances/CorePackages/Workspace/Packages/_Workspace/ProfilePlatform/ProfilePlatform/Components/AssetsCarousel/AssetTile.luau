local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local PriceFooterModule = require(script.Parent.PriceFooter)
local UserLibModule = require(Parent.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local EnumsModule = require(ProfilePlatform.Common.Enums)
local FFlagProfilePlatformEnableBundlesInAssetsCarousel = require(Parent.SharedFlags).FFlagProfilePlatformEnableBundlesInAssetsCarousel
local FFlagProfilePlatformFixResaleLimitedPriceModule = require(ProfilePlatform.Flags.FFlagProfilePlatformFixResaleLimitedPrice)
local ItemTile = require(Parent.UIBlox).Tile.ItemTile

return function(p1)
	-- upvalues: FFlagProfilePlatformEnableBundlesInAssetsCarousel (copy), EnumsModule (copy), Constants (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), ReactModule (copy), ItemTile (copy), PriceFooterModule (copy), FFlagProfilePlatformFixResaleLimitedPriceModule (copy)
	return ReactModule.createElement(ItemTile, {
		useMaxTitleHeight = false,
		titleTextLineCount = 1,
		Selectable = true,
		name = p1.name,
		thumbnail = GetRbxthumbWithTypeSizeAndOptionsFunction(p1.assetId, if FFlagProfilePlatformEnableBundlesInAssetsCarousel and p1.itemType and p1.itemType == EnumsModule.ItemTypes.Bundle then Constants.RbxthumbTypes.BundleThumbnail else Constants.RbxthumbTypes.Asset, 150),
		onActivated = p1.onActivated,
		footer = ReactModule.createElement(PriceFooterModule, {
			price = p1.price,
			isOffSale = p1.isOffSale,
			lowestResalePrice = if FFlagProfilePlatformFixResaleLimitedPriceModule then p1.lowestResalePrice else nil
		})
	})
end