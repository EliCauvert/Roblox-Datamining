local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local catalogNetworkingModule = require(parent.CatalogNetworking)
local purchaseDetailsStore = catalogNetworkingModule.PurchaseDetailsStore
local bundleOwnershipStore = catalogNetworkingModule.BundleOwnershipStore
local _ = require(profilePlatform.Contexts.ProfileWrapperContext)
local fFlagProfileInspectAndBuyRefreshBalanceAfterPurchaseModule = require(profilePlatform.Flags.FFlagProfileInspectAndBuyRefreshBalanceAfterPurchase)

local function buildEquippableAssets(value, p0, p1)
	local t = {}
	local t_1 = {}
	
	local function append(p2)
		-- upvalues: t_1 (ref), p1 (ref), t (ref)
		for i, v in p2 do
			if not t_1[v] then
				local var8 = p1[v]
				
				if var8 then
					t_1[v] = true
					table.insert(t, { assetTypeId = tostring(var8), assetId = tostring(v) })
				end
			end
		end
	end
	
	append(value)
	append(p0)
	
	return t
end

local function parseLineItems(p3)
	local t = {}
	local t_1 = {}
	local var11 = 0
	
	for i, v in p3 do
		if v.status ~= "SUCCEEDED" then
			var11 += 1
		elseif v.bundleId then
			table.insert(t_1, tostring(v.bundleId))
			table.insert(t, tostring(v.bundleId))
		elseif v.assetId then
			table.insert(t, tostring(v.assetId))
		end
	end
	return t, t_1, var11
end

return function(p4)
	-- upvalues: parseLineItems (ref), purchaseDetailsStore (ref), bundleOwnershipStore (ref), buildEquippableAssets (ref), fFlagProfileInspectAndBuyRefreshBalanceAfterPurchaseModule (ref), setCurrentToastMessage (ref)
	local lineItems
	local responseBody = p4.result and p4.result.responseBody
	local fulfillmentGroups = responseBody and responseBody.fulfillmentGroups
	
	if fulfillmentGroups then
		lineItems = fulfillmentGroups[1] and (fulfillmentGroups[1].lineItems or {})
	end
	local var15, var16, var17 = parseLineItems(lineItems)
	purchaseDetailsStore.markItemsOwned(var15)
	
	if #var16 > 0 then
		bundleOwnershipStore.markOwned(var16)
	end
	if p4.isWearAfterPurchaseChecked and p4.profileWrapperContext.postPurchase then
		local var18 = buildEquippableAssets(p4.purchasedWearIds or {}, p4.ownedAssetIds or {}, p4.wearTypeMap or {})
		
		if #var18 > 0 then
			if p4.avatarSaveContext and p4.avatarSaveContext.autoSaveNextNewSaveData then
				p4.avatarSaveContext.autoSaveNextNewSaveData()
			end
			p4.profileWrapperContext.postPurchase.wearAfterPurchase(var18)
		end
	end
	if fFlagProfileInspectAndBuyRefreshBalanceAfterPurchaseModule and #var15 > 0 then
		local postPurchase = p4.profileWrapperContext.postPurchase
		
		if postPurchase and postPurchase.refreshRobuxBalance then
			postPurchase.refreshRobuxBalance()
		end
	end
	p4.dispatch(setCurrentToastMessage(if var17 == 0 then {
		isLocalized = true,
		toastType = "PurchaseMessage",
		toastMessage = if #var15 == 1 then p4.localized.purchaseSuccessSingular else p4.localized.purchaseSuccessPlural
	} else {
		isLocalized = true,
		toastType = "PurchaseMessage",
		toastMessage = p4.localized.purchasePartialFailure
	}))
end