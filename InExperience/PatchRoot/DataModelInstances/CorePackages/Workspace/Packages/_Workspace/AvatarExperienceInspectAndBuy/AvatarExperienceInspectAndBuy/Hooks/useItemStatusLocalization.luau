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

return function(p0) --[[ line: 17 ]]
	-- upvalues: reactModule (ref), itemTypeEnum (ref), bundleLocalizationKeys (ref), assetLocalizationKeys (ref), cryoModule (ref), priceStatusLocalizationKeys (ref), itemDetailsLocalizationKeys (ref), useLocalization (ref)
	local var4 = reactModule.useMemo(function() --[[ line: 18 ]]
		-- upvalues: p0 (ref), itemTypeEnum (copy), bundleLocalizationKeys (copy), assetLocalizationKeys (copy)
		return if p0 and p0.itemType == itemTypeEnum.Bundle then bundleLocalizationKeys else assetLocalizationKeys
	end, { p0 })
	
	return useLocalization(reactModule.useMemo(function() --[[ line: 22 ]]
		-- upvalues: cryoModule (copy), var4 (ref), priceStatusLocalizationKeys (copy), itemDetailsLocalizationKeys (copy), p0 (ref)
		return cryoModule.Dictionary.join(var4, priceStatusLocalizationKeys, itemDetailsLocalizationKeys, {
			ownedItems = {
				itemDetailsLocalizationKeys.ownedItems,
				QUANTITY = if p0 and p0.collectibleItemDetails then p0.collectibleItemDetails.resellableCount else 0
			}
		})
	end, { var4, p0 }))
end