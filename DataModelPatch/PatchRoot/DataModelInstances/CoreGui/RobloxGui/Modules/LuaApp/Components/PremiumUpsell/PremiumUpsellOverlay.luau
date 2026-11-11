local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local IAPExperienceModule = require(CorePackages.Workspace.Packages.IAPExperience)
local PremiumUpsellFlow = IAPExperienceModule.PurchaseFlow.PremiumUpsellFlow
local PremiumUpsellFlowState = IAPExperienceModule.PurchaseFlow.PremiumUpsellFlowState
local PurchaseErrorType = IAPExperienceModule.PurchaseFlow.PurchaseErrorType
local RetrievalStatusModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.RetrievalStatus)
local PremiumUpsellCounterModule = require(script.Parent.Enum.PremiumUpsellCounter)
local ExtendResult = RoactModule.PureComponent:extend(script.Name)

function ExtendResult.init(p1)
	-- upvalues: PurchaseErrorType (copy), PremiumUpsellCounterModule (copy)
	p1.state = { errorType = PurchaseErrorType.None }
	
	function p1.failFlow(ErrorType, p2)
		-- upvalues: p1 (copy), PremiumUpsellCounterModule (upval), PurchaseErrorType (upval)
		p1.sendCounter(PremiumUpsellCounterModule.Failed)
		local T = if p2 ~= nil then p2 else {}
		
		if ErrorType == nil then
			T.errorType = PurchaseErrorType.Unknown
		else
			T.errorType = ErrorType
		end
		p1:setState(T)
	end
	
	function p1.purchasePremium()
		-- upvalues: p1 (copy), PremiumUpsellCounterModule (upval)
		p1.sendCounter(PremiumUpsellCounterModule.Confirmed)
		p1.props.promptPremium()
	end
	
	function p1.cancelPurchase()
		-- upvalues: p1 (copy), PremiumUpsellCounterModule (upval)
		p1.sendCounter(PremiumUpsellCounterModule.Cancelled)
		p1.props.cancelPurchase()
	end
	
	function p1.flowComplete()
		-- upvalues: p1 (copy)
		p1.props.endPurchase()
	end
	
	function p1.sendAnalyticEvent(p2, p3)
		-- upvalues: p1 (copy)
		p1.props.sendAnalyticEvent(p1.props.eventPrefix .. "PremiumUpsell", p2, p3)
	end
	
	function p1.sendCounter(Cancelled)
		-- upvalues: p1 (copy), PremiumUpsellCounterModule (upval)
		p1.props.sendCounter(PremiumUpsellCounterModule.toRawValue(Cancelled))
	end
end

function ExtendResult.didMount(p1)
	-- upvalues: PremiumUpsellCounterModule (copy)
	p1.sendCounter(PremiumUpsellCounterModule.Shown)
end

function ExtendResult.didUpdate(p1, p2)
	-- upvalues: RetrievalStatusModule (copy), PremiumUpsellCounterModule (copy)
	local Props = p1.props
	
	if Props.iapProductsFetchingStatus ~= p2.iapProductsFetchingStatus and Props.iapProductsFetchingStatus == RetrievalStatusModule.Failed then
		p1.sendCounter(PremiumUpsellCounterModule.InvalidProducts)
		p1.failFlow()
	end
end

function ExtendResult.getFlowState(p1)
	-- upvalues: PurchaseErrorType (copy), PremiumUpsellFlowState (copy), RetrievalStatusModule (copy)
	local Props = p1.props
	
	return if p1.state.errorType == PurchaseErrorType.None then if Props.iapProductsFetchingStatus == RetrievalStatusModule.Done then if Props.robuxPrice == nil then PremiumUpsellFlowState.Error else PremiumUpsellFlowState.PurchaseModal else PremiumUpsellFlowState.None else PremiumUpsellFlowState.Error
end

function ExtendResult.getErrorType(p1)
	return p1.state.errorType
end

function ExtendResult.render(p1)
	-- upvalues: RoactModule (copy), PremiumUpsellFlow (copy)
	local Props = p1.props
	
	return RoactModule.createElement(PremiumUpsellFlow, {
		screenSize = Props.screenSize,
		currencySymbol = Props.currencySymbol,
		robuxPrice = Props.robuxPrice,
		robuxAmount = Props.robuxAmount,
		purchaseState = p1:getFlowState(),
		errorType = p1:getErrorType(),
		purchasePremium = p1.purchasePremium,
		cancelPurchase = p1.cancelPurchase,
		flowComplete = p1.flowComplete,
		onAnalyticEvent = p1.sendAnalyticEvent,
		eventPrefix = Props.eventPrefix,
		dispatchCentralOverlay = Props.dispatchCentralOverlay
	})
end

return ExtendResult