local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local CatalogNetworkingModule = require(Parent.CatalogNetworking)
local PurchaseDetailsStore = CatalogNetworkingModule.PurchaseDetailsStore
local BundleOwnershipStore = CatalogNetworkingModule.BundleOwnershipStore
local _ = require(ProfilePlatform.Contexts.ProfileWrapperContext)

local function buildEquippableAssets(PurchasedWearIds, OwnedAssetIds, WearTypeMap)
	local List = {}
	local t = {}
	
	local function append(List1)
		-- upvalues: t (copy), WearTypeMap (copy), List (copy)
		for _, value in List1 do
			if not t[value] then
				local WearType = WearTypeMap[value]
				
				if WearType then
					t[value] = true
					table.insert(List, {
						assetTypeId = tostring(WearType),
						assetId = tostring(value)
					})
				end
			end
		end
	end
	
	append(PurchasedWearIds)
	append(OwnedAssetIds)
	
	return List
end

local function parseLineItems(LineItems)
	local List = {}
	local List1 = {}
	local Count = 0
	
	for _, lineItem in LineItems do
		if lineItem.status ~= "SUCCEEDED" then
			Count += 1
			continue
		end
		if lineItem.bundleId then
			table.insert(List1, (tostring(lineItem.bundleId)))
			table.insert(List, (tostring(lineItem.bundleId)))
		elseif lineItem.assetId then
			table.insert(List, (tostring(lineItem.assetId)))
		end
	end
	return List, List1, Count
end

return function(p1)
	-- upvalues: parseLineItems (copy), PurchaseDetailsStore (copy), BundleOwnershipStore (copy), buildEquippableAssets (copy), SetCurrentToastMessageFunction (copy)
	local ResponseBody = p1.result and p1.result.responseBody
	local FulfillmentGroups = ResponseBody and ResponseBody.fulfillmentGroups
	local ParseLineItemsResult, ParseLineItemsResult2, ParseLineItemsResult3 = parseLineItems(FulfillmentGroups and FulfillmentGroups[1] and FulfillmentGroups[1].lineItems or {})
	PurchaseDetailsStore.markItemsOwned(ParseLineItemsResult)
	
	if #ParseLineItemsResult2 > 0 then
		BundleOwnershipStore.markOwned(ParseLineItemsResult2)
	end
	if p1.isWearAfterPurchaseChecked and p1.profileWrapperContext.postPurchase then
		local EquippableAssets = buildEquippableAssets(p1.purchasedWearIds, p1.ownedAssetIds, p1.wearTypeMap)
		
		if #EquippableAssets > 0 then
			if p1.avatarSaveContext and p1.avatarSaveContext.autoSaveNextNewSaveData then
				p1.avatarSaveContext.autoSaveNextNewSaveData()
			end
			p1.profileWrapperContext.postPurchase.wearAfterPurchase(EquippableAssets)
		end
	end
	p1.dispatch(SetCurrentToastMessageFunction(if ParseLineItemsResult3 == 0 then {
		isLocalized = true,
		toastType = "PurchaseMessage",
		toastMessage = if #ParseLineItemsResult == 1 then p1.localized.purchaseSuccessSingular else p1.localized.purchaseSuccessPlural
	} else {
		isLocalized = true,
		toastType = "PurchaseMessage",
		toastMessage = p1.localized.purchasePartialFailure
	}))
end