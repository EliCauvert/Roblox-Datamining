local Parent = script.Parent.Parent
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local CompleteRequestModule = require(Parent.Actions.CompleteRequest)
local PromptStateModule = require(Parent.Enums.PromptState)
local RequestTypeModule = require(Parent.Enums.RequestType)
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local SelectedRobuxPackageModule = require(Parent.Utils.SelectedRobuxPackage)
local CounterModule = require(Parent.Enums.Counter)
local SendCounterModule = require(Parent.Thunks.sendCounter)
local AnalyticsModule = require(Parent.Services.Analytics)
local PublicBindablesModule = require(Parent.Services.PublicBindables)
local ThunkModule = require(Parent.Thunk)
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local list = { AnalyticsModule, PublicBindablesModule }

return function() --[[ Line: 30 | Named "completeRequest" ]]
	-- upvalues: ThunkModule (copy), list (copy), AnalyticsModule (copy), SelectedRobuxPackageModule (copy), PromptStateModule (copy), SendCounterModule (copy), CounterModule (copy), RequestTypeModule (copy), Players (copy), MarketplaceService (copy), PurchaseErrorModule (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), PublicBindablesModule (copy), CompleteRequestModule (copy)
	return ThunkModule.new(script.Name, list, function(p1, p2) --[[ Line: 31 ]]
		-- upvalues: AnalyticsModule (upval), SelectedRobuxPackageModule (upval), PromptStateModule (upval), SendCounterModule (upval), CounterModule (upval), RequestTypeModule (upval), Players (upval), MarketplaceService (upval), PurchaseErrorModule (upval), FFlagEnableUnifiedPurchaseFlowForDevSubs (upval), PublicBindablesModule (upval), CompleteRequestModule (upval)
		local v1 = p2[AnalyticsModule]
		local State = p1:getState()
		local RequestType = State.promptRequest.requestType
		local PurchaseError = State.purchaseError
		local Id = State.promptRequest.id
		local HasCompletedPurchase = State.hasCompletedPurchase
		local RobuxProductId = SelectedRobuxPackageModule.getRobuxProductId(State)
		local ProductId = State.productInfo and State.productInfo.productId
		
		if State.promptState == PromptStateModule.U13PaymentModal then
			v1.signalScaryModalCanceled(ProductId, "U13PaymentModal", RobuxProductId)
		elseif State.promptState == PromptStateModule.U13MonthlyThreshold1Modal then
			v1.signalScaryModalCanceled(ProductId, "U13MonthlyThreshold1Modal", RobuxProductId)
		elseif State.promptState == PromptStateModule.U13MonthlyThreshold2Modal then
			v1.signalScaryModalCanceled(ProductId, "U13MonthlyThreshold2Modal", RobuxProductId)
		elseif State.promptState == PromptStateModule.ParentalConsentWarningPaymentModal13To17 then
			v1.signalScaryModalCanceled(ProductId, "ParentalConsentWarningPaymentModal13To17", RobuxProductId)
		end
		if State.promptState == PromptStateModule.PurchaseComplete then
			p1:dispatch(SendCounterModule(CounterModule.Success))
		elseif State.promptState == PromptStateModule.Error then
			p1:dispatch(SendCounterModule(CounterModule.Failed))
		else
			p1:dispatch(SendCounterModule(CounterModule.Cancelled))
		end
		if RequestType == RequestTypeModule.Product then
			MarketplaceService:SignalPromptProductPurchaseFinished(Players.LocalPlayer.UserId, Id, HasCompletedPurchase)
		elseif RequestType == RequestTypeModule.GamePass then
			MarketplaceService:SignalPromptGamePassPurchaseFinished(Players.LocalPlayer, Id, HasCompletedPurchase)
		elseif RequestType == RequestTypeModule.Bundle then
			MarketplaceService:SignalPromptBundlePurchaseFinished(Players.LocalPlayer, Id, HasCompletedPurchase)
		elseif RequestType == RequestTypeModule.Asset then
			MarketplaceService:SignalPromptPurchaseFinished(Players.LocalPlayer, Id, HasCompletedPurchase)
			local AssetTypeId = State.productInfo.assetTypeId
			
			if HasCompletedPurchase and AssetTypeId then
				pcall(function() --[[ Line: 74 ]]
					-- upvalues: MarketplaceService (upval), Players (upval), AssetTypeId (copy)
					MarketplaceService:SignalAssetTypePurchased(Players.LocalPlayer, AssetTypeId)
				end)
			end
		elseif RequestType == RequestTypeModule.Premium then
			MarketplaceService:SignalPromptPremiumPurchaseFinished(HasCompletedPurchase or PurchaseError == PurchaseErrorModule.AlreadyPremium)
		elseif RequestType == RequestTypeModule.Subscription then
			MarketplaceService:SignalPromptSubscriptionPurchaseFinished(Id, HasCompletedPurchase or PurchaseError == PurchaseErrorModule.AlreadySubscribed)
		elseif FFlagEnableUnifiedPurchaseFlowForDevSubs and RequestType == RequestTypeModule.DeveloperSubscription then
			MarketplaceService:SignalPromptSubscriptionPurchaseFinished(State.promptRequest.subscriptionId, HasCompletedPurchase or PurchaseError == PurchaseErrorModule.AlreadySubscribed)
		end
		local WindowStateChangedBindable = p2[PublicBindablesModule].getWindowStateChangedBindable()
		
		if WindowStateChangedBindable then
			WindowStateChangedBindable:Fire({
				isShown = false,
				hasCompletedPurchase = HasCompletedPurchase
			})
		end
		if State.purchaseCallbacks.onFlowComplete then
			State.purchaseCallbacks.onFlowComplete()
		end
		return p1:dispatch(CompleteRequestModule())
	end)
end