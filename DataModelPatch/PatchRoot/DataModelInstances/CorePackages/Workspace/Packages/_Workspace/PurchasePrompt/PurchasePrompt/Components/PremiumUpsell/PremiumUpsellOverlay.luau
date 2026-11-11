local ContextActionService = game:GetService("ContextActionService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local PurchasePromptDepsModule = require(PurchasePrompt.Parent.PurchasePromptDeps)
local Roact = PurchasePromptDepsModule.Roact
local IAPExperience = PurchasePromptDepsModule.IAPExperience
local PremiumUpsellFlow = IAPExperience.PurchaseFlow.PremiumUpsellFlow
local PremiumUpsellFlowState = IAPExperience.PurchaseFlow.PremiumUpsellFlowState
local PurchaseErrorType = IAPExperience.PurchaseFlow.PurchaseErrorType
local PromptStateModule = require(PurchasePrompt.Enums.PromptState)
local PurchaseErrorModule = require(PurchasePrompt.Enums.PurchaseError)
local VPCModalTypeModule = require(PurchasePrompt.Enums.VPCModalType)
local ExtendResult = Roact.PureComponent:extend(script.Name)
local GetFFlagEnableVpcForInExperiencePremiumUpsellModule = require(PurchasePrompt.Flags.GetFFlagEnableVpcForInExperiencePremiumUpsell)
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")

function ExtendResult.init(p1)
	-- upvalues: PromptStateModule (copy), GetFFlagEnableVpcForInExperiencePremiumUpsellModule (copy)
	function p1.confirmButtonPressed()
		-- upvalues: p1 (copy), PromptStateModule (upval), GetFFlagEnableVpcForInExperiencePremiumUpsellModule (upval)
		local Props = p1.props
		local PromptState = Props.promptState
		
		if PromptState == PromptStateModule.PremiumUpsell then
			if GetFFlagEnableVpcForInExperiencePremiumUpsellModule() then
				Props.dispatchPremiumPrecheck()
				
				return
			else
				Props.promptPremiumPurchase()
				
				return
			end
		elseif PromptState == PromptStateModule.PurchaseComplete then
			Props.endPurchase()
			
			return
		else
			if PromptState == PromptStateModule.Error then
				Props.endPurchase()
				
				return
			end
		end
	end
	
	function p1.cancelButtonPressed()
		-- upvalues: p1 (copy)
		p1.props.endPurchase()
	end
end

function ExtendResult.didMount(p1)
	-- upvalues: ContextActionService (copy)
	ContextActionService:BindCoreAction("PremiumPurchaseConfirmButtonBind", function(_, UserInputState, _)
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			p1.confirmButtonPressed()
		end
	end, false, Enum.KeyCode.ButtonA)
	ContextActionService:BindCoreAction("PremiumPurchaseCancelButtonBind", function(_, UserInputState, _)
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			p1.cancelButtonPressed()
		end
	end, false, Enum.KeyCode.ButtonB)
end

function ExtendResult:willUnmount()
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction("PremiumPurchaseConfirmButtonBind")
	ContextActionService:UnbindCoreAction("PremiumPurchaseCancelButtonBind")
end

function ExtendResult.getFlowState(p1)
	-- upvalues: PromptStateModule (copy), PremiumUpsellFlowState (copy)
	local PromptState = p1.props.promptState
	
	return if PromptState == PromptStateModule.PremiumUpsell then PremiumUpsellFlowState.PurchaseModal elseif PromptState == PromptStateModule.Error then PremiumUpsellFlowState.Error elseif PromptState == PromptStateModule.EnablePurchaseVPCModal then PremiumUpsellFlowState.PurchaseVPCModal else PremiumUpsellFlowState.None
end

function ExtendResult.getErrorType(p1)
	-- upvalues: PurchaseErrorModule (copy), PurchaseErrorType (copy)
	local Props = p1.props
	
	return if Props.purchaseError == PurchaseErrorModule.AlreadyPremium then PurchaseErrorType.AlreadyPremium elseif Props.purchaseError == PurchaseErrorModule.PremiumUnavailablePlatform then PurchaseErrorType.PremiumPlatformUnavailable elseif Props.purchaseError == PurchaseErrorModule.EconomicRestriction then PurchaseErrorType.EconomicRestriction else PurchaseErrorType.Unknown
end

function ExtendResult.getVPCModalType(p1)
	-- upvalues: PromptStateModule (copy), VPCModalTypeModule (copy)
	return if p1.props.promptState == PromptStateModule.EnablePurchaseVPCModal then VPCModalTypeModule.toRawValue(VPCModalTypeModule.EnablePurchase) else VPCModalTypeModule.toRawValue(VPCModalTypeModule.None)
end

function ExtendResult.render(p1)
	-- upvalues: Roact (copy), PremiumUpsellFlow (copy), GetFFlagEnableVpcForInExperiencePremiumUpsellModule (copy)
	local Props = p1.props
	
	return Roact.createElement(PremiumUpsellFlow, {
		isCatalog = false,
		eventPrefix = "InGame",
		screenSize = Props.screenSize,
		currencySymbol = Props.currencySymbol,
		robuxPrice = Props.robuxPrice,
		robuxAmount = Props.robuxAmount,
		purchaseState = p1:getFlowState(),
		errorType = p1:getErrorType(),
		economicRestrictionError = Props.economicRestrictionError,
		purchaseVPCType = p1:getVPCModalType(),
		acceptControllerIcon = if Props.isGamepadEnabled then "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png" else nil,
		purchasePremium = if GetFFlagEnableVpcForInExperiencePremiumUpsellModule() then Props.dispatchPremiumPrecheck else Props.promptPremiumPurchase,
		cancelPurchase = Props.endPurchase,
		flowComplete = Props.endPurchase,
		onAnalyticEvent = Props.onAnalyticEvent
	})
end

return ExtendResult