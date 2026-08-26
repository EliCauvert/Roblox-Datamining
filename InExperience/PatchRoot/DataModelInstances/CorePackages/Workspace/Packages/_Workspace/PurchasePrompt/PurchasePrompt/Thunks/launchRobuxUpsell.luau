local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local playersService = game:GetService("Players")
local errorOccurredModule = require(purchasePrompt.Actions.ErrorOccurred)
local setPromptStateModule = require(purchasePrompt.Actions.SetPromptState)
local upsellFlowModule = require(purchasePrompt.Enums.UpsellFlow)
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local _ = require(purchasePrompt.Enums.PurchaseFlow)
local getUpsellFlowModule = require(purchasePrompt.NativeUpsell.getUpsellFlow)
local constantsModule = require(purchasePrompt.Misc.Constants)
local postPurchaseWarningAcknowledgeModule = require(purchasePrompt.Network.postPurchaseWarningAcknowledge)
local analyticsModule = require(purchasePrompt.Services.Analytics)
local externalSettingsModule = require(purchasePrompt.Services.ExternalSettings)
local networkModule = require(purchasePrompt.Services.Network)
local platformInterfaceModule = require(purchasePrompt.Services.PlatformInterface)
local thunkModule = require(purchasePrompt.Thunk)
local promiseModule = require(purchasePrompt.Promise)
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local getFStringVNGWebshopUrl = require(parent.SharedFlags).GetFStringVNGWebshopUrl
local retryAfterUpsellModule = require(script.Parent.retryAfterUpsell)
local IAPExperienceModule = require(parent.IAPExperience)
local preparePaymentCheck = IAPExperienceModule.PreparePaymentCheck
local getEnableConsolePreparePaymentCheck = IAPExperienceModule.GetEnableConsolePreparePaymentCheck
local selectedRobuxPackageModule = require(purchasePrompt.Utils.SelectedRobuxPackage)
local desktopUpsellExperiment = IAPExperienceModule.Utility.DesktopUpsellExperiment
local list = {
	analyticsModule,
	externalSettingsModule,
	networkModule,
	platformInterfaceModule
}

