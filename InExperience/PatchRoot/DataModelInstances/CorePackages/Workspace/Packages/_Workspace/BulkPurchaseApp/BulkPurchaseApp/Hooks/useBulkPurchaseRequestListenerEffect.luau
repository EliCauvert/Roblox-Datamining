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
local bulkPurchaseCountersEnumModule = require(bulkPurchaseApp.Enums.BulkPurchaseCountersEnum)
local reportBulkPurchaseRequestCountersModule = require(bulkPurchaseApp.Utils.reportBulkPurchaseRequestCounters)
local fFlagBulkPurchaseEnablePurchaseOptionsModule = require(bulkPurchaseApp.Flags.FFlagBulkPurchaseEnablePurchaseOptions)
local fFlagAXAddPlusUpsellToBulkPurchaseModule = require(bulkPurchaseApp.Flags.FFlagAXAddPlusUpsellToBulkPurchase)
local fFlagBulkPurchaseReportCountersModule = require(bulkPurchaseApp.Flags.FFlagBulkPurchaseReportCounters)
local fFlagAXAddOffersToBulkPurchaseModule = require(bulkPurchaseApp.Flags.FFlagAXAddOffersToBulkPurchase)
local convertToDiscountInformationOrNilModule = require(bulkPurchaseApp.Utils.convertToDiscountInformationOrNil)
local AXAddPlusUpsellToBulkPurchaseExposure = game:DefineFastFlag("AXAddPlusUpsellToBulkPurchaseExposure", false)
local AXAddPlusUpsellToBulkPurchaseLayerName = game:DefineFastString("AXAddPlusUpsellToBulkPurchaseLayerName", "AvatarExperience.UA.MarketplaceView")
local _ = require(bulkPurchaseApp.Store.Types)

local function _(p1)
	return p1:gsub("\\u{(%x+)}", function(p2)
		local var1 = tonumber(p2, 16)
		
		return if var1 == nil or var1 < 0 or var1 > 1114111 then "" else utf8.char(var1)
	end)
end

local function getOffersAvailableMap(p1)
	local t = {}
	
	if p1 ~= nil then
		for i, v in p1 do
			t[v.offerId] = v
			
			if v.localizedDescription then
				v.localizedDescription = v.localizedDescription:gsub("\\u{(%x+)}", function(p2)
					local var1 = tonumber(p2, 16)
					
					return if var1 == nil or var1 < 0 or var1 > 1114111 then "" else utf8.char(var1)
				end)
			end
		end
	end
	return t
end

