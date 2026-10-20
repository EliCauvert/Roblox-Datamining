local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local InitiateBulkPurchaseFlowModule = require(BulkPurchaseApp.Store.Thunks.InitiateBulkPurchaseFlow)
local UseNetworkFunction = require(Parent.EconomyCommonCoreScriptHooks).useNetwork
local _ = require(BulkPurchaseApp.Store.Types)
local PurchasableStateEnumModule = require(BulkPurchaseApp.Enums.PurchasableStateEnum)
local FFlagBulkPurchaseEnablePurchaseOptionsModule = require(BulkPurchaseApp.Flags.FFlagBulkPurchaseEnablePurchaseOptions)
local ConvertToDiscountInformationOrNilModule = require(BulkPurchaseApp.Utils.convertToDiscountInformationOrNil)
local _ = require(BulkPurchaseApp.Store.Types)

local function transformItemDataToBulkPurchaseItemData(List)
	-- upvalues: PurchasableStateEnumModule (copy), FFlagBulkPurchaseEnablePurchaseOptionsModule (copy)
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, {
			id = value.id,
			name = value.name,
			description = value.description,
			priceRobux = value.priceRobux,
			type = value.type,
			ownedCount = value.ownedCount,
			quantityLimitPerUser = value.quantityLimitPerUser,
			isLimited = value.isLimited,
			purchasableState = if value.purchaseableState == "Purchaseable" then PurchasableStateEnumModule.Purchasable else value.purchaseableState,
			discountInformation = value.discountInformation,
			purchaseOptions = if FFlagBulkPurchaseEnablePurchaseOptionsModule then value.purchaseOptions else nil
		})
	end
	return List1
end

return function()
	-- upvalues: UseDispatchFunction (copy), UseNetworkFunction (copy), ReactModule (copy), MarketplaceService (copy), Players (copy), FFlagBulkPurchaseEnablePurchaseOptionsModule (copy), BulkPurchaseApp (copy), InitiateBulkPurchaseFlowModule (copy), transformItemDataToBulkPurchaseItemData (copy), ConvertToDiscountInformationOrNilModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNetworkResult = UseNetworkFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), UseNetworkResult (copy), MarketplaceService (upval), Players (upval), FFlagBulkPurchaseEnablePurchaseOptionsModule (upval), BulkPurchaseApp (upval), InitiateBulkPurchaseFlowModule (upval), transformItemDataToBulkPurchaseItemData (upval), ConvertToDiscountInformationOrNilModule (upval)
		local PromptBulkPurchaseRequestedV2Connection = if UseDispatchResult and UseNetworkResult then MarketplaceService.PromptBulkPurchaseRequestedV2:Connect(function(Player, DisplayData, OrderRequest, PurchaserRobuxBalance, OrderTotalRobux, Options, DiscountInformation)
			-- upvalues: Players (upval), FFlagBulkPurchaseEnablePurchaseOptionsModule (upval), BulkPurchaseApp (upval), UseDispatchResult (upval), InitiateBulkPurchaseFlowModule (upval), UseNetworkResult (upval), transformItemDataToBulkPurchaseItemData (upval), ConvertToDiscountInformationOrNilModule (upval)
			if Player == Players.LocalPlayer then
				if FFlagBulkPurchaseEnablePurchaseOptionsModule and require(BulkPurchaseApp.Flags.FFlagBulkPurchaseReportsMissingPurchaseOptions) then
					require(BulkPurchaseApp.Utils.reportBulkPurchaseRequestIssues)(DisplayData)
				end
				UseDispatchResult(InitiateBulkPurchaseFlowModule(UseNetworkResult, transformItemDataToBulkPurchaseItemData(DisplayData), OrderRequest, PurchaserRobuxBalance, OrderTotalRobux, Options, ConvertToDiscountInformationOrNilModule(DiscountInformation)))
			end
		end) else nil
		
		return function()
			-- upvalues: PromptBulkPurchaseRequestedV2Connection (ref)
			if PromptBulkPurchaseRequestedV2Connection then
				PromptBulkPurchaseRequestedV2Connection:Disconnect()
				PromptBulkPurchaseRequestedV2Connection = nil
			end
		end
	end, { UseDispatchResult, UseNetworkResult })
end