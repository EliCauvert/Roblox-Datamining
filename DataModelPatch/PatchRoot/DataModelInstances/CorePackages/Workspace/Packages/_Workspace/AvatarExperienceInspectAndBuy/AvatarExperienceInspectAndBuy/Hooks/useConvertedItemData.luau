local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local _ = require(AvatarExperienceInspectAndBuy.Types)
local ReactModule = require(Parent.React)
local UseMemoFunction = ReactModule.useMemo
local UseCallbackFunction = ReactModule.useCallback
local ConvertAssetInfoToItemDataModule = require(AvatarExperienceInspectAndBuy.Utils.convertAssetInfoToItemData)
local ConvertBundleInfoToItemDataModule = require(AvatarExperienceInspectAndBuy.Utils.convertBundleInfoToItemData)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local TutilsModule = require(Parent.tutils)
local PerformFetch = require(Parent.Http).PerformFetch
local ItemTypeEnum = require(AvatarExperienceInspectAndBuy.Parent.AXCommon).Enums.ItemTypeEnum
local FFlagAXEnableBatchItemDetailsFetchV2 = require(Parent.AvatarExperienceFlags).FFlagAXEnableBatchItemDetailsFetchV2
local BatchItemDetailsPerformFetchKey = require(AvatarExperienceInspectAndBuy.Constants).BatchItemDetailsPerformFetchKey

local function getResellableInsances(p1)
	return p1.collectibleResellableInstances
end

return function(p1)
	-- upvalues: UseCallbackFunction (copy), ItemTypeEnum (copy), FFlagAXEnableBatchItemDetailsFetchV2 (copy), PerformFetch (copy), BatchItemDetailsPerformFetchKey (copy), UseSelectorFunction (copy), TutilsModule (copy), getResellableInsances (copy), UseMemoFunction (copy), ConvertAssetInfoToItemDataModule (copy), ConvertBundleInfoToItemDataModule (copy)
	local Id = if p1 then p1.id else nil
	local ItemType = if p1 then p1.itemType else nil
	local UseCallbackResult = UseCallbackFunction(function(p2)
		-- upvalues: ItemType (copy), ItemTypeEnum (upval), Id (copy)
		return if ItemType == ItemTypeEnum.Asset then p2.assets[Id] elseif ItemType == ItemTypeEnum.Bundle then p2.bundles[Id] else nil
	end, { Id, ItemType })
	local UseCallbackResult1 = UseCallbackFunction(function(p2)
		-- upvalues: FFlagAXEnableBatchItemDetailsFetchV2 (upval), PerformFetch (upval), BatchItemDetailsPerformFetchKey (upval), Id (copy), ItemType (copy), ItemTypeEnum (upval)
		return if FFlagAXEnableBatchItemDetailsFetchV2 then PerformFetch.GetStatus(p2, BatchItemDetailsPerformFetchKey) elseif Id and ItemType then PerformFetch.GetStatus(p2, (string.format("inspectAndBuy.%d.getItemDetails.%s.%s", p2.storeId, Id, if ItemType == ItemTypeEnum.Asset then tostring(Enum.AvatarItemType.Asset) else tostring(Enum.AvatarItemType.Bundle)))) else nil
	end, { Id, ItemType })
	local UseSelectorResult = UseSelectorFunction(UseCallbackResult, TutilsModule.deepEqual)
	local UseSelectorResult1 = UseSelectorFunction(getResellableInsances, TutilsModule.deepEqual)
	
	return UseMemoFunction(function()
		-- upvalues: UseSelectorResult (copy), UseSelectorResult1 (copy), ItemType (copy), ItemTypeEnum (upval), ConvertAssetInfoToItemDataModule (upval), ConvertBundleInfoToItemDataModule (upval)
		local UseSelectorResultEntry = if UseSelectorResult and UseSelectorResult.collectibleItemId ~= nil and UseSelectorResult1 ~= nil then UseSelectorResult1[UseSelectorResult.collectibleItemId] else nil
		
		if UseSelectorResult then
			if ItemType == ItemTypeEnum.Asset then
				return (ConvertAssetInfoToItemDataModule(UseSelectorResult, UseSelectorResultEntry))
			elseif ItemType == ItemTypeEnum.Bundle then
				return (ConvertBundleInfoToItemDataModule(UseSelectorResult, UseSelectorResultEntry))
			end
		end
		return nil
	end, { UseSelectorResult, UseSelectorResult1, ItemType }), (UseSelectorFunction(UseCallbackResult1, TutilsModule.deepEqual))
end