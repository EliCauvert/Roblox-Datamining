local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local _ = require(AvatarExperienceInspectAndBuy.Types)
local FIntBulkPurchaseRequestLimit = require(Parent.SharedFlags).FIntBulkPurchaseRequestLimit
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local BulkPurchaseUtilsModule = require(AvatarExperienceInspectAndBuy.Utils.bulkPurchaseUtils)
local BuildBulkPurchaseAnalyticsPayloadModule = require(AvatarExperienceInspectAndBuy.Utils.buildBulkPurchaseAnalyticsPayload)
local TutilsModule = require(Parent.tutils)
local ItemTypeEnum = require(Parent.AvatarExperienceModel).Enums.ItemTypeEnum
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseItemSelectionStoreFunction = require(AvatarExperienceInspectAndBuy.Contexts.ItemSelectionStoreContext).useItemSelectionStore
local _ = require(AvatarExperienceInspectAndBuy.Stores.createItemSelectionStore)

local function v11(p1) --[[ Line: 43 ]]
	return { assets = p1.assets, bundles = p1.bundles }
end

local function v12(p1) --[[ Line: 50 ]]
	return p1.collectibleResellableInstances
end

return function(p1, p2) --[[ Line: 54 ]]
	-- upvalues: UseSelectorFunction (copy), v11 (copy), TutilsModule (copy), v12 (copy), UseItemSelectionStoreFunction (copy), UseSignalStateFunction (copy), ReactModule (copy), BulkPurchaseUtilsModule (copy), RobloxReplicatedStorage (copy), ItemTypeEnum (copy), BuildBulkPurchaseAnalyticsPayloadModule (copy), FIntBulkPurchaseRequestLimit (copy)
	local UseSelectorResult = UseSelectorFunction(v11, TutilsModule.deepEqual)
	local UseSelectorResult1 = UseSelectorFunction(v12, TutilsModule.deepEqual)
	local UseSignalStateResult = UseSignalStateFunction(UseItemSelectionStoreFunction().getItemDataMap)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 61 ]]
		-- upvalues: BulkPurchaseUtilsModule (upval), p1 (copy), UseSelectorResult (copy), UseSignalStateResult (copy)
		return BulkPurchaseUtilsModule.getBulkPurchaseEligibleItems(p1, UseSelectorResult, UseSignalStateResult)
	end, { p1, UseSelectorResult, UseSignalStateResult })
	
	return ReactModule.useCallback(function() --[[ Line: 67 ]]
		-- upvalues: RobloxReplicatedStorage (upval), UseMemoResult (copy), ItemTypeEnum (upval), UseSignalStateResult (copy), BuildBulkPurchaseAnalyticsPayloadModule (upval), UseSelectorResult (copy), UseSelectorResult1 (copy), p2 (copy)
		coroutine.wrap(function() --[[ Line: 68 ]]
			-- upvalues: RobloxReplicatedStorage (upval), UseMemoResult (upval), ItemTypeEnum (upval), UseSignalStateResult (upval), BuildBulkPurchaseAnalyticsPayloadModule (upval), UseSelectorResult (upval), UseSelectorResult1 (upval), p2 (upval)
			RobloxReplicatedStorage:WaitForChild("ServerSideBulkPurchaseEvent", 1e999):FireServer(UseMemoResult.requestedItems)
			
			for _, requestedItem in UseMemoResult.requestedItems do
				local Asset = if requestedItem.itemType == Enum.AvatarItemType.Asset.Value then ItemTypeEnum.Asset else ItemTypeEnum.Bundle
				local Text = tostring(requestedItem.id)
				local BulkPurchaseAnalyticsPayloadModule = BuildBulkPurchaseAnalyticsPayloadModule({
					itemId = Text,
					itemType = Asset,
					assetsMap = UseSelectorResult.assets,
					bundlesMap = UseSelectorResult.bundles,
					collectibleResellableInstances = UseSelectorResult1,
					storedData = UseSignalStateResult and UseSignalStateResult[Text]
				})
				
				if BulkPurchaseAnalyticsPayloadModule then
					p2.reportPurchaseAttemptUnifiedEvent(Asset, Text, BulkPurchaseAnalyticsPayloadModule)
				end
			end
		end)()
	end, {
		UseMemoResult,
		UseSignalStateResult,
		UseSelectorResult,
		UseSelectorResult1,
		p2.reportPurchaseAttemptUnifiedEvent
	}), ReactModule.useMemo(function(): boolean --[[ Line: 106 ]]
		-- upvalues: UseMemoResult (copy), FIntBulkPurchaseRequestLimit (upval)
		local Flag = nil
		if UseMemoResult.requestedItems then
			Flag = false
			
			if #UseMemoResult.requestedItems <= FIntBulkPurchaseRequestLimit then
				return #UseMemoResult.requestedItems > 0
			end
		else
			Flag = false
		end
		return Flag
	end, { UseMemoResult }), UseMemoResult.totalPrice or 0
end