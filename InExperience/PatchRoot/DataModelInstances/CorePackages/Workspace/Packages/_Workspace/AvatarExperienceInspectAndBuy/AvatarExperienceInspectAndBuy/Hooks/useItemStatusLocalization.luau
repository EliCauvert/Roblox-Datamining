local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local _ = require(AvatarExperienceInspectAndBuy.Types)
local ItemTypeEnum = require(Parent.AvatarExperienceModel).Enums.ItemTypeEnum
local ConstantsModule = require(AvatarExperienceInspectAndBuy.Constants)
local AssetLocalizationKeys = ConstantsModule.AssetLocalizationKeys
local BundleLocalizationKeys = ConstantsModule.BundleLocalizationKeys
local PriceStatusLocalizationKeys = ConstantsModule.PriceStatusLocalizationKeys
local ItemDetailsLocalizationKeys = ConstantsModule.ItemDetailsLocalizationKeys
local CryoModule = require(Parent.Cryo)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: ReactModule (copy), ItemTypeEnum (copy), BundleLocalizationKeys (copy), AssetLocalizationKeys (copy), CryoModule (copy), PriceStatusLocalizationKeys (copy), ItemDetailsLocalizationKeys (copy), UseLocalizationFunction (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ItemTypeEnum (upval), BundleLocalizationKeys (upval), AssetLocalizationKeys (upval)
		return if p1 and p1.itemType == ItemTypeEnum.Bundle then BundleLocalizationKeys else AssetLocalizationKeys
	end, { p1 })
	
	return (UseLocalizationFunction((ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), UseMemoResult (copy), PriceStatusLocalizationKeys (upval), ItemDetailsLocalizationKeys (upval), p1 (copy)
		return CryoModule.Dictionary.join(UseMemoResult, PriceStatusLocalizationKeys, ItemDetailsLocalizationKeys, {
			ownedItems = {
				ItemDetailsLocalizationKeys.ownedItems,
				QUANTITY = if p1 and p1.collectibleItemDetails then p1.collectibleItemDetails.resellableCount else 0
			}
		})
	end, { UseMemoResult, p1 }))))
end