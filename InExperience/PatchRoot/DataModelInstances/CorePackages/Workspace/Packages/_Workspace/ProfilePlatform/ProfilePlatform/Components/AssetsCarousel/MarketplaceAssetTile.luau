local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local catalogItemCard = require(parent.AvatarExperienceCommon).Components.CatalogItemCard.CatalogItemCard
local itemCardThumbnail = require(parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local userLibModule = require(parent.UserLib)
local constants = userLibModule.Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = userLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local enumsModule = require(profilePlatform.Common.Enums)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagProfilePlatformFixResaleLimitedPriceModule = require(profilePlatform.Flags.FFlagProfilePlatformFixResaleLimitedPrice)

return function(value)
	-- upvalues: useLocalization (ref), textKeysModule (ref), enumsModule (ref), constants (ref), fFlagProfilePlatformFixResaleLimitedPriceModule (ref), reactModule (ref), catalogItemCard (ref), itemCardThumbnail (ref), getRbxthumbWithTypeSizeAndOptions (ref)
	local var6 = useLocalization({
		free = textKeysModule.CatalogLabelFree,
		offSale = textKeysModule.CatalogLabelOffSale
	})
	local var7 = if value.itemType == enumsModule.ItemTypes.Bundle then constants.RbxthumbTypes.BundleThumbnail else constants.RbxthumbTypes.Asset
	local t = nil
	
	if value.isOffSale then
		t = if fFlagProfilePlatformFixResaleLimitedPriceModule and value.lowestResalePrice and value.lowestResalePrice > 0 then {
			type = enumsModule.PriceLineContentType.Price,
			price = value.lowestResalePrice
		} else {
			type = enumsModule.PriceLineContentType.Text,
			text = var6.offSale
		}
	elseif value.price == 0 then
		t = {
			type = enumsModule.PriceLineContentType.Text,
			text = var6.free
		}
	elseif value.price then
		t = {
			type = enumsModule.PriceLineContentType.Price,
			price = value.price
		}
	end
	return reactModule.createElement(catalogItemCard, {
		Selectable = true,
		title = value.name,
		presentationSlot = reactModule.createElement(itemCardThumbnail, {
			url = getRbxthumbWithTypeSizeAndOptions(value.assetId, var7, 150)
		}),
		onActivated = value.onActivated,
		priceLineContent = t,
		Size = UDim2.fromScale(1, 1)
	})
end