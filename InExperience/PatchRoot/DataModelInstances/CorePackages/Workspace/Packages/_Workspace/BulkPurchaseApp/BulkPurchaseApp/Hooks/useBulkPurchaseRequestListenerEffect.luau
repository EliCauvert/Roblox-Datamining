local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local initiateBulkPurchaseFlowModule = require(bulkPurchaseApp.Store.Thunks.InitiateBulkPurchaseFlow)
local useNetwork = require(parent.EconomyCommonCoreScriptHooks).useNetwork
local _ = require(bulkPurchaseApp.Store.Types)
local purchasableStateEnumModule = require(bulkPurchaseApp.Enums.PurchasableStateEnum)
local fFlagBulkPurchaseEnablePurchaseOptionsModule = require(bulkPurchaseApp.Flags.FFlagBulkPurchaseEnablePurchaseOptions)
local convertToDiscountInformationOrNilModule = require(bulkPurchaseApp.Utils.convertToDiscountInformationOrNil)
local _ = require(bulkPurchaseApp.Store.Types)

local function transformItemDataToBulkPurchaseItemData(p1)
	-- upvalues: purchasableStateEnumModule (ref), fFlagBulkPurchaseEnablePurchaseOptionsModule (ref)
	local t = {}
	
	for i, v in p1 do
		table.insert(t, {
			id = v.id,
			name = v.name,
			description = v.description,
			priceRobux = v.priceRobux,
			type = v.type,
			ownedCount = v.ownedCount,
			quantityLimitPerUser = v.quantityLimitPerUser,
			isLimited = v.isLimited,
			purchasableState = if v.purchaseableState == "Purchaseable" then purchasableStateEnumModule.Purchasable else v.purchaseableState,
			discountInformation = v.discountInformation,
			purchaseOptions = if fFlagBulkPurchaseEnablePurchaseOptionsModule then v.purchaseOptions else nil
		})
	end
	return t
end

return function()
	-- upvalues: useDispatch (ref), useNetwork (ref), reactModule (ref), marketplaceService (ref), playersService (ref), fFlagBulkPurchaseEnablePurchaseOptionsModule (ref), bulkPurchaseApp (ref), initiateBulkPurchaseFlowModule (ref), transformItemDataToBulkPurchaseItemData (ref), convertToDiscountInformationOrNilModule (ref)
	local var1 = useDispatch()
	local var2 = useNetwork()
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), marketplaceService (copy), playersService (copy), fFlagBulkPurchaseEnablePurchaseOptionsModule (copy), bulkPurchaseApp (copy), initiateBulkPurchaseFlowModule (copy), transformItemDataToBulkPurchaseItemData (copy), convertToDiscountInformationOrNilModule (copy)
		local var3 = if var1 and var2 then marketplaceService.PromptBulkPurchaseRequestedV2:Connect(function(p2, p3, p4, p5, p6, p7, p8)
			-- upvalues: playersService (copy), fFlagBulkPurchaseEnablePurchaseOptionsModule (copy), bulkPurchaseApp (copy), var1 (copy), initiateBulkPurchaseFlowModule (copy), var2 (copy), transformItemDataToBulkPurchaseItemData (copy), convertToDiscountInformationOrNilModule (copy)
			if p2 == playersService.LocalPlayer then
				if fFlagBulkPurchaseEnablePurchaseOptionsModule and require(bulkPurchaseApp.Flags.FFlagBulkPurchaseReportsMissingPurchaseOptions) then
					require(bulkPurchaseApp.Utils.reportBulkPurchaseRequestIssues)(p3)
				end
				var1(initiateBulkPurchaseFlowModule(var2, transformItemDataToBulkPurchaseItemData(p3), p4, p5, p6, p7, convertToDiscountInformationOrNilModule(p8)))
			end
		end) else nil
		
		return function()
			-- upvalues: var3 (write)
			if var3 then
				var3:Disconnect()
				var3 = nil
			end
		end
	end, { var1, var2 })
end