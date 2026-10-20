local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local Players = game:GetService("Players")
local ErrorOccurredModule = require(PurchasePrompt.Actions.ErrorOccurred)
local SetPromptStateModule = require(PurchasePrompt.Actions.SetPromptState)
local UpsellFlowModule = require(PurchasePrompt.Enums.UpsellFlow)
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local _ = require(PurchasePrompt.Enums.PurchaseFlow)
local GetUpsellFlowModule = require(PurchasePrompt.NativeUpsell.getUpsellFlow)
local ConstantsModule = require(PurchasePrompt.Misc.Constants)
local PostPurchaseWarningAcknowledgeModule = require(PurchasePrompt.Network.postPurchaseWarningAcknowledge)
local AnalyticsModule = require(PurchasePrompt.Services.Analytics)
local ExternalSettingsModule = require(PurchasePrompt.Services.ExternalSettings)
local NetworkModule = require(PurchasePrompt.Services.Network)
local PlatformInterfaceModule = require(PurchasePrompt.Services.PlatformInterface)
local ThunkModule = require(PurchasePrompt.Thunk)
local PromiseModule = require(PurchasePrompt.Promise)
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local GetFStringVNGWebshopUrlFunction = require(Parent.SharedFlags).GetFStringVNGWebshopUrl
local RetryAfterUpsellModule = require(script.Parent.retryAfterUpsell)
local IAPExperienceModule = require(Parent.IAPExperience)
local PreparePaymentCheckFunction = IAPExperienceModule.PreparePaymentCheck
local GetEnableConsolePreparePaymentCheckFunction = IAPExperienceModule.GetEnableConsolePreparePaymentCheck
local SelectedRobuxPackageModule = require(PurchasePrompt.Utils.SelectedRobuxPackage)
local DesktopUpsellExperiment = IAPExperienceModule.Utility.DesktopUpsellExperiment
local list = {
	AnalyticsModule,
	ExternalSettingsModule,
	NetworkModule,
	PlatformInterfaceModule
}

