local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local Parent = BulkPurchaseApp.Parent
local ReactModule = require(Parent.React)
local IXPServiceWrapper = require(Parent.IXPServiceWrapper).IXPServiceWrapper
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local InitiateBulkPurchaseFlowModule = require(BulkPurchaseApp.Store.Thunks.InitiateBulkPurchaseFlow)
local UseNetworkFunction = require(Parent.EconomyCommonCoreScriptHooks).useNetwork
local _ = require(BulkPurchaseApp.Store.Types)
local PurchasableStateEnumModule = require(BulkPurchaseApp.Enums.PurchasableStateEnum)
local BulkPurchasePromptStateEnumModule = require(BulkPurchaseApp.Enums.BulkPurchasePromptStateEnum)
local SelectPromptStateModule = require(BulkPurchaseApp.Store.Selectors.selectPromptState)
local BulkPurchaseRefreshedModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseRefreshed)
local BulkPurchaseFailedModule = require(BulkPurchaseApp.Store.Actions.BulkPurchaseFailed)
local ErrorCodeEnumModule = require(BulkPurchaseApp.Enums.ErrorCodeEnum)
local BulkPurchaseCountersEnumModule = require(BulkPurchaseApp.Enums.BulkPurchaseCountersEnum)
local ReportBulkPurchaseRequestCountersModule = require(BulkPurchaseApp.Utils.reportBulkPurchaseRequestCounters)
local FFlagBulkPurchaseEnablePurchaseOptionsModule = require(BulkPurchaseApp.Flags.FFlagBulkPurchaseEnablePurchaseOptions)
local FFlagAXAddPlusUpsellToBulkPurchaseModule = require(BulkPurchaseApp.Flags.FFlagAXAddPlusUpsellToBulkPurchase)
local FFlagBulkPurchaseReportCountersModule = require(BulkPurchaseApp.Flags.FFlagBulkPurchaseReportCounters)
local FFlagAXAddOffersToBulkPurchaseModule = require(BulkPurchaseApp.Flags.FFlagAXAddOffersToBulkPurchase)
local ConvertToDiscountInformationOrNilModule = require(BulkPurchaseApp.Utils.convertToDiscountInformationOrNil)
local AXAddPlusUpsellToBulkPurchaseExposure = game:DefineFastFlag("AXAddPlusUpsellToBulkPurchaseExposure", false)
local AXAddPlusUpsellToBulkPurchaseLayerName = game:DefineFastString("AXAddPlusUpsellToBulkPurchaseLayerName", "AvatarExperience.UA.MarketplaceView")
local _ = require(BulkPurchaseApp.Store.Types)

local function _(Text: string): string --[[ Line: 52 | Named "decodeLuauUnicodeEscapes" ]]
	return (Text:gsub("\\u{(%x+)}", function(p1): string --[[ Line: 54 ]]
		local Number: number? = tonumber(p1, 16)
		
		return if Number == nil or Number < 0 or Number > 1114111 then "" else utf8.char(Number)
	end))
end

local function getOffersAvailableMap(AvailableOffers) --[[ Line: 64 ]]
	local t = {}
	
	if AvailableOffers ~= nil then
		for _, availableOffer in AvailableOffers do
			t[availableOffer.offerId] = availableOffer
			
			if availableOffer.localizedDescription then
				availableOffer.localizedDescription = availableOffer.localizedDescription:gsub("\\u{(%x+)}", function(p1): string --[[ Line: 54 ]]
					local Number: number? = tonumber(p1, 16)
					
					return if Number == nil or Number < 0 or Number > 1114111 then "" else utf8.char(Number)
				end)
			end
		end
	end
	return t
end