return function()
	-- upvalues: thunkModule (ref), list (ref), analyticsModule (ref), externalSettingsModule (ref), networkModule (ref), platformInterfaceModule (ref), getUpsellFlowModule (ref), upsellFlowModule (ref), selectedRobuxPackageModule (ref), getEnableConsolePreparePaymentCheck (ref), preparePaymentCheck (ref), errorOccurredModule (ref), purchaseErrorModule (ref), promptStateModule (ref), postPurchaseWarningAcknowledgeModule (ref), getAppFeaturePolicies (ref), setPromptStateModule (ref), getFStringVNGWebshopUrl (ref), desktopUpsellExperiment (ref), playersService (ref), promiseModule (ref), constantsModule (ref), retryAfterUpsellModule (ref)
	return thunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: analyticsModule (copy), externalSettingsModule (copy), networkModule (copy), platformInterfaceModule (copy), getUpsellFlowModule (copy), upsellFlowModule (copy), selectedRobuxPackageModule (copy), getEnableConsolePreparePaymentCheck (copy), preparePaymentCheck (copy), errorOccurredModule (copy), purchaseErrorModule (copy), promptStateModule (copy), postPurchaseWarningAcknowledgeModule (copy), getAppFeaturePolicies (copy), setPromptStateModule (copy), getFStringVNGWebshopUrl (copy), desktopUpsellExperiment (copy), playersService (copy), promiseModule (copy), constantsModule (copy), retryAfterUpsellModule (copy)
		local var1 = p2[analyticsModule]
		local var2 = p2[externalSettingsModule]
		local var3 = p2[networkModule]
		local var4 = p2[platformInterfaceModule]
		local state = p1:getState()
		local var5 = getUpsellFlowModule(var2.getPlatform())
		local var6 = var5 ~= upsellFlowModule.Web and selectedRobuxPackageModule.getRobuxProductId(state)
		local productId = state.productInfo.productId
		
		if getEnableConsolePreparePaymentCheck() and not preparePaymentCheck(var6) then
			p1:dispatch(errorOccurredModule(purchaseErrorModule.NotEnoughRobuxNoUpsell))
			
			return
		elseif state.promptState == promptStateModule.U13PaymentModal then
			var1.signalScaryModalConfirmed(productId, "U13PaymentModal", var6)
		elseif state.promptState == promptStateModule.U13MonthlyThreshold1Modal then
			var1.signalScaryModalConfirmed(productId, "U13MonthlyThreshold1Modal", var6)
		elseif state.promptState == promptStateModule.U13MonthlyThreshold2Modal then
			var1.signalScaryModalConfirmed(productId, "U13MonthlyThreshold2Modal", var6)
		elseif state.promptState == promptStateModule.ParentalConsentWarningPaymentModal13To17 then
			var1.signalScaryModalConfirmed(productId, "ConfirmedParentalConsentWarningPaymentModal13To17", var6)
		end
		if state.promptState == promptStateModule.U13PaymentModal then
			postPurchaseWarningAcknowledgeModule.Post(var3, postPurchaseWarningAcknowledgeModule.UserActionType.ConfirmedU13PaymentModal)
		elseif state.promptState == promptStateModule.U13MonthlyThreshold1Modal then
			postPurchaseWarningAcknowledgeModule.Post(var3, postPurchaseWarningAcknowledgeModule.UserActionType.ConfirmedU13MonthlyThreshold1Modal)
		elseif state.promptState == promptStateModule.U13MonthlyThreshold2Modal then
			postPurchaseWarningAcknowledgeModule.Post(var3, postPurchaseWarningAcknowledgeModule.UserActionType.ConfirmedU13MonthlyThreshold2Modal)
		elseif state.promptState == promptStateModule.ParentalConsentWarningPaymentModal13To17 then
			postPurchaseWarningAcknowledgeModule.Post(var3, postPurchaseWarningAcknowledgeModule.UserActionType.ConfirmedParentalConsentWarningPaymentModal13To17)
		end
		if var2.getFFlagDisableRobuxUpsell() then
			p1:dispatch(errorOccurredModule(purchaseErrorModule.NotEnoughRobuxNoUpsell))
			
			return
		elseif var5 == upsellFlowModule.Web then
			var1.signalProductPurchaseUpsellConfirmed(productId, state.requestType, selectedRobuxPackageModule.getProductId(state))
			
			if getAppFeaturePolicies().getRedirectBuyRobuxToVNG() then
				if state.promptState == promptStateModule.LeaveRobloxWarning then
					var3:getVngShopUrl():andThen(function(p3)
						-- upvalues: var4 (ref), p1 (ref), setPromptStateModule (copy), promptStateModule (copy)
						var4.openVngStore(p3.vngShopRedirectUrl)
						p1:dispatch(setPromptStateModule(promptStateModule.UpsellInProgress))
					end):catch(function()
						-- upvalues: var4 (ref), getFStringVNGWebshopUrl (copy), p1 (ref), setPromptStateModule (copy), promptStateModule (copy)
						var4.openVngStore(getFStringVNGWebshopUrl())
						p1:dispatch(setPromptStateModule(promptStateModule.UpsellInProgress))
					end)
					
					return
				end
				p1:dispatch(setPromptStateModule(promptStateModule.LeaveRobloxWarning))
				
				return
			else
				local t = { analyticId = state.purchaseFlowUUID }
				local variant = desktopUpsellExperiment.getVariant()
				
				if variant == desktopUpsellExperiment.variants.OpenRobuxStore then
					var4.openRobuxStoreWithContext(t, selectedRobuxPackageModule.getProductId(state))
				elseif variant == desktopUpsellExperiment.variants.OpenPaymentsPage then
					var4.openPaymentsPageWithContext(t, selectedRobuxPackageModule.getProductId(state))
				else
					var4.startRobuxUpsellWebByFlowWithContext(t, state.purchaseFlow, selectedRobuxPackageModule.getProductId(state))
				end
				p1:dispatch(setPromptStateModule(promptStateModule.UpsellInProgress))
				
				return
			end
		elseif var5 == upsellFlowModule.Mobile then
			local robuxProductId = selectedRobuxPackageModule.getRobuxProductId(state)
			local localPlayer = playersService.LocalPlayer
			var1.signalProductPurchaseUpsellConfirmed(state.productInfo.productId, state.requestType, robuxProductId)
			
			if game:GetEngineFeature("NativePurchaseWithLocalPlayer") then
				var4.promptNativePurchaseWithLocalPlayer(robuxProductId)
			else
				var4.promptNativePurchase(localPlayer, robuxProductId)
			end
			p1:dispatch(setPromptStateModule(promptStateModule.UpsellInProgress))
			
			return
		elseif var5 == upsellFlowModule.Xbox then
			local robuxProductId = selectedRobuxPackageModule.getRobuxProductId(state)
			local productId_1 = state.productInfo.productId
			local requestType = state.requestType
			var1.signalProductPurchaseUpsellConfirmed(productId_1, requestType, robuxProductId)
			p1:dispatch(setPromptStateModule(promptStateModule.UpsellInProgress))
			
			return promiseModule.new(function(p3, p4)
				-- upvalues: var4 (ref), robuxProductId (ref)
				local var7 = nil
				local _ = nil
				local _ = nil
				local ok, status = pcall(function()
					-- upvalues: var7 (write), var4 (copy), robuxProductId (copy)
					var7 = var4.beginPlatformStorePurchase(robuxProductId)
				end)
				
				if ok then
					p3(var7)
				else
					p4(status)
				end
			end):andThen(function(p3)
				-- upvalues: constantsModule (copy), var1 (ref), productId_1 (ref), requestType (ref), robuxProductId (ref), p1 (ref), retryAfterUpsellModule (copy), errorOccurredModule (copy), purchaseErrorModule (copy)
				if p3 == constantsModule.PlatformPurchaseResult.PurchaseResult_Success then
					var1.signalXboxInGamePurchaseSuccess(productId_1, requestType, robuxProductId)
				elseif p3 == constantsModule.PlatformPurchaseResult.PurchaseResult_UserCancelled then
					var1.signalXboxInGamePurchaseCanceled(productId_1, requestType, robuxProductId)
				else
					var1.signalXboxInGamePurchaseFailure(productId_1, requestType, robuxProductId)
				end
				return if p3 == constantsModule.PlatformPurchaseResult.PurchaseResult_Success or p3 == constantsModule.PlatformPurchaseResult.PurchaseResult_RobuxUpdated then p1:dispatch(retryAfterUpsellModule()) else p1:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
			end)
		elseif var5 == upsellFlowModule.Unavailable then
			p1:dispatch(errorOccurredModule(purchaseErrorModule.NotEnoughRobuxNoUpsell))
			
			return
		end
		warn("Need more Robux: platform not supported for Robux purchase")
	end)
end