local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local _ = require(avatarExperienceInspectAndBuy.Types)
local itemTypeEnum = require(parent.AXCommon).Enums.ItemTypeEnum
local constantsModule = require(avatarExperienceInspectAndBuy.Constants)
local assetLocalizationKeys = constantsModule.AssetLocalizationKeys
local bundleLocalizationKeys = constantsModule.BundleLocalizationKeys
local priceStatusLocalizationKeys = constantsModule.PriceStatusLocalizationKeys
local itemDetailsLocalizationKeys = constantsModule.ItemDetailsLocalizationKeys
local cryoModule = require(parent.Cryo)
local useLocalization = require(parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: reactModule (ref), itemTypeEnum (ref), bundleLocalizationKeys (ref), assetLocalizationKeys (ref), cryoModule (ref), priceStatusLocalizationKeys (ref), itemDetailsLocalizationKeys (ref), useLocalization (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), itemTypeEnum (copy), bundleLocalizationKeys (copy), assetLocalizationKeys (copy)
		return if p1 and p1.itemType == itemTypeEnum.Bundle then bundleLocalizationKeys else assetLocalizationKeys
	end, { p1 })
	
	return useLocalization(reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var1 (ref), priceStatusLocalizationKeys (copy), itemDetailsLocalizationKeys (copy), p1 (ref)
		return cryoModule.Dictionary.join(var1, priceStatusLocalizationKeys, itemDetailsLocalizationKeys, {
			ownedItems = {
				itemDetailsLocalizationKeys.ownedItems,
				QUANTITY = if p1 and p1.collectibleItemDetails then p1.collectibleItemDetails.resellableCount else 0
			}
		})
	end, { var1, p1 }))
end