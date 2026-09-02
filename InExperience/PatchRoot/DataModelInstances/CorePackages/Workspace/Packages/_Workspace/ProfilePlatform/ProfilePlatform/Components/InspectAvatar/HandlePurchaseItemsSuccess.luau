local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local catalogNetworkingModule = require(parent.CatalogNetworking)
local purchaseDetailsStore = catalogNetworkingModule.PurchaseDetailsStore
local bundleOwnershipStore = catalogNetworkingModule.BundleOwnershipStore
local _ = require(profilePlatform.Contexts.ProfileWrapperContext)
local marketplaceUnifiedAction = require(parent.AvatarExperienceAnalytics).UnifiedEventLogEnums.MarketplaceUnifiedAction
local enumsModule = require(profilePlatform.Common.Enums)
local sendProfilePurchaseEventsModule = require(profilePlatform.Analytics.sendProfilePurchaseEvents)
local fFlagProfileInspectAndBuyRefreshBalanceAfterPurchaseModule = require(profilePlatform.Flags.FFlagProfileInspectAndBuyRefreshBalanceAfterPurchase)
local fFlagProfileUnifiedPurchaseLoggingModule = require(profilePlatform.Flags.FFlagProfileUnifiedPurchaseLogging)

local function buildEquippableAssets(value, p1, p2)
	local t = {}
	local t_1 = {}
	
	local function append(p3)
		-- upvalues: t_1 (ref), p2 (ref), t (ref)
		for i, v in p3 do
			if not t_1[v] then
				local var1 = p2[v]
				
				if var1 then
					t_1[v] = true
					table.insert(t, { assetTypeId = tostring(var1), assetId = tostring(v) })
				end
			end
		end
	end
	
	append(value)
	append(p1)
	
	return t
end

local function parseLineItems(p3)
	local t = {}
	local t_1 = {}
	local var1 = 0
	
	for i, v in p3 do
		if v.status ~= "SUCCEEDED" then
			var1 += 1
		elseif v.bundleId then
			table.insert(t_1, tostring(v.bundleId))
			table.insert(t, tostring(v.bundleId))
		elseif v.assetId then
			table.insert(t, tostring(v.assetId))
		end
	end
	return t, t_1, var1
end

local function buildPurchasedItems(p4, p5)
	-- upvalues: enumsModule (ref)
	local t = {}
	
	if p5 then
		for i, v in p5 do
			if v.itemSubType then
				t[v.itemId] = v.itemSubType
			end
		end
	end
	local t_1 = {}
	
	for i, v in p4 do
		if v.status == "SUCCEEDED" then
			local var2 = if v.bundleId then tostring(v.bundleId) elseif v.assetId then tostring(v.assetId) else nil
			
			if var2 then
				table.insert(t_1, {
					itemId = var2,
					itemType = if v.bundleId then enumsModule.ItemTypes.Bundle else enumsModule.ItemTypes.Asset,
					itemSubType = t[var2],
					priceInRobux = v.agreedPriceRobux
				})
			end
		end
	end
	return t_1
end

return function(p6)
	-- upvalues: parseLineItems (ref), fFlagProfileUnifiedPurchaseLoggingModule (ref), sendProfilePurchaseEventsModule (ref), marketplaceUnifiedAction (ref), buildPurchasedItems (ref), purchaseDetailsStore (ref), bundleOwnershipStore (ref), buildEquippableAssets (ref), fFlagProfileInspectAndBuyRefreshBalanceAfterPurchaseModule (ref), setCurrentToastMessage (ref)
	local lineItems
	local responseBody = p6.result and p6.result.responseBody
	local fulfillmentGroups = responseBody and responseBody.fulfillmentGroups
	
	if fulfillmentGroups then
		lineItems = fulfillmentGroups[1] and (fulfillmentGroups[1].lineItems or {})
	end
	local var3, var4, var5 = parseLineItems(lineItems)
	
	if fFlagProfileUnifiedPurchaseLoggingModule then
		sendProfilePurchaseEventsModule(marketplaceUnifiedAction.PURCHASE_SUCCESS, buildPurchasedItems(lineItems, p6.purchasedItems), p6.profileWrapperContext.profileType)
	end
	purchaseDetailsStore.markItemsOwned(var3)
	
	if #var4 > 0 then
		bundleOwnershipStore.markOwned(var4)
	end
	if p6.isWearAfterPurchaseChecked and p6.profileWrapperContext.postPurchase then
		local var6 = buildEquippableAssets(p6.purchasedWearIds or {}, p6.ownedAssetIds or {}, p6.wearTypeMap or {})
		
		if #var6 > 0 then
			if p6.avatarSaveContext and p6.avatarSaveContext.autoSaveNextNewSaveData then
				p6.avatarSaveContext.autoSaveNextNewSaveData()
			end
			p6.profileWrapperContext.postPurchase.wearAfterPurchase(var6)
		end
	end
	if fFlagProfileInspectAndBuyRefreshBalanceAfterPurchaseModule and #var3 > 0 then
		local postPurchase = p6.profileWrapperContext.postPurchase
		
		if postPurchase and postPurchase.refreshRobuxBalance then
			postPurchase.refreshRobuxBalance()
		end
	end
	p6.dispatch(setCurrentToastMessage(if var5 == 0 then {
		isLocalized = true,
		toastType = "PurchaseMessage",
		toastMessage = if #var3 == 1 then p6.localized.purchaseSuccessSingular else p6.localized.purchaseSuccessPlural
	} else {
		isLocalized = true,
		toastType = "PurchaseMessage",
		toastMessage = p6.localized.purchasePartialFailure
	}))
end