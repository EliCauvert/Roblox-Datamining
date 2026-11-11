local _ = game:GetService("ContextActionService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local PurchasePromptDepsModule = require(Parent.PurchasePromptDeps)
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RobloxTranslatorModule = require(Parent.RobloxTranslator)
local Roact = PurchasePromptDepsModule.Roact
local ToastType = require(Parent.ToastRodux).Enums.ToastType
local IAPExperience = PurchasePromptDepsModule.IAPExperience
local SubscriptionPurchaseFlow = IAPExperience.PurchaseFlow.SubscriptionPurchaseFlow
local SubscriptionPurchaseFlowState = IAPExperience.PurchaseFlow.SubscriptionPurchaseFlowState
local PurchaseErrorType = IAPExperience.PurchaseFlow.PurchaseErrorType
local VPCModalTypeModule = require(PurchasePrompt.Enums.VPCModalType)
local GetFFlagEnableSubscriptionPurchaseToastModule = require(PurchasePrompt.Flags.GetFFlagEnableSubscriptionPurchaseToast)
local GetFFlagEnableVpcForInExperienceSubscriptionPurchaseModule = require(PurchasePrompt.Flags.GetFFlagEnableVpcForInExperienceSubscriptionPurchase)
local ExtendResult = Roact.PureComponent:extend(script.Name)

function ExtendResult.init(p1)
	-- upvalues: PromptStateModule (copy)
	function p1.confirmButtonPressed()
		-- upvalues: p1 (copy), PromptStateModule (upval)
		local Props = p1.props
		local PromptState = Props.promptState
		
		if PromptState == PromptStateModule.PromptSubscriptionPurchase then
			Props.promptSubscriptionPurchase()
			
			return
		end
		if PromptState == PromptStateModule.PurchaseComplete then
			Props.endPurchase()
			
			return
		end
		if PromptState == PromptStateModule.Error then
			Props.endPurchase()
			
			return
		end
	end
	
	function p1.cancelButtonPressed()
		-- upvalues: p1 (copy)
		p1.props.endPurchase()
	end
end

function ExtendResult.getFlowState(p1)
	-- upvalues: PromptStateModule (copy), SubscriptionPurchaseFlowState (copy), GetFFlagEnableVpcForInExperienceSubscriptionPurchaseModule (copy), PurchaseErrorModule (copy)
	local Props = p1.props
	local PromptState = Props.promptState
	
	return if PromptState == PromptStateModule.PromptSubscriptionPurchase then SubscriptionPurchaseFlowState.PurchaseModal elseif PromptState == PromptStateModule.Error then if GetFFlagEnableVpcForInExperienceSubscriptionPurchaseModule() and Props.purchaseError == PurchaseErrorModule.VpcRequired then SubscriptionPurchaseFlowState.PurchaseVPCModal else SubscriptionPurchaseFlowState.Error else SubscriptionPurchaseFlowState.None
end

function ExtendResult.getErrorType(p1)
	-- upvalues: PurchaseErrorModule (copy), PurchaseErrorType (copy)
	local Props = p1.props
	
	return if Props.purchaseError == PurchaseErrorModule.AlreadySubscribed then PurchaseErrorType.AlreadySubscribed elseif Props.purchaseError == PurchaseErrorModule.SubscriptionExceededUserSpendLimit then PurchaseErrorType.SubscriptionExceededUserSpendLimit elseif Props.purchaseError == PurchaseErrorModule.SubscriptionUnsupportedLocale then PurchaseErrorType.SubscriptionUnsupportedLocale elseif Props.purchaseError == PurchaseErrorModule.RestrictedUser then PurchaseErrorType.RestrictedUser elseif Props.purchaseError == PurchaseErrorModule.SubscriptionPurchasePlatformNotSupported then PurchaseErrorType.SubscriptionPurchasePlatformNotSupported elseif Props.purchaseError == PurchaseErrorModule.SubscriptionInvalidSaleLocation then PurchaseErrorType.SubscriptionInvalidSaleLocation elseif Props.purchaseError == PurchaseErrorModule.SubscriptionNotForSale then PurchaseErrorType.SubscriptionNotForSale elseif Props.purchaseError == PurchaseErrorModule.VpcRequired then PurchaseErrorType.VpcRequired elseif Props.purchaseError == PurchaseErrorModule.ExceedParentalSpendLimit then PurchaseErrorType.ExceedParentalSpendLimit elseif Props.purchaseError == PurchaseErrorModule.EconomicRestriction then PurchaseErrorType.EconomicRestriction else PurchaseErrorType.Unknown
end

function ExtendResult:getVPCModalType(FlowState)
	-- upvalues: SubscriptionPurchaseFlowState (copy), VPCModalTypeModule (copy)
	return if FlowState == SubscriptionPurchaseFlowState.PurchaseVPCModal then VPCModalTypeModule.toRawValue(VPCModalTypeModule.EnablePurchase) else VPCModalTypeModule.toRawValue(VPCModalTypeModule.None)
end

function ExtendResult.render(p1)
	-- upvalues: Roact (copy), SubscriptionPurchaseFlow (copy)
	local Props = p1.props
	local FlowState = p1:getFlowState()
	
	return Roact.createElement(SubscriptionPurchaseFlow, {
		eventPrefix = "InGame",
		screenSize = Props.screenSize,
		purchaseState = FlowState,
		errorType = p1:getErrorType(),
		economicRestrictionError = Props.economicRestrictionError,
		purchaseVPCType = p1:getVPCModalType(FlowState),
		subscriptionId = Props.subscriptionId,
		name = Props.name,
		subscriptionProviderId = Props.subscriptionProviderId,
		subscriptionProviderName = Props.subscriptionProviderName,
		priceTier = Props.priceTier,
		displayPrice = Props.displayPrice,
		period = Props.period,
		disclaimerText = Props.disclaimerText,
		description = Props.description,
		itemIcon = Props.itemIcon,
		primaryPaymentMethod = Props.primaryPaymentMethod,
		secondaryPaymentMethod = Props.secondaryPaymentMethod,
		acceptControllerIcon = if Props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil,
		isTestingMode = Props.isTestingMode,
		purchaseSubscription = Props.promptSubscriptionPurchase,
		cancelPurchase = Props.endPurchase,
		flowComplete = Props.endPurchase,
		onAnalyticEvent = Props.onAnalyticEvent
	})
end

function ExtendResult.didUpdate(p1)
	-- upvalues: GetFFlagEnableSubscriptionPurchaseToastModule (copy), SubscriptionPurchaseFlowState (copy), PurchaseErrorType (copy), RobloxTranslatorModule (copy), ToastType (copy)
	if GetFFlagEnableSubscriptionPurchaseToastModule() then
		local ErrorType = p1:getErrorType()
		
		if p1:getFlowState() == SubscriptionPurchaseFlowState.Error and ErrorType == PurchaseErrorType.Unknown then
			p1.props.setCurrentToastMessage({
				toastTitle = RobloxTranslatorModule:FormatByKey("Feature.Subscription.Error.GenericSubscribeError"),
				toastType = ToastType.NetworkingError
			})
			p1.props.endPurchase()
		end
	end
end

return ExtendResult