local contextActionService = game:GetService("ContextActionService")
local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local purchasePromptDepsModule = require(purchasePrompt.Parent.PurchasePromptDeps)
local roact = purchasePromptDepsModule.Roact
local IAPExperience = purchasePromptDepsModule.IAPExperience
local premiumUpsellFlow = IAPExperience.PurchaseFlow.PremiumUpsellFlow
local premiumUpsellFlowState = IAPExperience.PurchaseFlow.PremiumUpsellFlowState
local purchaseErrorType = IAPExperience.PurchaseFlow.PurchaseErrorType
local promptStateModule = require(purchasePrompt.Enums.PromptState)
local purchaseErrorModule = require(purchasePrompt.Enums.PurchaseError)
local VPCModalTypeModule = require(purchasePrompt.Enums.VPCModalType)
local name = roact.PureComponent:extend(script.Name)
local getFFlagEnableVpcForInExperiencePremiumUpsellModule = require(purchasePrompt.Flags.GetFFlagEnableVpcForInExperiencePremiumUpsell)
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")

function name.init(p0) --[[ line: 51 ]]
	-- upvalues: promptStateModule (ref), getFFlagEnableVpcForInExperiencePremiumUpsellModule (ref)
	function p0.confirmButtonPressed() --[[ line: 52 ]]
		-- upvalues: p0 (ref), promptStateModule (copy), getFFlagEnableVpcForInExperiencePremiumUpsellModule (copy)
		local props = p0.props
		local promptState = props.promptState
		
		if promptState == promptStateModule.PremiumUpsell then
			if getFFlagEnableVpcForInExperiencePremiumUpsellModule() then
				props.dispatchPremiumPrecheck()
				
				return
			end
			props.promptPremiumPurchase()
			
			return
		elseif promptState == promptStateModule.PurchaseComplete then
			props.endPurchase()
			
			return
		elseif promptState == promptStateModule.Error then
			props.endPurchase()
			
			return
		end
	end
	
	function p0.cancelButtonPressed() --[[ line: 72 ]]
		-- upvalues: p0 (ref)
		p0.props.endPurchase()
	end
end

function name.didMount(p1) --[[ line: 79 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:BindCoreAction("PremiumPurchaseConfirmButtonBind", function(_, p2, _) --[[ line: 80 ]]
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.Begin then
			p1.confirmButtonPressed()
		end
	end, false, Enum.KeyCode.ButtonA)
	contextActionService:BindCoreAction("PremiumPurchaseCancelButtonBind", function(_, p3, _) --[[ line: 85 ]]
		-- upvalues: p1 (ref)
		if p3 == Enum.UserInputState.Begin then
			p1.cancelButtonPressed()
		end
	end, false, Enum.KeyCode.ButtonB)
end

function name.willUnmount(_) --[[ line: 92 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("PremiumPurchaseConfirmButtonBind")
	contextActionService:UnbindCoreAction("PremiumPurchaseCancelButtonBind")
end

function name.getFlowState(p4) --[[ line: 97 ]]
	-- upvalues: promptStateModule (ref), premiumUpsellFlowState (ref)
	local promptState = p4.props.promptState
	
	return if promptState == promptStateModule.PremiumUpsell then premiumUpsellFlowState.PurchaseModal elseif promptState == promptStateModule.Error then premiumUpsellFlowState.Error elseif promptState == promptStateModule.EnablePurchaseVPCModal then premiumUpsellFlowState.PurchaseVPCModal else premiumUpsellFlowState.None
end

function name.getErrorType(p5) --[[ line: 113 ]]
	-- upvalues: purchaseErrorModule (ref), purchaseErrorType (ref)
	local props = p5.props
	
	return if props.purchaseError == purchaseErrorModule.AlreadyPremium then purchaseErrorType.AlreadyPremium elseif props.purchaseError == purchaseErrorModule.PremiumUnavailablePlatform then purchaseErrorType.PremiumPlatformUnavailable elseif props.purchaseError == purchaseErrorModule.EconomicRestriction then purchaseErrorType.EconomicRestriction else purchaseErrorType.Unknown
end

function name.getVPCModalType(p6) --[[ line: 127 ]]
	-- upvalues: promptStateModule (ref), VPCModalTypeModule (ref)
	return if p6.props.promptState == promptStateModule.EnablePurchaseVPCModal then VPCModalTypeModule.toRawValue(VPCModalTypeModule.EnablePurchase) else VPCModalTypeModule.toRawValue(VPCModalTypeModule.None)
end

function name.render(p7) --[[ line: 137 ]]
	-- upvalues: roact (ref), premiumUpsellFlow (ref), getFFlagEnableVpcForInExperiencePremiumUpsellModule (ref)
	local props = p7.props
	
	return roact.createElement(premiumUpsellFlow, {
		isCatalog = false,
		eventPrefix = "InGame",
		screenSize = props.screenSize,
		currencySymbol = props.currencySymbol,
		robuxPrice = props.robuxPrice,
		robuxAmount = props.robuxAmount,
		purchaseState = p7:getFlowState(),
		errorType = p7:getErrorType(),
		economicRestrictionError = props.economicRestrictionError,
		purchaseVPCType = p7:getVPCModalType(),
		acceptControllerIcon = if props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil,
		purchasePremium = if getFFlagEnableVpcForInExperiencePremiumUpsellModule() then props.dispatchPremiumPrecheck else props.promptPremiumPurchase,
		cancelPurchase = props.endPurchase,
		flowComplete = props.endPurchase,
		onAnalyticEvent = props.onAnalyticEvent
	})
end

return name