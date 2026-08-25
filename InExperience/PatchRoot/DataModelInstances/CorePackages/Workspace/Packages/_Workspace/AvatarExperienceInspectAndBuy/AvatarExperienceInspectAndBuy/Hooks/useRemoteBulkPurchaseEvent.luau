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
local fFlagAXEnableIaBTimedOptionsBulkPurchase = require(parent.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase
local useSignalState = require(parent.SignalsReact).useSignalState
local useItemSelectionStore = require(avatarExperienceInspectAndBuy.Contexts.ItemSelectionStoreContext).useItemSelectionStore
local _ = require(avatarExperienceInspectAndBuy.Stores.createItemSelectionStore)

local var6 = function(p0)
	return { assets = p0.assets, bundles = p0.bundles }
end

local var7 = function(p1)
	return p1.collectibleResellableInstances
end

return function(p2, p3)
	-- upvalues: useSelector (ref), var6 (ref), tutilsModule (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref), var7 (ref), useItemSelectionStore (ref), useSignalState (ref), reactModule (ref), bulkPurchaseUtilsModule (ref), robloxReplicatedStorageService (ref), itemTypeEnum (ref), buildBulkPurchaseAnalyticsPayloadModule (ref), fIntBulkPurchaseRequestLimit (ref)
	local var8 = useSelector(var6, tutilsModule.deepEqual)
	local var9 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSelector(var7, tutilsModule.deepEqual) else nil
	local var10 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSignalState((if fFlagAXEnableIaBTimedOptionsBulkPurchase then useItemSelectionStore() else nil).getItemDataMap) else nil
	local var11 = reactModule.useMemo(function()
		-- upvalues: bulkPurchaseUtilsModule (copy), p2 (ref), var8 (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (copy), var10 (ref)
		return bulkPurchaseUtilsModule.getBulkPurchaseEligibleItems(p2, var8, if fFlagAXEnableIaBTimedOptionsBulkPurchase then var10 else nil)
	end, {
		p2,
		var8,
		if fFlagAXEnableIaBTimedOptionsBulkPurchase then var10 else nil
	})
	
	return reactModule.useCallback(function()
		-- upvalues: robloxReplicatedStorageService (copy), var11 (ref), itemTypeEnum (copy), fFlagAXEnableIaBTimedOptionsBulkPurchase (copy), var10 (ref), buildBulkPurchaseAnalyticsPayloadModule (copy), var8 (ref), var9 (ref), p3 (ref)
		coroutine.wrap(function()
			-- upvalues: robloxReplicatedStorageService (copy), var11 (copy), itemTypeEnum (copy), fFlagAXEnableIaBTimedOptionsBulkPurchase (copy), var10 (copy), buildBulkPurchaseAnalyticsPayloadModule (copy), var8 (copy), var9 (copy), p3 (copy)
			robloxReplicatedStorageService:WaitForChild("ServerSideBulkPurchaseEvent", 1e999):FireServer(var11.requestedItems)
			
			for i, v in var11.requestedItems do
				local var12 = if v.itemType == Enum.AvatarItemType.Asset.Value then itemTypeEnum.Asset else itemTypeEnum.Bundle
				local var13 = tostring(v.id)
				
				if fFlagAXEnableIaBTimedOptionsBulkPurchase then
					local var14 = buildBulkPurchaseAnalyticsPayloadModule({
						itemId = var13,
						itemType = var12,
						assetsMap = var8.assets,
						bundlesMap = var8.bundles,
						collectibleResellableInstances = var9,
						storedData = var10 and var10[var13]
					})
					
					if var14 then
						p3.reportPurchaseAttemptUnifiedEvent(var12, var13, var14)
					end
				else
					p3.reportPurchaseAttempt(var12, var13)
				end
			end
		end)()
	end, {
		var11, p3.reportPurchaseAttempt,
		if fFlagAXEnableIaBTimedOptionsBulkPurchase then var10 else nil,
		if fFlagAXEnableIaBTimedOptionsBulkPurchase then var8 else nil,
		if fFlagAXEnableIaBTimedOptionsBulkPurchase then var9 else nil,
		if fFlagAXEnableIaBTimedOptionsBulkPurchase then p3.reportPurchaseAttemptUnifiedEvent else nil
	}), reactModule.useMemo(function()
		-- upvalues: var11 (ref), fIntBulkPurchaseRequestLimit (copy)
		local var15
		if var11.requestedItems then
			var15 = false
			
			return if #var11.requestedItems <= fIntBulkPurchaseRequestLimit then #var11.requestedItems > 0 else var15
		end
		var15 = false
	end, { var11 }), var11.totalPrice or 0
end