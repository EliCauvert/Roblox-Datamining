local HttpService = game:GetService("HttpService")
local ContextActionService = game:GetService("ContextActionService")
local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local GetPartialPageModalMiddleContentWidthFunction = require(Parent2.UIBlox).App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local PremiumUpsellFlowStateModule = require(Parent.PremiumUpsellFlowState)
local AnimatorModule = require(Parent1.Generic.Animator)
local ConstantsModule = require(Parent1.Generic.Constants)
local PurchaseErrorPromptModule = require(Parent1.Generic.PurchaseErrorPrompt)
local PremiumUpsellPromptModule = require(Parent1.PremiumUpsell.PremiumUpsellPrompt)
local GetModalShownEventDataModule = require(Parent1.Utility.getModalShownEventData)
local GetUserInputEventDataModule = require(Parent1.Utility.getUserInputEventData)
local GetEnableCentralOverlayForUpsellPromptModule = require(Parent1.Flags.getEnableCentralOverlayForUpsellPrompt)
local VerifiedParentalConsentDialog = require(Parent2.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog
local CompleteFlowInStudioAccept = game:DefineFastFlag("CompleteFlowInStudioAccept", false)
local ExtendResult = RoactModule.Component:extend(script.Name)

function ExtendResult.init(p1) --[[ Line: 64 ]]
	-- upvalues: HttpService (copy)
	p1.state = { analyticId = HttpService:GenerateGUID(false) }
	
	function p1.closeModal() --[[ Line: 69 ]]
		-- upvalues: p1 (copy)
		local Props = p1.props
		p1:reportUserInput("Cancel")
		Props.cancelPurchase()
		p1:closeCentralOverlay()
		p1:UnbindActions()
	end
end

function ExtendResult.didUpdate(p1, p2, _) --[[ Line: 79 ]]
	local Props = p1.props
	
	if p2.purchaseState ~= Props.purchaseState then
		p1:reportModalShown()
		p1:dispatchCentralOverlayAndRenderModal(Props)
	end
end

function ExtendResult.UnbindActions(p1) --[[ Line: 88 ]]
	-- upvalues: GetEnableCentralOverlayForUpsellPromptModule (copy), ContextActionService (copy), ConstantsModule (copy)
	if GetEnableCentralOverlayForUpsellPromptModule() and p1.props.dispatchCentralOverlay then
		ContextActionService:UnbindAction(ConstantsModule.CLOSE_MODAL_ACTION)
	end
end

function ExtendResult.BindCancelAction(p1) --[[ Line: 94 ]]
	-- upvalues: GetEnableCentralOverlayForUpsellPromptModule (copy), ContextActionService (copy), ConstantsModule (copy)
	if GetEnableCentralOverlayForUpsellPromptModule() and p1.props.dispatchCentralOverlay then
		ContextActionService:BindAction(ConstantsModule.CLOSE_MODAL_ACTION, p1.closeModal, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
	end
end

function ExtendResult.closeCentralOverlay(p1) --[[ Line: 110 ]]
	-- upvalues: GetEnableCentralOverlayForUpsellPromptModule (copy)
	local Props = p1.props
	
	if GetEnableCentralOverlayForUpsellPromptModule() and Props.dispatchCentralOverlay then
		Props.dispatchCentralOverlay()
	end
end

function ExtendResult.constructPremiumUpsellPromptAnimatorObj(p1) --[[ Line: 118 ]]
	-- upvalues: GetPartialPageModalMiddleContentWidthFunction (copy), PremiumUpsellFlowStateModule (copy), RoactModule (copy), PremiumUpsellPromptModule (copy), CompleteFlowInStudioAccept (copy)
	local Props = p1.props
	
	return {
		shouldAnimate = true,
		shouldShow = Props.purchaseState == PremiumUpsellFlowStateModule.PurchaseModal,
		animateDown = GetPartialPageModalMiddleContentWidthFunction(Props.screenSize.X) == 492,
		renderChildren = function() --[[ Line: 127 ]]
			-- upvalues: RoactModule (upval), PremiumUpsellPromptModule (upval), Props (copy), p1 (copy), CompleteFlowInStudioAccept (upval)
			return RoactModule.createElement(PremiumUpsellPromptModule, {
				screenSize = Props.screenSize,
				isCatalog = Props.isCatalog,
				currencySymbol = Props.currencySymbol,
				robuxPrice = Props.robuxPrice,
				robuxAmount = Props.robuxAmount,
				acceptControllerIcon = Props.acceptControllerIcon,
				purchasePremiumActivated = function() --[[ Line: 139 ]]
					-- upvalues: p1 (upval), Props (upval), CompleteFlowInStudioAccept (upval)
					p1:reportUserInput("Subscribe")
					Props.purchasePremium()
					
					if CompleteFlowInStudioAccept and game:GetService("RunService"):IsStudio() then
						Props.flowComplete()
					end
					p1:closeCentralOverlay()
				end,
				cancelPurchaseActivated = function() --[[ Line: 147 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("Cancel")
					Props.cancelPurchase()
					p1:closeCentralOverlay()
				end
			})
		end
	}
end

function ExtendResult.constructPurchaseErrorPromptAnimatorObj(p1) --[[ Line: 157 ]]
	-- upvalues: PremiumUpsellFlowStateModule (copy), RoactModule (copy), PurchaseErrorPromptModule (copy)
	local Props = p1.props
	
	return {
		shouldAnimate = true,
		shouldShow = Props.purchaseState == PremiumUpsellFlowStateModule.Error,
		renderChildren = function() --[[ Line: 163 ]]
			-- upvalues: RoactModule (upval), PurchaseErrorPromptModule (upval), Props (copy), p1 (copy)
			return RoactModule.createElement(PurchaseErrorPromptModule, {
				screenSize = Props.screenSize,
				errorType = Props.errorType,
				economicRestrictionError = Props.economicRestrictionError,
				doneControllerIcon = Props.acceptControllerIcon,
				doneActivated = function() --[[ Line: 172 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("Done")
					Props.flowComplete()
					p1:closeCentralOverlay()
				end
			})
		end
	}
end

function ExtendResult.constructPurchaseVPCPromptAnimatorObj(p1) --[[ Line: 182 ]]
	-- upvalues: PremiumUpsellFlowStateModule (copy), RoactModule (copy), VerifiedParentalConsentDialog (copy)
	local Props = p1.props
	p1:BindCancelAction()
	
	return {
		shouldAnimate = true,
		shouldShow = Props.purchaseState == PremiumUpsellFlowStateModule.PurchaseVPCModal,
		renderChildren = function() --[[ Line: 190 ]]
			-- upvalues: RoactModule (upval), VerifiedParentalConsentDialog (upval), Props (copy), p1 (copy)
			return RoactModule.createElement(VerifiedParentalConsentDialog, {
				isActionable = false,
				screenSize = Props.screenSize,
				modalType = Props.purchaseVPCType,
				onDismiss = function() --[[ Line: 195 ]]
					-- upvalues: p1 (upval), Props (upval)
					p1:reportUserInput("Cancel")
					Props.cancelPurchase()
					p1:closeCentralOverlay()
				end
			})
		end
	}
end

function ExtendResult.dispatchCentralOverlayAndRenderModal(p1, Props) --[[ Line: 205 ]]
	-- upvalues: GetEnableCentralOverlayForUpsellPromptModule (copy), PremiumUpsellFlowStateModule (copy), ConstantsModule (copy)
	if not GetEnableCentralOverlayForUpsellPromptModule() or not Props.dispatchCentralOverlay then return end
	local PurchaseState = Props.purchaseState
	
	if PurchaseState == PremiumUpsellFlowStateModule.PurchaseModal then
		Props.dispatchCentralOverlay(ConstantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructPremiumUpsellPromptAnimatorObj())
	end
	if PurchaseState == PremiumUpsellFlowStateModule.Error then
		Props.dispatchCentralOverlay(ConstantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructPurchaseErrorPromptAnimatorObj())
	end
	if PurchaseState == PremiumUpsellFlowStateModule.PurchaseVPCModal then
		Props.dispatchCentralOverlay(ConstantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructPurchaseVPCPromptAnimatorObj())
	end
end

function ExtendResult.reportModalShown(p1) --[[ Line: 236 ]]
	-- upvalues: GetModalShownEventDataModule (copy), PremiumUpsellFlowStateModule (copy), HttpService (copy)
	local Props = p1.props
	local State = p1.state
	
	if p1.props.onAnalyticEvent then
		Props.onAnalyticEvent("UserPurchaseFlow", (GetModalShownEventDataModule(State.analyticId, Props.eventPrefix, "PremiumUpsell", PremiumUpsellFlowStateModule.toRawValue(Props.purchaseState), HttpService:JSONEncode({ universe_id = tostring(game.GameId) }))))
		
		return
	end
end

function ExtendResult.reportUserInput(p1, p2) --[[ Line: 257 ]]
	-- upvalues: GetUserInputEventDataModule (copy), PremiumUpsellFlowStateModule (copy), HttpService (copy)
	local Props = p1.props
	local State = p1.state
	
	if p1.props.onAnalyticEvent then
		Props.onAnalyticEvent("UserPurchaseFlow", (GetUserInputEventDataModule(State.analyticId, Props.eventPrefix, "PremiumUpsell", PremiumUpsellFlowStateModule.toRawValue(Props.purchaseState), p2, HttpService:JSONEncode({ universe_id = tostring(game.GameId) }))))
		
		return
	end
end

function ExtendResult.getChildrenElements(p1) --[[ Line: 280 ]]
	-- upvalues: RoactModule (copy), AnimatorModule (copy)
	return {
		PremiumUpsellPromptAnimator = RoactModule.createElement(AnimatorModule, p1:constructPremiumUpsellPromptAnimatorObj()),
		PurchaseErrorPromptAnimator = RoactModule.createElement(AnimatorModule, p1:constructPurchaseErrorPromptAnimatorObj()),
		PurchaseVPCPromptAnimator = RoactModule.createElement(AnimatorModule, p1:constructPurchaseVPCPromptAnimatorObj())
	}
end

function ExtendResult.render(p1) --[[ Line: 288 ]]
	-- upvalues: GetEnableCentralOverlayForUpsellPromptModule (copy), RoactModule (copy)
	local Props = p1.props
	
	return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, if GetEnableCentralOverlayForUpsellPromptModule() and Props.dispatchCentralOverlay then {} else p1:getChildrenElements())
end

return ExtendResult