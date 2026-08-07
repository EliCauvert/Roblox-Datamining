local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local playersService = game:GetService("Players")
local httpService = game:GetService("HttpService")
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local requestBundlePurchaseModule = require(purchasePrompt.Actions.RequestBundlePurchase)
local setProductPayloadModule = require(purchasePrompt.Actions.SetProductPayload)
local buildProductPayloadFromInitiateArgsModule = require(purchasePrompt.Utils.buildProductPayloadFromInitiateArgs)
local setPurchaseFlowUUIDModule = require(purchasePrompt.Actions.SetPurchaseFlowUUID)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local getBundleDetailsModule = require(purchasePrompt.Network.getBundleDetails)
local getProductPurchasableDetailsModule = require(purchasePrompt.Network.getProductPurchasableDetails)
local getAccountInfoModule = require(purchasePrompt.Network.getAccountInfo)
local getBalanceInfoModule = require(purchasePrompt.Network.getBalanceInfo)
local getIsAlreadyOwnedModule = require(purchasePrompt.Network.getIsAlreadyOwned)
local networkModule = require(purchasePrompt.Services.Network)
local externalSettingsModule = require(purchasePrompt.Services.ExternalSettings)
local hasPendingRequestModule = require(purchasePrompt.Utils.hasPendingRequest)
local promiseModule = require(purchasePrompt.Promise)
local thunkModule = require(purchasePrompt.Thunk)
local _ = require(parent.AppCommonLib).Logging
local loggingProtocolModule = require(parent.LoggingProtocol)
local fFlagEnableUnifiedProductPurchaseFlow = require(purchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local getUnifiedPurchaseFlowEligibilityModule = require(purchasePrompt.Network.getUnifiedPurchaseFlowEligibility)
local fFlagRemoveAcountInfoFetchFromPurchaseModule = require(purchasePrompt.Flags.FFlagRemoveAcountInfoFetchFromPurchase)
local resolveBundlePromptStateModule = require(script.Parent.resolveBundlePromptState)
local fetchCartPricingModule = require(script.Parent.fetchCartPricing)
local fFlagPurchasePromptCartPricingEnabledModule = require(purchasePrompt.Flags.FFlagPurchasePromptCartPricingEnabled)

local function _(p0) --[[ line: 36 | named "maybeDispatchCartPricingFetch" ]]
	-- upvalues: fFlagPurchasePromptCartPricingEnabledModule (ref), fetchCartPricingModule (ref)
	if fFlagPurchasePromptCartPricingEnabledModule then
		p0:dispatch(fetchCartPricingModule())
	end
end

local fFlagEnablePurchaseFlowUUIDMigrationModule = require(purchasePrompt.Flags.FFlagEnablePurchaseFlowUUIDMigration)
local fFlagUnifiedPurchaseOptimizeTTIMarketplace = require(purchasePrompt.Parent.SharedFlags).FFlagUnifiedPurchaseOptimizeTTIMarketplace
local fFlagRefreshPriceOnRetryAfterUpsellModule = require(purchasePrompt.Flags.FFlagRefreshPriceOnRetryAfterUpsell)
local var27 = if fFlagRefreshPriceOnRetryAfterUpsellModule then require(purchasePrompt.Utils.applyRefreshedPrice) else nil
local getRobloxSubscriptionProducts = require(parent.RobloxSubscriptionPurchaseApp).Network.getRobloxSubscriptionProducts
local fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal = require(purchasePrompt.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal
local purchaseFlowUUIDTelemetryModule = require(purchasePrompt.Events.PurchaseFlowUUIDTelemetry)
local list = { networkModule, externalSettingsModule }

return function(p1, p2, p3, p4, p5, p6, p7, p8) --[[ line: 63 | named "initiateBundlePurchase" ]]
	-- upvalues: thunkModule (ref), list (ref), networkModule (ref), externalSettingsModule (ref), hasPendingRequestModule (ref), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (ref), buildProductPayloadFromInitiateArgsModule (ref), setProductPayloadModule (ref), fFlagEnablePurchaseFlowUUIDMigrationModule (ref), httpService (ref), setPurchaseFlowUUIDModule (ref), loggingProtocolModule (ref), purchaseFlowUUIDTelemetryModule (ref), requestBundlePurchaseModule (ref), errorOccurredModule (ref), purchaseErrorModule (ref), fFlagUnifiedPurchaseOptimizeTTIMarketplace (ref), fFlagRefreshPriceOnRetryAfterUpsellModule (ref), promiseModule (ref), getBundleDetailsModule (ref), fFlagRemoveAcountInfoFetchFromPurchaseModule (ref), playersService (ref), getAccountInfoModule (ref), getBalanceInfoModule (ref), getIsAlreadyOwnedModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), getUnifiedPurchaseFlowEligibilityModule (ref), getRobloxSubscriptionProducts (ref), var27 (ref), resolveBundlePromptStateModule (ref), fFlagPurchasePromptCartPricingEnabledModule (ref), fetchCartPricingModule (ref), getProductPurchasableDetailsModule (ref)
	return thunkModule.new(script.Name, list, function(p9, p10) --[[ line: 73 ]]
		-- upvalues: networkModule (copy), externalSettingsModule (copy), hasPendingRequestModule (copy), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), p8 (ref), buildProductPayloadFromInitiateArgsModule (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref), p7 (ref), setProductPayloadModule (copy), fFlagEnablePurchaseFlowUUIDMigrationModule (copy), httpService (copy), setPurchaseFlowUUIDModule (copy), loggingProtocolModule (copy), purchaseFlowUUIDTelemetryModule (copy), requestBundlePurchaseModule (copy), errorOccurredModule (copy), purchaseErrorModule (copy), fFlagUnifiedPurchaseOptimizeTTIMarketplace (copy), fFlagRefreshPriceOnRetryAfterUpsellModule (copy), promiseModule (copy), getBundleDetailsModule (copy), fFlagRemoveAcountInfoFetchFromPurchaseModule (copy), playersService (copy), getAccountInfoModule (copy), getBalanceInfoModule (copy), getIsAlreadyOwnedModule (copy), fFlagEnableUnifiedProductPurchaseFlow (copy), getUnifiedPurchaseFlowEligibilityModule (copy), getRobloxSubscriptionProducts (copy), var27 (copy), resolveBundlePromptStateModule (copy), fFlagPurchasePromptCartPricingEnabledModule (copy), fetchCartPricingModule (copy), getProductPurchasableDetailsModule (copy)
		local productPayload
		local var30 = p10[networkModule]
		local var31 = p10[externalSettingsModule]
		
		if hasPendingRequestModule(p9:getState()) and (not fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal or not p8) then
			return nil
		elseif fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then
			productPayload = p9:getState().productPayload
			
			if not productPayload or not productPayload.kind then
				local var32 = buildProductPayloadFromInitiateArgsModule(p1, Enum.InfoType.Bundle, nil, nil, p2, p3, p4, p5, p6, p7, nil)
				
				if var32 then
					p9:dispatch(setProductPayloadModule(var32))
				end
			end
		end
		if fFlagEnablePurchaseFlowUUIDMigrationModule then
			p9:dispatch(setPurchaseFlowUUIDModule(httpService:GenerateGUID(false)))
			loggingProtocolModule.default:logRobloxTelemetryCounter(purchaseFlowUUIDTelemetryModule.InitiatePurchaseCounter, 1, { method = "initiateBundlePurchase" })
		end
		p9:dispatch(requestBundlePurchaseModule(p1, p2, p3, p4, p5, p6, p7))
		
		if var31.getFlagOrder66() then
			p9:dispatch(errorOccurredModule(purchaseErrorModule.PurchaseDisabled))
			
			return nil
		end
		productPayload = nil
		local providedRobuxBalance = nil
		local fetchProductInfo = nil
		
		if fFlagUnifiedPurchaseOptimizeTTIMarketplace then
			local state = p9:getState()
			local purchaseOptions = state.purchaseOptions
			local purchaseCallbacks = state.purchaseCallbacks
			
			if purchaseOptions ~= nil and purchaseOptions.shouldSkipOwnershipCheck == true then
				productPayload = true
			end
			if purchaseOptions ~= nil and purchaseOptions.providedRobuxBalance ~= nil then
				providedRobuxBalance = purchaseOptions.providedRobuxBalance
			end
			if purchaseCallbacks ~= nil and purchaseCallbacks.fetchProductInfo ~= nil then
				fetchProductInfo = purchaseCallbacks.fetchProductInfo
			end
		end
		local t = nil
		
		if fFlagRefreshPriceOnRetryAfterUpsellModule and p8 then
			local productPayload_1 = p9:getState().productPayload
			t = {
				collectibleItemId = p4,
				collectibleItemInstanceId = p5,
				timedOptionDays = if productPayload_1 then productPayload_1.timedOptionDays else nil
			}
		end
		return promiseModule.all({
			bundleDetails = if fFlagUnifiedPurchaseOptimizeTTIMarketplace and fetchProductInfo ~= nil and (not fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal or not p8) then fetchProductInfo() else getBundleDetailsModule(var30, p1, if fFlagRefreshPriceOnRetryAfterUpsellModule then t else nil),
			accountInfo = if fFlagRemoveAcountInfoFetchFromPurchaseModule then promiseModule.resolve({
				isPremium = playersService.LocalPlayer.MembershipType == Enum.MembershipType.Premium
			}) else getAccountInfoModule(var30, var31),
			balanceInfo = getBalanceInfoModule(var30, var31, false, nil, if fFlagUnifiedPurchaseOptimizeTTIMarketplace then providedRobuxBalance else nil),
			alreadyOwned = getIsAlreadyOwnedModule(var30, p1, Enum.InfoType.Bundle, if fFlagUnifiedPurchaseOptimizeTTIMarketplace then productPayload else nil),
			isUserEligibleForUnifiedPurchaseFlow = if fFlagEnableUnifiedProductPurchaseFlow then getUnifiedPurchaseFlowEligibilityModule(var30) else nil,
			robloxSubscriptionProducts = if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then getRobloxSubscriptionProducts(var30):catch(function() --[[ line: 196 ]]
				return nil
			end) else nil
		}):andThen(function(p12) --[[ line: 201 ]]
			-- upvalues: p7 (copy), fFlagRefreshPriceOnRetryAfterUpsellModule (copy), p8 (copy), var27 (copy), p9 (ref), fFlagUnifiedPurchaseOptimizeTTIMarketplace (copy), resolveBundlePromptStateModule (copy), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), fFlagPurchasePromptCartPricingEnabledModule (copy), fetchCartPricingModule (copy), getProductPurchasableDetailsModule (copy), var30 (ref), errorOccurredModule (copy), purchaseErrorModule (copy)
			local var35 = p7
			
			if fFlagRefreshPriceOnRetryAfterUpsellModule and p8 then
				local refreshedExpectedPrice = p12.bundleDetails.refreshedExpectedPrice
				
				if refreshedExpectedPrice ~= nil then
					var35 = refreshedExpectedPrice
					var27(p9, refreshedExpectedPrice)
				end
			end
			if p12.bundleDetails.product then
				if fFlagUnifiedPurchaseOptimizeTTIMarketplace then
					p9:dispatch(resolveBundlePromptStateModule(nil, p12.bundleDetails, p12.accountInfo, p12.balanceInfo, var35, p12.alreadyOwned, p12.isUserEligibleForUnifiedPurchaseFlow, if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then p12.robloxSubscriptionProducts else nil))
					local var36 = p9
					
					if fFlagPurchasePromptCartPricingEnabledModule then
						var36:dispatch(fetchCartPricingModule())
					end
					return
				else
					getProductPurchasableDetailsModule(var30, p12.bundleDetails.product.id):andThen(function(p13) --[[ line: 232 ]]
						-- upvalues: p9 (copy), resolveBundlePromptStateModule (copy), p12 (ref), var35 (write), fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), fFlagPurchasePromptCartPricingEnabledModule (copy), fetchCartPricingModule (copy)
						p9:dispatch(resolveBundlePromptStateModule(p13, p12.bundleDetails, p12.accountInfo, p12.balanceInfo, var35, p12.alreadyOwned, p12.isUserEligibleForUnifiedPurchaseFlow, if fFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then p12.robloxSubscriptionProducts else nil))
						
						if fFlagPurchasePromptCartPricingEnabledModule then
							p9:dispatch(fetchCartPricingModule())
						end
					end)
				end
			else
				p9:dispatch(errorOccurredModule(purchaseErrorModule.NotForSale))
			end
		end):catch(function(p11) --[[ line: 254 ]]
			-- upvalues: p9 (ref), errorOccurredModule (copy)
			p9:dispatch(errorOccurredModule(p11))
		end)
	end)
end