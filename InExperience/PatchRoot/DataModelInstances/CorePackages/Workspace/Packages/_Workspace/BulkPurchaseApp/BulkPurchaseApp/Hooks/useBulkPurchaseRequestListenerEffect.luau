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

local function transformItemDataToBulkPurchaseItemData(p0)
	-- upvalues: purchasableStateEnumModule (ref), fFlagBulkPurchaseEnablePurchaseOptionsModule (ref)
	local t = {}
	
	for i, v in p0 do
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
	local var10 = useDispatch()
	local var11 = useNetwork()
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var11 (ref), marketplaceService (copy), playersService (copy), fFlagBulkPurchaseEnablePurchaseOptionsModule (copy), bulkPurchaseApp (copy), initiateBulkPurchaseFlowModule (copy), transformItemDataToBulkPurchaseItemData (copy), convertToDiscountInformationOrNilModule (copy)
		local var12 = if var10 and var11 then marketplaceService.PromptBulkPurchaseRequestedV2:Connect(function(p1, p2, p3, p4, p5, p6, p7)
			-- upvalues: playersService (copy), fFlagBulkPurchaseEnablePurchaseOptionsModule (copy), bulkPurchaseApp (copy), var10 (copy), initiateBulkPurchaseFlowModule (copy), var11 (copy), transformItemDataToBulkPurchaseItemData (copy), convertToDiscountInformationOrNilModule (copy)
			if p1 == playersService.LocalPlayer then
				if fFlagBulkPurchaseEnablePurchaseOptionsModule and require(bulkPurchaseApp.Flags.FFlagBulkPurchaseReportsMissingPurchaseOptions) then
					require(bulkPurchaseApp.Utils.reportBulkPurchaseRequestIssues)(p2)
				end
				var10(initiateBulkPurchaseFlowModule(var11, transformItemDataToBulkPurchaseItemData(p2), p3, p4, p5, p6, convertToDiscountInformationOrNilModule(p7)))
			end
		end) else nil
		
		return function()
			-- upvalues: var12 (write)
			if var12 then
				var12:Disconnect()
				var12 = nil
			end
		end
	end, { var10, var11 })
end