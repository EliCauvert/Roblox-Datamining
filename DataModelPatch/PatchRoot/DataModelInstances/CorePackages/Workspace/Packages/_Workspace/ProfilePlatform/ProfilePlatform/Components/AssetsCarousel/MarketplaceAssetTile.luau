local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local CatalogItemCard = require(Parent.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard
local ItemCardThumbnail = require(Parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local UserLibModule = require(Parent.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local EnumsModule = require(ProfilePlatform.Common.Enums)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagProfilePlatformFixResaleLimitedPriceModule = require(ProfilePlatform.Flags.FFlagProfilePlatformFixResaleLimitedPrice)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), EnumsModule (copy), Constants (copy), FFlagProfilePlatformFixResaleLimitedPriceModule (copy), ReactModule (copy), CatalogItemCard (copy), ItemCardThumbnail (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		free = TextKeysModule.CatalogLabelFree,
		offSale = TextKeysModule.CatalogLabelOffSale
	})
	
	return ReactModule.createElement(CatalogItemCard, {
		Selectable = true,
		title = p1.name,
		presentationSlot = ReactModule.createElement(ItemCardThumbnail, {
			url = GetRbxthumbWithTypeSizeAndOptionsFunction(p1.assetId, if p1.itemType == EnumsModule.ItemTypes.Bundle then Constants.RbxthumbTypes.BundleThumbnail else Constants.RbxthumbTypes.Asset, 150)
		}),
		onActivated = p1.onActivated,
		priceLineContent = if p1.isOffSale then if FFlagProfilePlatformFixResaleLimitedPriceModule and p1.lowestResalePrice and p1.lowestResalePrice > 0 then {
			type = EnumsModule.PriceLineContentType.Price,
			price = p1.lowestResalePrice
		} else {
			type = EnumsModule.PriceLineContentType.Text,
			text = UseLocalizationResult.offSale
		} elseif p1.price == 0 then {
			type = EnumsModule.PriceLineContentType.Text,
			text = UseLocalizationResult.free
		} elseif p1.price then {
			type = EnumsModule.PriceLineContentType.Price,
			price = p1.price
		} else nil,
		Size = UDim2.fromScale(1, 1)
	})
end