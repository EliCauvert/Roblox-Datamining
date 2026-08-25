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
	return thunkModule.new(script.Name, list, function(p0, p1)
		-- upvalues: analyticsModule (copy), externalSettingsModule (copy), networkModule (copy), platformInterfaceModule (copy), getUpsellFlowModule (copy), upsellFlowModule (copy), selectedRobuxPackageModule (copy), getEnableConsolePreparePaymentCheck (copy), preparePaymentCheck (copy), errorOccurredModule (copy), purchaseErrorModule (copy), promptStateModule (copy), postPurchaseWarningAcknowledgeModule (copy), getAppFeaturePolicies (copy), setPromptStateModule (copy), getFStringVNGWebshopUrl (copy), desktopUpsellExperiment (copy), playersService (copy), promiseModule (copy), constantsModule (copy), retryAfterUpsellModule (copy)
		local var20 = p1[analyticsModule]
		local var21 = p1[externalSettingsModule]
		local var22 = p1[networkModule]
		local var23 = p1[platformInterfaceModule]
		local state = p0:getState()
		local var25 = getUpsellFlowModule(var21.getPlatform())
		local var26 = var25 ~= upsellFlowModule.Web and selectedRobuxPackageModule.getRobuxProductId(state)
		local productId = state.productInfo.productId
		
		if getEnableConsolePreparePaymentCheck() and not preparePaymentCheck(var26) then
			p0:dispatch(errorOccurredModule(purchaseErrorModule.NotEnoughRobuxNoUpsell))
			
			return
		elseif state.promptState == promptStateModule.U13PaymentModal then
			var20.signalScaryModalConfirmed(productId, "U13PaymentModal", var26)
		elseif state.promptState == promptStateModule.U13MonthlyThreshold1Modal then
			var20.signalScaryModalConfirmed(productId, "U13MonthlyThreshold1Modal", var26)
		elseif state.promptState == promptStateModule.U13MonthlyThreshold2Modal then
			var20.signalScaryModalConfirmed(productId, "U13MonthlyThreshold2Modal", var26)
		elseif state.promptState == promptStateModule.ParentalConsentWarningPaymentModal13To17 then
			var20.signalScaryModalConfirmed(productId, "ConfirmedParentalConsentWarningPaymentModal13To17", var26)
		end
		if state.promptState == promptStateModule.U13PaymentModal then
			postPurchaseWarningAcknowledgeModule.Post(var22, postPurchaseWarningAcknowledgeModule.UserActionType.ConfirmedU13PaymentModal)
		elseif state.promptState == promptStateModule.U13MonthlyThreshold1Modal then
			postPurchaseWarningAcknowledgeModule.Post(var22, postPurchaseWarningAcknowledgeModule.UserActionType.ConfirmedU13MonthlyThreshold1Modal)
		elseif state.promptState == promptStateModule.U13MonthlyThreshold2Modal then
			postPurchaseWarningAcknowledgeModule.Post(var22, postPurchaseWarningAcknowledgeModule.UserActionType.ConfirmedU13MonthlyThreshold2Modal)
		elseif state.promptState == promptStateModule.ParentalConsentWarningPaymentModal13To17 then
			postPurchaseWarningAcknowledgeModule.Post(var22, postPurchaseWarningAcknowledgeModule.UserActionType.ConfirmedParentalConsentWarningPaymentModal13To17)
		end
		if var21.getFFlagDisableRobuxUpsell() then
			p0:dispatch(errorOccurredModule(purchaseErrorModule.NotEnoughRobuxNoUpsell))
			
			return
		elseif var25 == upsellFlowModule.Web then
			var20.signalProductPurchaseUpsellConfirmed(productId, state.requestType, selectedRobuxPackageModule.getProductId(state))
			
			if getAppFeaturePolicies().getRedirectBuyRobuxToVNG() then
				if state.promptState == promptStateModule.LeaveRobloxWarning then
					var22:getVngShopUrl():andThen(function(p2)
						-- upvalues: var23 (ref), p0 (ref), setPromptStateModule (copy), promptStateModule (copy)
						var23.openVngStore(p2.vngShopRedirectUrl)
						p0:dispatch(setPromptStateModule(promptStateModule.UpsellInProgress))
					end):catch(function()
						-- upvalues: var23 (ref), getFStringVNGWebshopUrl (copy), p0 (ref), setPromptStateModule (copy), promptStateModule (copy)
						var23.openVngStore(getFStringVNGWebshopUrl())
						p0:dispatch(setPromptStateModule(promptStateModule.UpsellInProgress))
					end)
					
					return
				end
				p0:dispatch(setPromptStateModule(promptStateModule.LeaveRobloxWarning))
				
				return
			else
				local t = { analyticId = state.purchaseFlowUUID }
				local variant = desktopUpsellExperiment.getVariant()
				
				if variant == desktopUpsellExperiment.variants.OpenRobuxStore then
					var23.openRobuxStoreWithContext(t, selectedRobuxPackageModule.getProductId(state))
				elseif variant == desktopUpsellExperiment.variants.OpenPaymentsPage then
					var23.openPaymentsPageWithContext(t, selectedRobuxPackageModule.getProductId(state))
				else
					var23.startRobuxUpsellWebByFlowWithContext(t, state.purchaseFlow, selectedRobuxPackageModule.getProductId(state))
				end
				p0:dispatch(setPromptStateModule(promptStateModule.UpsellInProgress))
				
				return
			end
		elseif var25 == upsellFlowModule.Mobile then
			local robuxProductId = selectedRobuxPackageModule.getRobuxProductId(state)
			local localPlayer = playersService.LocalPlayer
			var20.signalProductPurchaseUpsellConfirmed(state.productInfo.productId, state.requestType, robuxProductId)
			
			if game:GetEngineFeature("NativePurchaseWithLocalPlayer") then
				var23.promptNativePurchaseWithLocalPlayer(robuxProductId)
			else
				var23.promptNativePurchase(localPlayer, robuxProductId)
			end
			p0:dispatch(setPromptStateModule(promptStateModule.UpsellInProgress))
			
			return
		elseif var25 == upsellFlowModule.Xbox then
			local robuxProductId = selectedRobuxPackageModule.getRobuxProductId(state)
			local productId_1 = state.productInfo.productId
			local requestType = state.requestType
			var20.signalProductPurchaseUpsellConfirmed(productId_1, requestType, robuxProductId)
			p0:dispatch(setPromptStateModule(promptStateModule.UpsellInProgress))
			
			return promiseModule.new(function(p4, p5)
				-- upvalues: var23 (ref), robuxProductId (ref)
				local var31 = nil
				local _ = nil
				local _ = nil
				local ok, status = pcall(function()
					-- upvalues: var31 (write), var23 (copy), robuxProductId (copy)
					var31 = var23.beginPlatformStorePurchase(robuxProductId)
				end)
				
				if ok then
					p4(var31)
				else
					p5(status)
				end
			end):andThen(function(p3)
				-- upvalues: constantsModule (copy), var20 (ref), productId_1 (ref), requestType (ref), robuxProductId (ref), p0 (ref), retryAfterUpsellModule (copy), errorOccurredModule (copy), purchaseErrorModule (copy)
				if p3 == constantsModule.PlatformPurchaseResult.PurchaseResult_Success then
					var20.signalXboxInGamePurchaseSuccess(productId_1, requestType, robuxProductId)
				elseif p3 == constantsModule.PlatformPurchaseResult.PurchaseResult_UserCancelled then
					var20.signalXboxInGamePurchaseCanceled(productId_1, requestType, robuxProductId)
				else
					var20.signalXboxInGamePurchaseFailure(productId_1, requestType, robuxProductId)
				end
				return if p3 == constantsModule.PlatformPurchaseResult.PurchaseResult_Success or p3 == constantsModule.PlatformPurchaseResult.PurchaseResult_RobuxUpdated then p0:dispatch(retryAfterUpsellModule()) else p0:dispatch(errorOccurredModule(purchaseErrorModule.UnknownFailure))
			end)
		elseif var25 == upsellFlowModule.Unavailable then
			p0:dispatch(errorOccurredModule(purchaseErrorModule.NotEnoughRobuxNoUpsell))
			
			return
		end
		warn("Need more Robux: platform not supported for Robux purchase")
	end)
end