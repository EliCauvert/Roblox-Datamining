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
local ItemTypeEnum = require(Parent.AXCommon).Enums.ItemTypeEnum
local FFlagAXEnableIaBTimedOptionsBulkPurchase = require(Parent.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseItemSelectionStoreFunction = require(AvatarExperienceInspectAndBuy.Contexts.ItemSelectionStoreContext).useItemSelectionStore
local _ = require(AvatarExperienceInspectAndBuy.Stores.createItemSelectionStore)

local function v12(p1)
	return { assets = p1.assets, bundles = p1.bundles }
end

local function v13(p1)
	return p1.collectibleResellableInstances
end

return function(p1, p2)
	-- upvalues: UseSelectorFunction (copy), v12 (copy), TutilsModule (copy), FFlagAXEnableIaBTimedOptionsBulkPurchase (copy), v13 (copy), UseItemSelectionStoreFunction (copy), UseSignalStateFunction (copy), ReactModule (copy), BulkPurchaseUtilsModule (copy), RobloxReplicatedStorage (copy), ItemTypeEnum (copy), BuildBulkPurchaseAnalyticsPayloadModule (copy), FIntBulkPurchaseRequestLimit (copy)
	local UseSelectorResult = UseSelectorFunction(v12, TutilsModule.deepEqual)
	local UseSelectorResult1 = if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseSelectorFunction(v13, TutilsModule.deepEqual) else nil
	local UseItemSelectionStoreResult = if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseItemSelectionStoreFunction() else nil
	local UseSignalStateResult = if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseSignalStateFunction(UseItemSelectionStoreResult.getItemDataMap) else nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: BulkPurchaseUtilsModule (upval), p1 (copy), UseSelectorResult (copy), FFlagAXEnableIaBTimedOptionsBulkPurchase (upval), UseSignalStateResult (copy)
		return BulkPurchaseUtilsModule.getBulkPurchaseEligibleItems(p1, UseSelectorResult, if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseSignalStateResult else nil)
	end, {
		p1,
		UseSelectorResult,
		if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseSignalStateResult else nil
	})
	
	return ReactModule.useCallback(function()
		-- upvalues: RobloxReplicatedStorage (upval), UseMemoResult (copy), ItemTypeEnum (upval), FFlagAXEnableIaBTimedOptionsBulkPurchase (upval), UseSignalStateResult (copy), BuildBulkPurchaseAnalyticsPayloadModule (upval), UseSelectorResult (copy), UseSelectorResult1 (copy), p2 (copy)
		coroutine.wrap(function()
			-- upvalues: RobloxReplicatedStorage (upval), UseMemoResult (upval), ItemTypeEnum (upval), FFlagAXEnableIaBTimedOptionsBulkPurchase (upval), UseSignalStateResult (upval), BuildBulkPurchaseAnalyticsPayloadModule (upval), UseSelectorResult (upval), UseSelectorResult1 (upval), p2 (upval)
			RobloxReplicatedStorage:WaitForChild("ServerSideBulkPurchaseEvent", 1e999):FireServer(UseMemoResult.requestedItems)
			
			for _, requestedItem in UseMemoResult.requestedItems do
				local Asset = if requestedItem.itemType == Enum.AvatarItemType.Asset.Value then ItemTypeEnum.Asset else ItemTypeEnum.Bundle
				local Text = tostring(requestedItem.id)
				
				if FFlagAXEnableIaBTimedOptionsBulkPurchase then
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
				else
					p2.reportPurchaseAttempt(Asset, Text)
				end
			end
		end)()
	end, {
		UseMemoResult, p2.reportPurchaseAttempt,
		if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseSignalStateResult else nil,
		if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseSelectorResult else nil,
		if FFlagAXEnableIaBTimedOptionsBulkPurchase then UseSelectorResult1 else nil,
		if FFlagAXEnableIaBTimedOptionsBulkPurchase then p2.reportPurchaseAttemptUnifiedEvent else nil
	}), ReactModule.useMemo(function(): boolean
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