local function transformItemDataToBulkPurchaseItemData(p2)
	-- upvalues: purchasableStateEnumModule (ref), fFlagBulkPurchaseEnablePurchaseOptionsModule (ref)
	local t = {}
	
	for i, v in p2 do
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
	-- upvalues: useDispatch (ref), useNetwork (ref), fFlagAXAddPlusUpsellToBulkPurchaseModule (ref), useSelector (ref), selectPromptStateModule (ref), bulkPurchasePromptStateEnumModule (ref), fFlagAXAddOffersToBulkPurchaseModule (ref), reactModule (ref), marketplaceService (ref), playersService (ref), fFlagBulkPurchaseEnablePurchaseOptionsModule (ref), bulkPurchaseApp (ref), AXAddPlusUpsellToBulkPurchaseExposure (ref), IXPServiceWrapper (ref), AXAddPlusUpsellToBulkPurchaseLayerName (ref), getOffersAvailableMap (ref), initiateBulkPurchaseFlowModule (ref), transformItemDataToBulkPurchaseItemData (ref), convertToDiscountInformationOrNilModule (ref), bulkPurchaseRefreshedModule (ref), fFlagBulkPurchaseReportCountersModule (ref), reportBulkPurchaseRequestCountersModule (ref), bulkPurchaseCountersEnumModule (ref), bulkPurchaseFailedModule (ref), errorCodeEnumModule (ref)
	local var1 = useDispatch()
	local var2 = useNetwork()
	local var3 = if fFlagAXAddPlusUpsellToBulkPurchaseModule then useSelector(selectPromptStateModule) == bulkPurchasePromptStateEnumModule.Request else nil
	
	if fFlagAXAddOffersToBulkPurchaseModule then
		reactModule.useEffect(function()
			-- upvalues: var1 (ref), var2 (ref), marketplaceService (copy), playersService (copy), fFlagBulkPurchaseEnablePurchaseOptionsModule (copy), bulkPurchaseApp (copy), AXAddPlusUpsellToBulkPurchaseExposure (copy), IXPServiceWrapper (copy), AXAddPlusUpsellToBulkPurchaseLayerName (copy), getOffersAvailableMap (copy), initiateBulkPurchaseFlowModule (copy), transformItemDataToBulkPurchaseItemData (copy), convertToDiscountInformationOrNilModule (copy)
			local var4 = nil
			
			if var1 and var2 then
				local ok, status = pcall(function()
					-- upvalues: marketplaceService (copy), playersService (copy), fFlagBulkPurchaseEnablePurchaseOptionsModule (copy), bulkPurchaseApp (copy), AXAddPlusUpsellToBulkPurchaseExposure (copy), IXPServiceWrapper (copy), AXAddPlusUpsellToBulkPurchaseLayerName (copy), getOffersAvailableMap (copy), var1 (copy), initiateBulkPurchaseFlowModule (copy), var2 (copy), transformItemDataToBulkPurchaseItemData (copy), convertToDiscountInformationOrNilModule (copy)
					return marketplaceService.PromptBulkPurchaseRequestedV3:Connect(function(p3, _, p4)
						-- upvalues: playersService (copy), fFlagBulkPurchaseEnablePurchaseOptionsModule (copy), bulkPurchaseApp (copy), AXAddPlusUpsellToBulkPurchaseExposure (copy), IXPServiceWrapper (copy), AXAddPlusUpsellToBulkPurchaseLayerName (copy), getOffersAvailableMap (copy), var1 (copy), initiateBulkPurchaseFlowModule (copy), var2 (copy), transformItemDataToBulkPurchaseItemData (copy), convertToDiscountInformationOrNilModule (copy)
						local orderRequest = p4.orderRequest
						local purchaserRobuxBalance = p4.purchaserRobuxBalance
						local orderTotalRobux = p4.orderTotalRobux
						local options = p4.options
						local discountInformation = p4.discountInformation
						
						if p3 == playersService.LocalPlayer then
							if fFlagBulkPurchaseEnablePurchaseOptionsModule and require(bulkPurchaseApp.Flags.FFlagBulkPurchaseReportsMissingPurchaseOptions) then
								require(bulkPurchaseApp.Utils.reportBulkPurchaseRequestIssues)(p4.displayData)
							end
							if AXAddPlusUpsellToBulkPurchaseExposure then
								IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AXAddPlusUpsellToBulkPurchaseLayerName)
							end
							var1(initiateBulkPurchaseFlowModule(var2, transformItemDataToBulkPurchaseItemData(p4.displayData), orderRequest, purchaserRobuxBalance, orderTotalRobux, options, convertToDiscountInformationOrNilModule(discountInformation), {
								offersAvailable = getOffersAvailableMap(p4.availableOffers),
								savingsSummary = if p4.savingsSummary then p4.savingsSummary:gsub("\\u{(%x+)}", function(p5)
									local var5 = tonumber(p5, 16)
									
									return if var5 == nil or var5 < 0 or var5 > 1114111 then "" else utf8.char(var5)
								end) else nil
							}))
						end
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
					var4 = nil
				end
			end
		end, { var1, var2 })
	else
		reactModule.useEffect(function()
			-- upvalues: var1 (ref), var2 (ref), marketplaceService (copy), playersService (copy), fFlagBulkPurchaseEnablePurchaseOptionsModule (copy), bulkPurchaseApp (copy), AXAddPlusUpsellToBulkPurchaseExposure (copy), IXPServiceWrapper (copy), AXAddPlusUpsellToBulkPurchaseLayerName (copy), initiateBulkPurchaseFlowModule (copy), transformItemDataToBulkPurchaseItemData (copy), convertToDiscountInformationOrNilModule (copy)
			local var4 = if var1 and var2 then marketplaceService.PromptBulkPurchaseRequestedV2:Connect(function(p3, p4, p5, p6, p7, p8, p9)
				-- upvalues: playersService (copy), fFlagBulkPurchaseEnablePurchaseOptionsModule (copy), bulkPurchaseApp (copy), AXAddPlusUpsellToBulkPurchaseExposure (copy), IXPServiceWrapper (copy), AXAddPlusUpsellToBulkPurchaseLayerName (copy), var1 (copy), initiateBulkPurchaseFlowModule (copy), var2 (copy), transformItemDataToBulkPurchaseItemData (copy), convertToDiscountInformationOrNilModule (copy)
				if p3 == playersService.LocalPlayer then
					if fFlagBulkPurchaseEnablePurchaseOptionsModule and require(bulkPurchaseApp.Flags.FFlagBulkPurchaseReportsMissingPurchaseOptions) then
						require(bulkPurchaseApp.Utils.reportBulkPurchaseRequestIssues)(p4)
					end
					if AXAddPlusUpsellToBulkPurchaseExposure then
						IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AXAddPlusUpsellToBulkPurchaseLayerName)
					end
					var1(initiateBulkPurchaseFlowModule(var2, transformItemDataToBulkPurchaseItemData(p4), p5, p6, p7, p8, convertToDiscountInformationOrNilModule(p9)))
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
	end
	if fFlagAXAddPlusUpsellToBulkPurchaseModule then
		reactModule.useEffect(function()
			-- upvalues: var3 (write), marketplaceService (copy), fFlagAXAddOffersToBulkPurchaseModule (copy), getOffersAvailableMap (copy), playersService (copy), var1 (ref), bulkPurchaseRefreshedModule (copy), transformItemDataToBulkPurchaseItemData (copy), convertToDiscountInformationOrNilModule (copy), fFlagBulkPurchaseReportCountersModule (copy), reportBulkPurchaseRequestCountersModule (copy), bulkPurchaseCountersEnumModule (copy), bulkPurchaseFailedModule (copy), errorCodeEnumModule (copy)
			local var4 = nil
			
			if var3 then
				local ok, status = pcall(function()
					-- upvalues: marketplaceService (copy), fFlagAXAddOffersToBulkPurchaseModule (copy), getOffersAvailableMap (copy), playersService (copy), var1 (copy), bulkPurchaseRefreshedModule (copy), transformItemDataToBulkPurchaseItemData (copy), convertToDiscountInformationOrNilModule (copy), fFlagBulkPurchaseReportCountersModule (copy), reportBulkPurchaseRequestCountersModule (copy), bulkPurchaseCountersEnumModule (copy), bulkPurchaseFailedModule (copy), errorCodeEnumModule (copy)
					return marketplaceService.PromptBulkPurchaseRefreshed:Connect(function(p3, p4, p5)
						-- upvalues: fFlagAXAddOffersToBulkPurchaseModule (copy), getOffersAvailableMap (copy), playersService (copy), var1 (copy), bulkPurchaseRefreshedModule (copy), transformItemDataToBulkPurchaseItemData (copy), convertToDiscountInformationOrNilModule (copy), fFlagBulkPurchaseReportCountersModule (copy), reportBulkPurchaseRequestCountersModule (copy), bulkPurchaseCountersEnumModule (copy), bulkPurchaseFailedModule (copy), errorCodeEnumModule (copy)
						local var5 = if fFlagAXAddOffersToBulkPurchaseModule then {
							offersAvailable = getOffersAvailableMap(p5.availableOffers),
							savingsSummary = if p5.savingsSummary then p5.savingsSummary:gsub("\\u{(%x+)}", function(p6)
								local var6 = tonumber(p6, 16)
								
								return if var6 == nil or var6 < 0 or var6 > 1114111 then "" else utf8.char(var6)
							end) else nil
						} else nil
						
						if p3 == playersService.LocalPlayer and p4 == Enum.MarketplaceBulkPurchasePromptStatus.Completed then
							if fFlagAXAddOffersToBulkPurchaseModule then
								var1(bulkPurchaseRefreshedModule(transformItemDataToBulkPurchaseItemData(p5.displayData), p5.orderRequest, p5.purchaserRobuxBalance, p5.orderTotalRobux, p5.options, convertToDiscountInformationOrNilModule(p5.discountInformation), var5))
								
								return
							end
							var1(bulkPurchaseRefreshedModule(transformItemDataToBulkPurchaseItemData(p5.displayData), p5.orderRequest, p5.purchaserRobuxBalance, p5.orderTotalRobux, p5.options, convertToDiscountInformationOrNilModule(p5.discountInformation)))
							
							return
						elseif fFlagBulkPurchaseReportCountersModule then
							reportBulkPurchaseRequestCountersModule(bulkPurchaseCountersEnumModule.BulkPurchaseRefreshFailedCounter)
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