return function()
	-- upvalues: ThunkModule (copy), list (copy), AnalyticsModule (copy), ExternalSettingsModule (copy), NetworkModule (copy), PlatformInterfaceModule (copy), GetUpsellFlowModule (copy), UpsellFlowModule (copy), SelectedRobuxPackageModule (copy), GetEnableConsolePreparePaymentCheckFunction (copy), PreparePaymentCheckFunction (copy), ErrorOccurredModule (copy), PurchaseErrorModule (copy), PromptStateModule (copy), PostPurchaseWarningAcknowledgeModule (copy), GetAppFeaturePoliciesFunction (copy), SetPromptStateModule (copy), GetFStringVNGWebshopUrlFunction (copy), DesktopUpsellExperiment (copy), Players (copy), PromiseModule (copy), ConstantsModule (copy), RetryAfterUpsellModule (copy)
	return ThunkModule.new(script.Name, list, function(p1, p2)
		-- upvalues: AnalyticsModule (upval), ExternalSettingsModule (upval), NetworkModule (upval), PlatformInterfaceModule (upval), GetUpsellFlowModule (upval), UpsellFlowModule (upval), SelectedRobuxPackageModule (upval), GetEnableConsolePreparePaymentCheckFunction (upval), PreparePaymentCheckFunction (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval), PromptStateModule (upval), PostPurchaseWarningAcknowledgeModule (upval), GetAppFeaturePoliciesFunction (upval), SetPromptStateModule (upval), GetFStringVNGWebshopUrlFunction (upval), DesktopUpsellExperiment (upval), Players (upval), PromiseModule (upval), ConstantsModule (upval), RetryAfterUpsellModule (upval)
		local v1 = p2[AnalyticsModule]
		local v2 = p2[ExternalSettingsModule]
		local v3 = p2[NetworkModule]
		local v4 = p2[PlatformInterfaceModule]
		local State = p1:getState()
		local UpsellFlowModule1 = GetUpsellFlowModule(v2.getPlatform())
		local RobuxProductId = UpsellFlowModule1 ~= UpsellFlowModule.Web and SelectedRobuxPackageModule.getRobuxProductId(State)
		local ProductId = State.productInfo.productId
		
		if GetEnableConsolePreparePaymentCheckFunction() and not PreparePaymentCheckFunction(RobuxProductId) then
			p1:dispatch(ErrorOccurredModule(PurchaseErrorModule.NotEnoughRobuxNoUpsell))
			
			return
		end
		if State.promptState == PromptStateModule.U13PaymentModal then
			v1.signalScaryModalConfirmed(ProductId, "U13PaymentModal", RobuxProductId)
		elseif State.promptState == PromptStateModule.U13MonthlyThreshold1Modal then
			v1.signalScaryModalConfirmed(ProductId, "U13MonthlyThreshold1Modal", RobuxProductId)
		elseif State.promptState == PromptStateModule.U13MonthlyThreshold2Modal then
			v1.signalScaryModalConfirmed(ProductId, "U13MonthlyThreshold2Modal", RobuxProductId)
		elseif State.promptState == PromptStateModule.ParentalConsentWarningPaymentModal13To17 then
			v1.signalScaryModalConfirmed(ProductId, "ConfirmedParentalConsentWarningPaymentModal13To17", RobuxProductId)
		end
		if State.promptState == PromptStateModule.U13PaymentModal then
			PostPurchaseWarningAcknowledgeModule.Post(v3, PostPurchaseWarningAcknowledgeModule.UserActionType.ConfirmedU13PaymentModal)
		elseif State.promptState == PromptStateModule.U13MonthlyThreshold1Modal then
			PostPurchaseWarningAcknowledgeModule.Post(v3, PostPurchaseWarningAcknowledgeModule.UserActionType.ConfirmedU13MonthlyThreshold1Modal)
		elseif State.promptState == PromptStateModule.U13MonthlyThreshold2Modal then
			PostPurchaseWarningAcknowledgeModule.Post(v3, PostPurchaseWarningAcknowledgeModule.UserActionType.ConfirmedU13MonthlyThreshold2Modal)
		elseif State.promptState == PromptStateModule.ParentalConsentWarningPaymentModal13To17 then
			PostPurchaseWarningAcknowledgeModule.Post(v3, PostPurchaseWarningAcknowledgeModule.UserActionType.ConfirmedParentalConsentWarningPaymentModal13To17)
		end
		if v2.getFFlagDisableRobuxUpsell() then
			p1:dispatch(ErrorOccurredModule(PurchaseErrorModule.NotEnoughRobuxNoUpsell))
			
			return
		end
		if UpsellFlowModule1 == UpsellFlowModule.Web then
			v1.signalProductPurchaseUpsellConfirmed(ProductId, State.requestType, SelectedRobuxPackageModule.getProductId(State))
			
			if not GetAppFeaturePoliciesFunction().getRedirectBuyRobuxToVNG() then
				local config = { analyticId = State.purchaseFlowUUID }
				local Variant = DesktopUpsellExperiment.getVariant()
				
				if Variant == DesktopUpsellExperiment.variants.OpenRobuxStore then
					v4.openRobuxStoreWithContext(config, SelectedRobuxPackageModule.getProductId(State))
				elseif Variant == DesktopUpsellExperiment.variants.OpenPaymentsPage then
					v4.openPaymentsPageWithContext(config, SelectedRobuxPackageModule.getProductId(State))
				else
					v4.startRobuxUpsellWebByFlowWithContext(config, State.purchaseFlow, SelectedRobuxPackageModule.getProductId(State))
				end
				p1:dispatch(SetPromptStateModule(PromptStateModule.UpsellInProgress))
				
				return
			elseif State.promptState == PromptStateModule.LeaveRobloxWarning then
				v3.getVngShopUrl(v3):andThen(function(Result)
					-- upvalues: v4 (copy), p1 (copy), SetPromptStateModule (upval), PromptStateModule (upval)
					v4.openVngStore(Result.vngShopRedirectUrl)
					p1:dispatch(SetPromptStateModule(PromptStateModule.UpsellInProgress))
				end):catch(function()
					-- upvalues: v4 (copy), GetFStringVNGWebshopUrlFunction (upval), p1 (copy), SetPromptStateModule (upval), PromptStateModule (upval)
					v4.openVngStore(GetFStringVNGWebshopUrlFunction())
					p1:dispatch(SetPromptStateModule(PromptStateModule.UpsellInProgress))
				end)
				
				return
			else
				p1:dispatch(SetPromptStateModule(PromptStateModule.LeaveRobloxWarning))
				
				return
			end
		elseif UpsellFlowModule1 == UpsellFlowModule.Mobile then
			local RobuxProductId1 = SelectedRobuxPackageModule.getRobuxProductId(State)
			local LocalPlayer = Players.LocalPlayer
			v1.signalProductPurchaseUpsellConfirmed(State.productInfo.productId, State.requestType, RobuxProductId1)
			
			if game:GetEngineFeature("NativePurchaseWithLocalPlayer") then
				v4.promptNativePurchaseWithLocalPlayer(RobuxProductId1)
			else
				v4.promptNativePurchase(LocalPlayer, RobuxProductId1)
			end
			p1:dispatch(SetPromptStateModule(PromptStateModule.UpsellInProgress))
			
			return
		elseif UpsellFlowModule1 == UpsellFlowModule.Xbox then
			local RobuxProductId2 = SelectedRobuxPackageModule.getRobuxProductId(State)
			local ProductId1 = State.productInfo.productId
			local RequestType = State.requestType
			v1.signalProductPurchaseUpsellConfirmed(ProductId1, RequestType, RobuxProductId2)
			p1:dispatch(SetPromptStateModule(PromptStateModule.UpsellInProgress))
			
			return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
				-- upvalues: v4 (copy), RobuxProductId2 (copy)
				local BeginPlatformStorePurchaseResult = nil
				local Success, Result = pcall(function()
					-- upvalues: BeginPlatformStorePurchaseResult (ref), v4 (upval), RobuxProductId2 (upval)
					BeginPlatformStorePurchaseResult = v4.beginPlatformStorePurchase(RobuxProductId2)
				end)
				
				if Success then
					Callback(BeginPlatformStorePurchaseResult)
				else
					Callback1(Result)
				end
			end):andThen(function(Result)
				-- upvalues: ConstantsModule (upval), v1 (copy), ProductId1 (copy), RequestType (copy), RobuxProductId2 (copy), p1 (copy), RetryAfterUpsellModule (upval), ErrorOccurredModule (upval), PurchaseErrorModule (upval)
				if Result == ConstantsModule.PlatformPurchaseResult.PurchaseResult_Success then
					v1.signalXboxInGamePurchaseSuccess(ProductId1, RequestType, RobuxProductId2)
				elseif Result == ConstantsModule.PlatformPurchaseResult.PurchaseResult_UserCancelled then
					v1.signalXboxInGamePurchaseCanceled(ProductId1, RequestType, RobuxProductId2)
				else
					v1.signalXboxInGamePurchaseFailure(ProductId1, RequestType, RobuxProductId2)
				end
				return if Result == ConstantsModule.PlatformPurchaseResult.PurchaseResult_Success or Result == ConstantsModule.PlatformPurchaseResult.PurchaseResult_RobuxUpdated then p1:dispatch(RetryAfterUpsellModule()) else p1:dispatch(ErrorOccurredModule(PurchaseErrorModule.UnknownFailure))
			end)
		elseif UpsellFlowModule1 == UpsellFlowModule.Unavailable then
			p1:dispatch(ErrorOccurredModule(PurchaseErrorModule.NotEnoughRobuxNoUpsell))
			
			return
		else
			warn("Need more Robux: platform not supported for Robux purchase")
		end
	end)
end