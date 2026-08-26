local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local _ = require(avatarExperienceInspectAndBuy.Types)
local AXCommonModule = require(avatarExperienceInspectAndBuy.Parent.AXCommon)
local reactModule = require(parent.React)
local useMemo = reactModule.useMemo
local useCallback = reactModule.useCallback
local roactUtilsModule = require(parent.RoactUtils)
local convertAssetInfoToItemDataModule = require(avatarExperienceInspectAndBuy.Utils.convertAssetInfoToItemData)
local convertBundleInfoToItemDataModule = require(avatarExperienceInspectAndBuy.Utils.convertBundleInfoToItemData)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local tutilsModule = require(parent.tutils)
local performFetch = require(parent.Http).PerformFetch
local itemTypeEnum = AXCommonModule.Enums.ItemTypeEnum
local fFlagAXEnableBatchItemDetailsFetchV2 = require(parent.AvatarExperienceFlags).FFlagAXEnableBatchItemDetailsFetchV2
local batchItemDetailsPerformFetchKey = require(avatarExperienceInspectAndBuy.Constants).BatchItemDetailsPerformFetchKey

local function getResellableInsances(p1)
	return p1.collectibleResellableInstances
end

return function(p1)
	-- upvalues: useCallback (ref), itemTypeEnum (ref), fFlagAXEnableBatchItemDetailsFetchV2 (ref), performFetch (ref), batchItemDetailsPerformFetchKey (ref), useSelector (ref), tutilsModule (ref), getResellableInsances (ref), useMemo (ref), convertAssetInfoToItemDataModule (ref), convertBundleInfoToItemDataModule (ref)
	local var1 = if p1 then p1.id else nil
	local var2 = if p1 then p1.itemType else nil
	local var3 = useCallback(function(p2)
		-- upvalues: fFlagAXEnableBatchItemDetailsFetchV2 (copy), performFetch (copy), batchItemDetailsPerformFetchKey (copy), var1 (ref), var2 (ref), itemTypeEnum (copy)
		return if fFlagAXEnableBatchItemDetailsFetchV2 then performFetch.GetStatus(p2, batchItemDetailsPerformFetchKey) elseif var1 and var2 then performFetch.GetStatus(p2, string.format("inspectAndBuy.%d.getItemDetails.%s.%s", p2.storeId, var1, if var2 == itemTypeEnum.Asset then tostring(Enum.AvatarItemType.Asset) else tostring(Enum.AvatarItemType.Bundle))) else nil
	end, { var1, var2 })
	local var4 = useSelector(useCallback(function(p2)
		-- upvalues: var2 (ref), itemTypeEnum (copy), var1 (ref)
		return if var2 == itemTypeEnum.Asset then p2.assets[var1] elseif var2 == itemTypeEnum.Bundle then p2.bundles[var1] else nil
	end, { var1, var2 }), tutilsModule.deepEqual)
	local var5 = useSelector(getResellableInsances, tutilsModule.deepEqual)
	
	return useMemo(function()
		-- upvalues: var4 (ref), var5 (ref), var2 (ref), itemTypeEnum (copy), convertAssetInfoToItemDataModule (copy), convertBundleInfoToItemDataModule (copy)
		local var6 = if var4 and var4.collectibleItemId ~= nil and var5 ~= nil then var5[var4.collectibleItemId] else nil
		
		if var4 then
			return if var2 == itemTypeEnum.Asset then convertAssetInfoToItemDataModule(var4, var6) elseif var2 == itemTypeEnum.Bundle then convertBundleInfoToItemDataModule(var4, var6) else nil
		end
	end, { var4, var5, var2 }), useSelector(var3, tutilsModule.deepEqual)
end