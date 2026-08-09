local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local _ = require(avatarExperienceInspectAndBuy.Types)
local fIntBulkPurchaseRequestLimit = require(parent.SharedFlags).FIntBulkPurchaseRequestLimit
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local bulkPurchaseUtilsModule = require(avatarExperienceInspectAndBuy.Utils.bulkPurchaseUtils)
local buildBulkPurchaseAnalyticsPayloadModule = require(avatarExperienceInspectAndBuy.Utils.buildBulkPurchaseAnalyticsPayload)
local tutilsModule = require(parent.tutils)
local itemTypeEnum = require(parent.AXCommon).Enums.ItemTypeEnum
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXFixBulkPurchaseFreeItems = avatarExperienceFlagsModule.FFlagAXFixBulkPurchaseFreeItems
local fFlagAXEnableIaBTimedOptionsBulkPurchase = avatarExperienceFlagsModule.FFlagAXEnableIaBTimedOptionsBulkPurchase
local useSignalState = require(parent.SignalsReact).useSignalState
local useItemSelectionStore = require(avatarExperienceInspectAndBuy.Contexts.ItemSelectionStoreContext).useItemSelectionStore
local _ = require(avatarExperienceInspectAndBuy.Stores.createItemSelectionStore)

local var7 = function(p0) --[[ line: 47 ]]
	return { assets = p0.assets, bundles = p0.bundles }
end

local var8 = function(p1) --[[ line: 54 ]]
	return p1.collectibleResellableInstances
end

return function(p2, p3) --[[ line: 58 ]]
	-- upvalues: useSelector (ref), var7 (ref), tutilsModule (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref), var8 (ref), useItemSelectionStore (ref), useSignalState (ref), reactModule (ref), bulkPurchaseUtilsModule (ref), robloxReplicatedStorageService (ref), itemTypeEnum (ref), buildBulkPurchaseAnalyticsPayloadModule (ref), fFlagAXFixBulkPurchaseFreeItems (ref), fIntBulkPurchaseRequestLimit (ref)
	local var9 = useSelector(var7, tutilsModule.deepEqual)
	local var10 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSelector(var8, tutilsModule.deepEqual) else nil
	local var11 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSignalState((if fFlagAXEnableIaBTimedOptionsBulkPurchase then useItemSelectionStore() else nil).getItemDataMap) else nil
	local var12 = reactModule.useMemo(function() --[[ line: 69 ]]
		-- upvalues: bulkPurchaseUtilsModule (copy), p2 (ref), var9 (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (copy), var11 (ref)
		return bulkPurchaseUtilsModule.getBulkPurchaseEligibleItems(p2, var9, if fFlagAXEnableIaBTimedOptionsBulkPurchase then var11 else nil)
	end, {
		p2,
		var9,
		if fFlagAXEnableIaBTimedOptionsBulkPurchase then var11 else nil
	})
	
	return reactModule.useCallback(function() --[[ line: 79 ]]
		-- upvalues: robloxReplicatedStorageService (copy), var12 (ref), itemTypeEnum (copy), fFlagAXEnableIaBTimedOptionsBulkPurchase (copy), var11 (ref), buildBulkPurchaseAnalyticsPayloadModule (copy), var9 (ref), var10 (ref), p3 (ref)
		coroutine.wrap(function() --[[ line: 80 ]]
			-- upvalues: robloxReplicatedStorageService (copy), var12 (copy), itemTypeEnum (copy), fFlagAXEnableIaBTimedOptionsBulkPurchase (copy), var11 (copy), buildBulkPurchaseAnalyticsPayloadModule (copy), var9 (copy), var10 (copy), p3 (copy)
			robloxReplicatedStorageService:WaitForChild("ServerSideBulkPurchaseEvent", 1e999):FireServer(var12.requestedItems)
			
			for i, v in var12.requestedItems do
				local var13 = if v.itemType == Enum.AvatarItemType.Asset.Value then itemTypeEnum.Asset else itemTypeEnum.Bundle
				local var14 = tostring(v.id)
				
				if fFlagAXEnableIaBTimedOptionsBulkPurchase then
					local var15 = buildBulkPurchaseAnalyticsPayloadModule({
						itemId = var14,
						itemType = var13,
						assetsMap = var9.assets,
						bundlesMap = var9.bundles,
						collectibleResellableInstances = var10,
						storedData = var11 and var11[var14]
					})
					
					if var15 then
						p3.reportPurchaseAttemptUnifiedEvent(var13, var14, var15)
					end
				else
					p3.reportPurchaseAttempt(var13, var14)
				end
			end
		end)()
	end, {
		var12, p3.reportPurchaseAttempt,
		if fFlagAXEnableIaBTimedOptionsBulkPurchase then var11 else nil,
		if fFlagAXEnableIaBTimedOptionsBulkPurchase then var9 else nil,
		if fFlagAXEnableIaBTimedOptionsBulkPurchase then var10 else nil,
		if fFlagAXEnableIaBTimedOptionsBulkPurchase then p3.reportPurchaseAttemptUnifiedEvent else nil
	}), reactModule.useMemo(function() --[[ line: 123 ]]
		-- upvalues: fFlagAXFixBulkPurchaseFreeItems (copy), var12 (ref), fIntBulkPurchaseRequestLimit (copy)
		local _ = false
		
		return if fFlagAXFixBulkPurchaseFreeItems then if var12.requestedItems then #var12.requestedItems <= fIntBulkPurchaseRequestLimit and #var12.requestedItems > 0 else false elseif var12.requestedItems then #var12.requestedItems <= fIntBulkPurchaseRequestLimit else false
	end, { var12 }), var12.totalPrice or 0
end