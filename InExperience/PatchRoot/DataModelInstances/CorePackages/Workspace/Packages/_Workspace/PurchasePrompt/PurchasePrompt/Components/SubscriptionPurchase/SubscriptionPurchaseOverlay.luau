local _ = game:GetService("ContextActionService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local purchasePromptDepsModule = require(parent.PurchasePromptDeps)
local toastRoduxModule = require(parent.ToastRodux)
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local robloxTranslatorModule = require(parent.RobloxTranslator)
local roact = purchasePromptDepsModule.Roact
local toastType = toastRoduxModule.Enums.ToastType
local IAPExperience = purchasePromptDepsModule.IAPExperience
local subscriptionPurchaseFlow = IAPExperience.PurchaseFlow.SubscriptionPurchaseFlow
local subscriptionPurchaseFlowState = IAPExperience.PurchaseFlow.SubscriptionPurchaseFlowState
local purchaseErrorType = IAPExperience.PurchaseFlow.PurchaseErrorType
local VPCModalTypeModule = require(purchasePrompt.Enums.VPCModalType)
local getFFlagEnableSubscriptionPurchaseToastModule = require(purchasePrompt.Flags.GetFFlagEnableSubscriptionPurchaseToast)
local getFFlagEnableVpcForInExperienceSubscriptionPurchaseModule = require(purchasePrompt.Flags.GetFFlagEnableVpcForInExperienceSubscriptionPurchase)
local name = roact.PureComponent:extend(script.Name)

function name.init(p1)
	-- upvalues: promptStateModule (ref)
	function p0.confirmButtonPressed()
		-- upvalues: p1 (ref), promptStateModule (copy)
		local props = p1.props
		local promptState = props.promptState
		
		if promptState == promptStateModule.PromptSubscriptionPurchase then
			props.promptSubscriptionPurchase()
			
			return
		elseif promptState == promptStateModule.PurchaseComplete then
			props.endPurchase()
			
			return
		elseif promptState == promptStateModule.Error then
			props.endPurchase()
			
			return
		end
	end
	
	function p0.cancelButtonPressed()
		-- upvalues: p1 (ref)
		p1.props.endPurchase()
	end
end

function name.getFlowState(p1)
	-- upvalues: promptStateModule (ref), subscriptionPurchaseFlowState (ref), getFFlagEnableVpcForInExperienceSubscriptionPurchaseModule (ref), purchaseErrorModule (ref)
	local props = p1.props
	local promptState = props.promptState
	
	return if promptState == promptStateModule.PromptSubscriptionPurchase then subscriptionPurchaseFlowState.PurchaseModal elseif promptState == promptStateModule.Error then if getFFlagEnableVpcForInExperienceSubscriptionPurchaseModule() and props.purchaseError == purchaseErrorModule.VpcRequired then subscriptionPurchaseFlowState.PurchaseVPCModal else subscriptionPurchaseFlowState.Error else subscriptionPurchaseFlowState.None
end

function name.getErrorType(p1)
	-- upvalues: purchaseErrorModule (ref), purchaseErrorType (ref)
	local props = p1.props
	
	return if props.purchaseError == purchaseErrorModule.AlreadySubscribed then purchaseErrorType.AlreadySubscribed elseif props.purchaseError == purchaseErrorModule.SubscriptionExceededUserSpendLimit then purchaseErrorType.SubscriptionExceededUserSpendLimit elseif props.purchaseError == purchaseErrorModule.SubscriptionUnsupportedLocale then purchaseErrorType.SubscriptionUnsupportedLocale elseif props.purchaseError == purchaseErrorModule.RestrictedUser then purchaseErrorType.RestrictedUser elseif props.purchaseError == purchaseErrorModule.SubscriptionPurchasePlatformNotSupported then purchaseErrorType.SubscriptionPurchasePlatformNotSupported elseif props.purchaseError == purchaseErrorModule.SubscriptionInvalidSaleLocation then purchaseErrorType.SubscriptionInvalidSaleLocation elseif props.purchaseError == purchaseErrorModule.SubscriptionNotForSale then purchaseErrorType.SubscriptionNotForSale elseif props.purchaseError == purchaseErrorModule.VpcRequired then purchaseErrorType.VpcRequired elseif props.purchaseError == purchaseErrorModule.ExceedParentalSpendLimit then purchaseErrorType.ExceedParentalSpendLimit elseif props.purchaseError == purchaseErrorModule.EconomicRestriction then purchaseErrorType.EconomicRestriction else purchaseErrorType.Unknown
end

function name.getVPCModalType(_, p1)
	-- upvalues: subscriptionPurchaseFlowState (ref), VPCModalTypeModule (ref)
	return if p1 == subscriptionPurchaseFlowState.PurchaseVPCModal then VPCModalTypeModule.toRawValue(VPCModalTypeModule.EnablePurchase) else VPCModalTypeModule.toRawValue(VPCModalTypeModule.None)
end

function name.render(p1)
	-- upvalues: roact (ref), subscriptionPurchaseFlow (ref)
	local props = p1.props
	local flowState = p1:getFlowState()
	
	return roact.createElement(subscriptionPurchaseFlow, {
		eventPrefix = "InGame",
		screenSize = props.screenSize,
		purchaseState = flowState,
		errorType = p1:getErrorType(),
		economicRestrictionError = props.economicRestrictionError,
		purchaseVPCType = p1:getVPCModalType(flowState),
		subscriptionId = props.subscriptionId,
		name = props.name,
		subscriptionProviderId = props.subscriptionProviderId,
		subscriptionProviderName = props.subscriptionProviderName,
		priceTier = props.priceTier,
		displayPrice = props.displayPrice,
		period = props.period,
		disclaimerText = props.disclaimerText,
		description = props.description,
		itemIcon = props.itemIcon,
		primaryPaymentMethod = props.primaryPaymentMethod,
		secondaryPaymentMethod = props.secondaryPaymentMethod,
		acceptControllerIcon = if props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil,
		isTestingMode = props.isTestingMode,
		purchaseSubscription = props.promptSubscriptionPurchase,
		cancelPurchase = props.endPurchase,
		flowComplete = props.endPurchase,
		onAnalyticEvent = props.onAnalyticEvent
	})
end

function name.didUpdate(p1)
	-- upvalues: getFFlagEnableSubscriptionPurchaseToastModule (ref), subscriptionPurchaseFlowState (ref), purchaseErrorType (ref), robloxTranslatorModule (ref), toastType (ref)
	if getFFlagEnableSubscriptionPurchaseToastModule() then
		if p1:getFlowState() == subscriptionPurchaseFlowState.Error and p1:getErrorType() == purchaseErrorType.Unknown then
			p1.props.setCurrentToastMessage({
				toastTitle = robloxTranslatorModule:FormatByKey("Feature.Subscription.Error.GenericSubscribeError"),
				toastType = toastType.NetworkingError
			})
			p1.props.endPurchase()
		end
	end
end

return name