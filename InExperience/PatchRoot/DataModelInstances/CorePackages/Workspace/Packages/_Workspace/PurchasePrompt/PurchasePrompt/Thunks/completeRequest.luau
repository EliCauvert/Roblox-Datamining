local parent = script.Parent.Parent
local playersService = game:GetService("Players")
local marketplaceService = game:GetService("MarketplaceService")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local completeRequestModule = require(parent.Actions.CompleteRequest)
local promptStateModule = require(parent.Enums.PromptState)
local requestTypeModule = require(parent.Enums.RequestType)
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local selectedRobuxPackageModule = require(parent.Utils.SelectedRobuxPackage)
local counterModule = require(parent.Enums.Counter)
local sendCounterModule = require(parent.Thunks.sendCounter)
local analyticsModule = require(parent.Services.Analytics)
local publicBindablesModule = require(parent.Services.PublicBindables)
local thunkModule = require(parent.Thunk)
local fFlagEnableUnifiedProductPurchaseFlow = require(parent.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(parent.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local list = { analyticsModule, publicBindablesModule }

return function()
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref), selectedRobuxPackageModule (ref), promptStateModule (ref), sendCounterModule (ref), counterModule (ref), requestTypeModule (ref), playersService (ref), marketplaceService (ref), purchaseErrorModule (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), publicBindablesModule (ref), fFlagEnableUnifiedProductPurchaseFlow (ref), completeRequestModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: analyticsModule (copy), selectedRobuxPackageModule (copy), promptStateModule (copy), sendCounterModule (copy), counterModule (copy), requestTypeModule (copy), playersService (copy), marketplaceService (copy), purchaseErrorModule (copy), fFlagEnableUnifiedPurchaseFlowForDevSubs (copy), publicBindablesModule (copy), fFlagEnableUnifiedProductPurchaseFlow (copy), completeRequestModule (copy)
		local var1 = p2[analyticsModule]
		local state = p1:getState()
		local requestType = state.promptRequest.requestType
		local purchaseError = state.purchaseError
		local id = state.promptRequest.id
		local hasCompletedPurchase = state.hasCompletedPurchase
		local robuxProductId = selectedRobuxPackageModule.getRobuxProductId(state)
		local productId = state.productInfo and state.productInfo.productId
		
		if state.promptState == promptStateModule.U13PaymentModal then
			var1.signalScaryModalCanceled(productId, "U13PaymentModal", robuxProductId)
		elseif state.promptState == promptStateModule.U13MonthlyThreshold1Modal then
			var1.signalScaryModalCanceled(productId, "U13MonthlyThreshold1Modal", robuxProductId)
		elseif state.promptState == promptStateModule.U13MonthlyThreshold2Modal then
			var1.signalScaryModalCanceled(productId, "U13MonthlyThreshold2Modal", robuxProductId)
		elseif state.promptState == promptStateModule.ParentalConsentWarningPaymentModal13To17 then
			var1.signalScaryModalCanceled(productId, "ParentalConsentWarningPaymentModal13To17", robuxProductId)
		end
		if state.promptState == promptStateModule.PurchaseComplete then
			p1:dispatch(sendCounterModule(counterModule.Success))
		elseif state.promptState == promptStateModule.Error then
			p1:dispatch(sendCounterModule(counterModule.Failed))
		else
			p1:dispatch(sendCounterModule(counterModule.Cancelled))
		end
		if requestType == requestTypeModule.Product then
			marketplaceService:SignalPromptProductPurchaseFinished(playersService.LocalPlayer.UserId, id, hasCompletedPurchase)
		elseif requestType == requestTypeModule.GamePass then
			marketplaceService:SignalPromptGamePassPurchaseFinished(playersService.LocalPlayer, id, hasCompletedPurchase)
		elseif requestType == requestTypeModule.Bundle then
			marketplaceService:SignalPromptBundlePurchaseFinished(playersService.LocalPlayer, id, hasCompletedPurchase)
		elseif requestType == requestTypeModule.Asset then
			marketplaceService:SignalPromptPurchaseFinished(playersService.LocalPlayer, id, hasCompletedPurchase)
			local assetTypeId = state.productInfo.assetTypeId
			
			if hasCompletedPurchase and assetTypeId then
				pcall(function()
					-- upvalues: marketplaceService (copy), playersService (copy), assetTypeId (ref)
					marketplaceService:SignalAssetTypePurchased(playersService.LocalPlayer, assetTypeId)
				end)
			end
		elseif requestType == requestTypeModule.Premium then
			marketplaceService:SignalPromptPremiumPurchaseFinished(hasCompletedPurchase or purchaseError == purchaseErrorModule.AlreadyPremium)
		elseif requestType == requestTypeModule.Subscription then
			marketplaceService:SignalPromptSubscriptionPurchaseFinished(id, hasCompletedPurchase or purchaseError == purchaseErrorModule.AlreadySubscribed)
		elseif fFlagEnableUnifiedPurchaseFlowForDevSubs and requestType == requestTypeModule.DeveloperSubscription then
			marketplaceService:SignalPromptSubscriptionPurchaseFinished(state.promptRequest.subscriptionId, hasCompletedPurchase or purchaseError == purchaseErrorModule.AlreadySubscribed)
		end
		local windowStateChangedBindable = p2[publicBindablesModule].getWindowStateChangedBindable()
		
		if windowStateChangedBindable then
			windowStateChangedBindable:Fire({
				isShown = false,
				hasCompletedPurchase = hasCompletedPurchase
			})
		end
		if fFlagEnableUnifiedProductPurchaseFlow and state.purchaseCallbacks.onFlowComplete then
			state.purchaseCallbacks.onFlowComplete()
		end
		return p1:dispatch(completeRequestModule())
	end)
end