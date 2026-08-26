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

local var1 = function(p1)
	return { assets = p1.assets, bundles = p1.bundles }
end

local var2 = function(p1)
	return p1.collectibleResellableInstances
end

return function(p1, p2)
	-- upvalues: useSelector (ref), var1 (ref), tutilsModule (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (ref), var2 (ref), useItemSelectionStore (ref), useSignalState (ref), reactModule (ref), bulkPurchaseUtilsModule (ref), robloxReplicatedStorageService (ref), itemTypeEnum (ref), buildBulkPurchaseAnalyticsPayloadModule (ref), fIntBulkPurchaseRequestLimit (ref)
	local var3 = useSelector(var1, tutilsModule.deepEqual)
	local var4 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSelector(var2, tutilsModule.deepEqual) else nil
	local var5 = if fFlagAXEnableIaBTimedOptionsBulkPurchase then useSignalState((if fFlagAXEnableIaBTimedOptionsBulkPurchase then useItemSelectionStore() else nil).getItemDataMap) else nil
	local var6 = reactModule.useMemo(function()
		-- upvalues: bulkPurchaseUtilsModule (copy), p1 (ref), var3 (ref), fFlagAXEnableIaBTimedOptionsBulkPurchase (copy), var5 (ref)
		return bulkPurchaseUtilsModule.getBulkPurchaseEligibleItems(p1, var3, if fFlagAXEnableIaBTimedOptionsBulkPurchase then var5 else nil)
	end, {
		p1,
		var3,
		if fFlagAXEnableIaBTimedOptionsBulkPurchase then var5 else nil
	})
	
	return reactModule.useCallback(function()
		-- upvalues: robloxReplicatedStorageService (copy), var6 (ref), itemTypeEnum (copy), fFlagAXEnableIaBTimedOptionsBulkPurchase (copy), var5 (ref), buildBulkPurchaseAnalyticsPayloadModule (copy), var3 (ref), var4 (ref), p2 (ref)
		coroutine.wrap(function()
			-- upvalues: robloxReplicatedStorageService (copy), var6 (copy), itemTypeEnum (copy), fFlagAXEnableIaBTimedOptionsBulkPurchase (copy), var5 (copy), buildBulkPurchaseAnalyticsPayloadModule (copy), var3 (copy), var4 (copy), p2 (copy)
			robloxReplicatedStorageService:WaitForChild("ServerSideBulkPurchaseEvent", 1e999):FireServer(var6.requestedItems)
			
			for i, v in var6.requestedItems do
				local var7 = if v.itemType == Enum.AvatarItemType.Asset.Value then itemTypeEnum.Asset else itemTypeEnum.Bundle
				local var8 = tostring(v.id)
				
				if fFlagAXEnableIaBTimedOptionsBulkPurchase then
					local var9 = buildBulkPurchaseAnalyticsPayloadModule({
						itemId = var8,
						itemType = var7,
						assetsMap = var3.assets,
						bundlesMap = var3.bundles,
						collectibleResellableInstances = var4,
						storedData = var5 and var5[var8]
					})
					
					if var9 then
						p2.reportPurchaseAttemptUnifiedEvent(var7, var8, var9)
					end
				else
					p2.reportPurchaseAttempt(var7, var8)
				end
			end
		end)()
	end, {
		var6, p2.reportPurchaseAttempt,
		if fFlagAXEnableIaBTimedOptionsBulkPurchase then var5 else nil,
		if fFlagAXEnableIaBTimedOptionsBulkPurchase then var3 else nil,
		if fFlagAXEnableIaBTimedOptionsBulkPurchase then var4 else nil,
		if fFlagAXEnableIaBTimedOptionsBulkPurchase then p2.reportPurchaseAttemptUnifiedEvent else nil
	}), reactModule.useMemo(function()
		-- upvalues: var6 (ref), fIntBulkPurchaseRequestLimit (copy)
		local var7
		if var6.requestedItems then
			var7 = false
			
			return if #var6.requestedItems <= fIntBulkPurchaseRequestLimit then #var6.requestedItems > 0 else var7
		end
		var7 = false
	end, { var6 }), var6.totalPrice or 0
end