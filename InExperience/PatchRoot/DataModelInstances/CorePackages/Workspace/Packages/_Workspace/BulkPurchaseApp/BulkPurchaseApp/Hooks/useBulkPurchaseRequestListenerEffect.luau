local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local parent = bulkPurchaseApp.Parent
local reactModule = require(parent.React)
local IXPServiceWrapper = require(parent.IXPServiceWrapper).IXPServiceWrapper
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local initiateBulkPurchaseFlowModule = require(bulkPurchaseApp.Store.Thunks.InitiateBulkPurchaseFlow)
local useNetwork = require(parent.EconomyCommonCoreScriptHooks).useNetwork
local _ = require(bulkPurchaseApp.Store.Types)
local purchasableStateEnumModule = require(bulkPurchaseApp.Enums.PurchasableStateEnum)
local bulkPurchasePromptStateEnumModule = require(bulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)
local selectPromptStateModule = require(bulkPurchaseApp.Store.Selectors.selectPromptState)
local bulkPurchaseRefreshedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseRefreshed)
local bulkPurchaseFailedModule = require(bulkPurchaseApp.Store.Actions.BulkPurchaseFailed)
local errorCodeEnumModule = require(bulkPurchaseApp.Enums.ErrorCodeEnum)
local fFlagBulkPurchaseEnablePurchaseOptionsModule = require(bulkPurchaseApp.Flags.FFlagBulkPurchaseEnablePurchaseOptions)
local fFlagAXAddPlusUpsellToBulkPurchaseModule = require(bulkPurchaseApp.Flags.FFlagAXAddPlusUpsellToBulkPurchase)
local convertToDiscountInformationOrNilModule = require(bulkPurchaseApp.Utils.convertToDiscountInformationOrNil)
local AXAddPlusUpsellToBulkPurchaseExposure = game:DefineFastFlag("AXAddPlusUpsellToBulkPurchaseExposure", false)
local AXAddPlusUpsellToBulkPurchaseLayerName = game:DefineFastString("AXAddPlusUpsellToBulkPurchaseLayerName", "AvatarExperience.UA.MarketplaceView")
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
	-- upvalues: useDispatch (ref), useNetwork (ref), fFlagAXAddPlusUpsellToBulkPurchaseModule (ref), useSelector (ref), selectPromptStateModule (ref), bulkPurchasePromptStateEnumModule (ref), reactModule (ref), marketplaceService (ref), playersService (ref), fFlagBulkPurchaseEnablePurchaseOptionsModule (ref), bulkPurchaseApp (ref), AXAddPlusUpsellToBulkPurchaseExposure (ref), IXPServiceWrapper (ref), AXAddPlusUpsellToBulkPurchaseLayerName (ref), initiateBulkPurchaseFlowModule (ref), transformItemDataToBulkPurchaseItemData (ref), convertToDiscountInformationOrNilModule (ref), bulkPurchaseRefreshedModule (ref), bulkPurchaseFailedModule (ref), errorCodeEnumModule (ref)
	local var1 = useDispatch()
	local var2 = useNetwork()
	local var3 = if fFlagAXAddPlusUpsellToBulkPurchaseModule then useSelector(selectPromptStateModule) == bulkPurchasePromptStateEnumModule.Request else nil
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), marketplaceService (copy), playersService (copy), fFlagBulkPurchaseEnablePurchaseOptionsModule (copy), bulkPurchaseApp (copy), AXAddPlusUpsellToBulkPurchaseExposure (copy), IXPServiceWrapper (copy), AXAddPlusUpsellToBulkPurchaseLayerName (copy), initiateBulkPurchaseFlowModule (copy), transformItemDataToBulkPurchaseItemData (copy), convertToDiscountInformationOrNilModule (copy)
		local var4 = if var1 and var2 then marketplaceService.PromptBulkPurchaseRequestedV2:Connect(function(p2, p3, p4, p5, p6, p7, p8)
			-- upvalues: playersService (copy), fFlagBulkPurchaseEnablePurchaseOptionsModule (copy), bulkPurchaseApp (copy), AXAddPlusUpsellToBulkPurchaseExposure (copy), IXPServiceWrapper (copy), AXAddPlusUpsellToBulkPurchaseLayerName (copy), var1 (copy), initiateBulkPurchaseFlowModule (copy), var2 (copy), transformItemDataToBulkPurchaseItemData (copy), convertToDiscountInformationOrNilModule (copy)
			if p2 == playersService.LocalPlayer then
				if fFlagBulkPurchaseEnablePurchaseOptionsModule and require(bulkPurchaseApp.Flags.FFlagBulkPurchaseReportsMissingPurchaseOptions) then
					require(bulkPurchaseApp.Utils.reportBulkPurchaseRequestIssues)(p3)
				end
				if AXAddPlusUpsellToBulkPurchaseExposure then
					IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AXAddPlusUpsellToBulkPurchaseLayerName)
				end
				var1(initiateBulkPurchaseFlowModule(var2, transformItemDataToBulkPurchaseItemData(p3), p4, p5, p6, p7, convertToDiscountInformationOrNilModule(p8)))
			end
		end) else nil
		
		return function()
			-- upvalues: var4 (write)
			if var4 then
				var4:Disconnect()
				var4 = nil
			end
		end
	end, { var1, var2 })
	
	if fFlagAXAddPlusUpsellToBulkPurchaseModule then
		reactModule.useEffect(function()
			-- upvalues: var3 (write), marketplaceService (copy), playersService (copy), var1 (ref), bulkPurchaseRefreshedModule (copy), transformItemDataToBulkPurchaseItemData (copy), convertToDiscountInformationOrNilModule (copy), bulkPurchaseFailedModule (copy), errorCodeEnumModule (copy)
			local var4 = nil
			
			if var3 then
				local ok, status = pcall(function()
					-- upvalues: marketplaceService (copy), playersService (copy), var1 (copy), bulkPurchaseRefreshedModule (copy), transformItemDataToBulkPurchaseItemData (copy), convertToDiscountInformationOrNilModule (copy), bulkPurchaseFailedModule (copy), errorCodeEnumModule (copy)
					return marketplaceService.PromptBulkPurchaseRefreshed:Connect(function(p2, p3, p4)
						-- upvalues: playersService (copy), var1 (copy), bulkPurchaseRefreshedModule (copy), transformItemDataToBulkPurchaseItemData (copy), convertToDiscountInformationOrNilModule (copy), bulkPurchaseFailedModule (copy), errorCodeEnumModule (copy)
						if p2 == playersService.LocalPlayer and p3 == Enum.MarketplaceBulkPurchasePromptStatus.Completed then
							var1(bulkPurchaseRefreshedModule(transformItemDataToBulkPurchaseItemData(p4.displayData), p4.orderRequest, p4.purchaserRobuxBalance, p4.orderTotalRobux, p4.options, convertToDiscountInformationOrNilModule(p4.discountInformation)))
							
							return
						end
						var1(bulkPurchaseFailedModule(errorCodeEnumModule.Generic))
					end)
				end)
				
				if ok then
					var4 = status
				end
			end
			return function()
				-- upvalues: var4 (write)
				if var4 then
					var4:Disconnect()
				end
			end
		end, { var1, var3 })
	end
end