local function transformItemDataToBulkPurchaseItemData(DisplayData) --[[ Line: 79 ]]
	-- upvalues: PurchasableStateEnumModule (copy), FFlagBulkPurchaseEnablePurchaseOptionsModule (copy)
	local List = {}
	
	for _, value in DisplayData do
		table.insert(List, {
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
	return List
end

return function() --[[ Line: 102 | Named "useBulkPurchaseRequestListenerEffect" ]]
	-- upvalues: UseDispatchFunction (copy), UseNetworkFunction (copy), FFlagAXAddPlusUpsellToBulkPurchaseModule (copy), UseSelectorFunction (copy), SelectPromptStateModule (copy), BulkPurchasePromptStateEnumModule (copy), FFlagAXAddOffersToBulkPurchaseModule (copy), ReactModule (copy), MarketplaceService (copy), Players (copy), FFlagBulkPurchaseEnablePurchaseOptionsModule (copy), BulkPurchaseApp (copy), AXAddPlusUpsellToBulkPurchaseExposure (copy), IXPServiceWrapper (copy), AXAddPlusUpsellToBulkPurchaseLayerName (copy), getOffersAvailableMap (copy), InitiateBulkPurchaseFlowModule (copy), transformItemDataToBulkPurchaseItemData (copy), ConvertToDiscountInformationOrNilModule (copy), BulkPurchaseRefreshedModule (copy), FFlagBulkPurchaseReportCountersModule (copy), ReportBulkPurchaseRequestCountersModule (copy), BulkPurchaseCountersEnumModule (copy), BulkPurchaseFailedModule (copy), ErrorCodeEnumModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNetworkResult = UseNetworkFunction()
	local IsUseSelectorResultMatch = if FFlagAXAddPlusUpsellToBulkPurchaseModule then UseSelectorFunction(SelectPromptStateModule) == BulkPurchasePromptStateEnumModule.Request else nil
	
	if FFlagAXAddOffersToBulkPurchaseModule then
		ReactModule.useEffect(function() --[[ Line: 113 ]]
			-- upvalues: UseDispatchResult (copy), UseNetworkResult (copy), MarketplaceService (upval), Players (upval), FFlagBulkPurchaseEnablePurchaseOptionsModule (upval), BulkPurchaseApp (upval), AXAddPlusUpsellToBulkPurchaseExposure (upval), IXPServiceWrapper (upval), AXAddPlusUpsellToBulkPurchaseLayerName (upval), getOffersAvailableMap (upval), InitiateBulkPurchaseFlowModule (upval), transformItemDataToBulkPurchaseItemData (upval), ConvertToDiscountInformationOrNilModule (upval)
			local Connection = nil
			
			if UseDispatchResult and UseNetworkResult then
				local Success, Result = pcall(function() --[[ Line: 116 ]]
					-- upvalues: MarketplaceService (upval), Players (upval), FFlagBulkPurchaseEnablePurchaseOptionsModule (upval), BulkPurchaseApp (upval), AXAddPlusUpsellToBulkPurchaseExposure (upval), IXPServiceWrapper (upval), AXAddPlusUpsellToBulkPurchaseLayerName (upval), getOffersAvailableMap (upval), UseDispatchResult (upval), InitiateBulkPurchaseFlowModule (upval), UseNetworkResult (upval), transformItemDataToBulkPurchaseItemData (upval), ConvertToDiscountInformationOrNilModule (upval)
					return MarketplaceService.PromptBulkPurchaseRequestedV3:Connect(function(Player, _, Response) --[[ Line: 118 ]]
						-- upvalues: Players (upval), FFlagBulkPurchaseEnablePurchaseOptionsModule (upval), BulkPurchaseApp (upval), AXAddPlusUpsellToBulkPurchaseExposure (upval), IXPServiceWrapper (upval), AXAddPlusUpsellToBulkPurchaseLayerName (upval), getOffersAvailableMap (upval), UseDispatchResult (upval), InitiateBulkPurchaseFlowModule (upval), UseNetworkResult (upval), transformItemDataToBulkPurchaseItemData (upval), ConvertToDiscountInformationOrNilModule (upval)
						local OrderRequest = Response.orderRequest
						local PurchaserRobuxBalance = Response.purchaserRobuxBalance
						local OrderTotalRobux = Response.orderTotalRobux
						local Options = Response.options
						local DiscountInformation = Response.discountInformation
						
						if Player == Players.LocalPlayer then
							if FFlagBulkPurchaseEnablePurchaseOptionsModule and require(BulkPurchaseApp.Flags.FFlagBulkPurchaseReportsMissingPurchaseOptions) then
								require(BulkPurchaseApp.Utils.reportBulkPurchaseRequestIssues)(Response.displayData)
							end
							if AXAddPlusUpsellToBulkPurchaseExposure then
								IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AXAddPlusUpsellToBulkPurchaseLayerName)
							end
							UseDispatchResult(InitiateBulkPurchaseFlowModule(UseNetworkResult, transformItemDataToBulkPurchaseItemData(Response.displayData), OrderRequest, PurchaserRobuxBalance, OrderTotalRobux, Options, ConvertToDiscountInformationOrNilModule(DiscountInformation), {
								offersAvailable = getOffersAvailableMap(Response.availableOffers),
								savingsSummary = if Response.savingsSummary then Response.savingsSummary:gsub("\\u{(%x+)}", function(p1): string --[[ Line: 54 ]]
									local Number: number? = tonumber(p1, 16)
									
									return if Number == nil or Number < 0 or Number > 1114111 then "" else utf8.char(Number)
								end) else nil
							}))
						end
					end)
				end)
				
				if Success then
					Connection = Result
				end
			end
			return function() --[[ Line: 170 ]]
				-- upvalues: Connection (ref)
				if Connection then
					Connection:Disconnect()
					Connection = nil
				end
			end
		end, { UseDispatchResult, UseNetworkResult })
	else
		ReactModule.useEffect(function() --[[ Line: 178 ]]
			-- upvalues: UseDispatchResult (copy), UseNetworkResult (copy), MarketplaceService (upval), Players (upval), FFlagBulkPurchaseEnablePurchaseOptionsModule (upval), BulkPurchaseApp (upval), AXAddPlusUpsellToBulkPurchaseExposure (upval), IXPServiceWrapper (upval), AXAddPlusUpsellToBulkPurchaseLayerName (upval), InitiateBulkPurchaseFlowModule (upval), transformItemDataToBulkPurchaseItemData (upval), ConvertToDiscountInformationOrNilModule (upval)
			local PromptBulkPurchaseRequestedV2Connection = if UseDispatchResult and UseNetworkResult then MarketplaceService.PromptBulkPurchaseRequestedV2:Connect(function(Player, DisplayData, OrderRequest, PurchaserRobuxBalance, OrderTotalRobux, Options, DiscountInformation) --[[ Line: 182 ]]
				-- upvalues: Players (upval), FFlagBulkPurchaseEnablePurchaseOptionsModule (upval), BulkPurchaseApp (upval), AXAddPlusUpsellToBulkPurchaseExposure (upval), IXPServiceWrapper (upval), AXAddPlusUpsellToBulkPurchaseLayerName (upval), UseDispatchResult (upval), InitiateBulkPurchaseFlowModule (upval), UseNetworkResult (upval), transformItemDataToBulkPurchaseItemData (upval), ConvertToDiscountInformationOrNilModule (upval)
				if Player == Players.LocalPlayer then
					if FFlagBulkPurchaseEnablePurchaseOptionsModule and require(BulkPurchaseApp.Flags.FFlagBulkPurchaseReportsMissingPurchaseOptions) then
						require(BulkPurchaseApp.Utils.reportBulkPurchaseRequestIssues)(DisplayData)
					end
					if AXAddPlusUpsellToBulkPurchaseExposure then
						IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AXAddPlusUpsellToBulkPurchaseLayerName)
					end
					UseDispatchResult(InitiateBulkPurchaseFlowModule(UseNetworkResult, transformItemDataToBulkPurchaseItemData(DisplayData), OrderRequest, PurchaserRobuxBalance, OrderTotalRobux, Options, ConvertToDiscountInformationOrNilModule(DiscountInformation)))
				end
			end) else nil
			
			return function() --[[ Line: 223 ]]
				-- upvalues: PromptBulkPurchaseRequestedV2Connection (ref)
				if PromptBulkPurchaseRequestedV2Connection then
					PromptBulkPurchaseRequestedV2Connection:Disconnect()
					PromptBulkPurchaseRequestedV2Connection = nil
				end
			end
		end, { UseDispatchResult, UseNetworkResult })
	end
	if FFlagAXAddPlusUpsellToBulkPurchaseModule then
		ReactModule.useEffect(function() --[[ Line: 233 ]]
			-- upvalues: IsUseSelectorResultMatch (ref), MarketplaceService (upval), FFlagAXAddOffersToBulkPurchaseModule (upval), getOffersAvailableMap (upval), Players (upval), UseDispatchResult (copy), BulkPurchaseRefreshedModule (upval), transformItemDataToBulkPurchaseItemData (upval), ConvertToDiscountInformationOrNilModule (upval), FFlagBulkPurchaseReportCountersModule (upval), ReportBulkPurchaseRequestCountersModule (upval), BulkPurchaseCountersEnumModule (upval), BulkPurchaseFailedModule (upval), ErrorCodeEnumModule (upval)
			local Connection = nil
			
			if IsUseSelectorResultMatch then
				local Success, Result = pcall(function() --[[ Line: 237 ]]
					-- upvalues: MarketplaceService (upval), FFlagAXAddOffersToBulkPurchaseModule (upval), getOffersAvailableMap (upval), Players (upval), UseDispatchResult (upval), BulkPurchaseRefreshedModule (upval), transformItemDataToBulkPurchaseItemData (upval), ConvertToDiscountInformationOrNilModule (upval), FFlagBulkPurchaseReportCountersModule (upval), ReportBulkPurchaseRequestCountersModule (upval), BulkPurchaseCountersEnumModule (upval), BulkPurchaseFailedModule (upval), ErrorCodeEnumModule (upval)
					return MarketplaceService.PromptBulkPurchaseRefreshed:Connect(function(Player, Status, Response) --[[ Line: 239 ]]
						-- upvalues: FFlagAXAddOffersToBulkPurchaseModule (upval), getOffersAvailableMap (upval), Players (upval), UseDispatchResult (upval), BulkPurchaseRefreshedModule (upval), transformItemDataToBulkPurchaseItemData (upval), ConvertToDiscountInformationOrNilModule (upval), FFlagBulkPurchaseReportCountersModule (upval), ReportBulkPurchaseRequestCountersModule (upval), BulkPurchaseCountersEnumModule (upval), BulkPurchaseFailedModule (upval), ErrorCodeEnumModule (upval)
						local Config = if FFlagAXAddOffersToBulkPurchaseModule then {
							offersAvailable = getOffersAvailableMap(Response.availableOffers),
							savingsSummary = if Response.savingsSummary then Response.savingsSummary:gsub("\\u{(%x+)}", function(p1): string --[[ Line: 54 ]]
								local Number: number? = tonumber(p1, 16)
								
								return if Number == nil or Number < 0 or Number > 1114111 then "" else utf8.char(Number)
							end) else nil
						} else nil
						
						if Player ~= Players.LocalPlayer or Status ~= Enum.MarketplaceBulkPurchasePromptStatus.Completed then
							if FFlagBulkPurchaseReportCountersModule then
								ReportBulkPurchaseRequestCountersModule(BulkPurchaseCountersEnumModule.BulkPurchaseRefreshFailedCounter)
							end
							UseDispatchResult(BulkPurchaseFailedModule(ErrorCodeEnumModule.Generic))
							
							return
						elseif FFlagAXAddOffersToBulkPurchaseModule then
							UseDispatchResult(BulkPurchaseRefreshedModule(transformItemDataToBulkPurchaseItemData(Response.displayData), Response.orderRequest, Response.purchaserRobuxBalance, Response.orderTotalRobux, Response.options, ConvertToDiscountInformationOrNilModule(Response.discountInformation), Config))
							
							return
						else
							UseDispatchResult(BulkPurchaseRefreshedModule(transformItemDataToBulkPurchaseItemData(Response.displayData), Response.orderRequest, Response.purchaserRobuxBalance, Response.orderTotalRobux, Response.options, ConvertToDiscountInformationOrNilModule(Response.discountInformation)))
						end
					end)
				end)
				
				if Success then
					Connection = Result
				end
			end
			return function() --[[ Line: 299 ]]
				-- upvalues: Connection (ref)
				if Connection then
					Connection:Disconnect()
				end
			end
		end, { UseDispatchResult, IsUseSelectorResultMatch })
	end
end