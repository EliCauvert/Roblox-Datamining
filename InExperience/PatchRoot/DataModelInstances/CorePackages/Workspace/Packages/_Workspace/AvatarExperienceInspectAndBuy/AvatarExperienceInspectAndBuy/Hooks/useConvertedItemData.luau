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

local function getResellableInsances(p0)
	return p0.collectibleResellableInstances
end

return function(p1)
	-- upvalues: useCallback (ref), itemTypeEnum (ref), fFlagAXEnableBatchItemDetailsFetchV2 (ref), performFetch (ref), batchItemDetailsPerformFetchKey (ref), useSelector (ref), tutilsModule (ref), getResellableInsances (ref), useMemo (ref), convertAssetInfoToItemDataModule (ref), convertBundleInfoToItemDataModule (ref)
	local var8 = if p1 then p1.id else nil
	local var9 = if p1 then p1.itemType else nil
	local var10 = useCallback(function(p2)
		-- upvalues: fFlagAXEnableBatchItemDetailsFetchV2 (copy), performFetch (copy), batchItemDetailsPerformFetchKey (copy), var8 (ref), var9 (ref), itemTypeEnum (copy)
		return if fFlagAXEnableBatchItemDetailsFetchV2 then performFetch.GetStatus(p2, batchItemDetailsPerformFetchKey) elseif var8 and var9 then performFetch.GetStatus(p2, string.format("inspectAndBuy.%d.getItemDetails.%s.%s", p2.storeId, var8, if var9 == itemTypeEnum.Asset then tostring(Enum.AvatarItemType.Asset) else tostring(Enum.AvatarItemType.Bundle))) else nil
	end, { var8, var9 })
	local var11 = useSelector(useCallback(function(p3)
		-- upvalues: var9 (ref), itemTypeEnum (copy), var8 (ref)
		return if var9 == itemTypeEnum.Asset then p3.assets[var8] elseif var9 == itemTypeEnum.Bundle then p3.bundles[var8] else nil
	end, { var8, var9 }), tutilsModule.deepEqual)
	local var12 = useSelector(getResellableInsances, tutilsModule.deepEqual)
	
	return useMemo(function()
		-- upvalues: var11 (ref), var12 (ref), var9 (ref), itemTypeEnum (copy), convertAssetInfoToItemDataModule (copy), convertBundleInfoToItemDataModule (copy)
		local var13 = if var11 and var11.collectibleItemId ~= nil and var12 ~= nil then var12[var11.collectibleItemId] else nil
		
		if var11 then
			return if var9 == itemTypeEnum.Asset then convertAssetInfoToItemDataModule(var11, var13) elseif var9 == itemTypeEnum.Bundle then convertBundleInfoToItemDataModule(var11, var13) else nil
		end
	end, { var11, var12, var9 }), useSelector(var10, tutilsModule.deepEqual)
end