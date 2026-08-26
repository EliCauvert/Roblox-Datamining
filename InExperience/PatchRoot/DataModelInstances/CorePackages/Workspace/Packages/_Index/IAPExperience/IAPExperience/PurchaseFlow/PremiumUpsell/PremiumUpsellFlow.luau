local httpService = game:GetService("HttpService")
local contextActionService = game:GetService("ContextActionService")
local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local getPartialPageModalMiddleContentWidth = require(parent_2.UIBlox).App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local premiumUpsellFlowStateModule = require(parent.PremiumUpsellFlowState)
local animatorModule = require(parent_1.Generic.Animator)
local constantsModule = require(parent_1.Generic.Constants)
local purchaseErrorPromptModule = require(parent_1.Generic.PurchaseErrorPrompt)
local premiumUpsellPromptModule = require(parent_1.PremiumUpsell.PremiumUpsellPrompt)
local getModalShownEventDataModule = require(parent_1.Utility.getModalShownEventData)
local getUserInputEventDataModule = require(parent_1.Utility.getUserInputEventData)
local getEnableCentralOverlayForUpsellPromptModule = require(parent_1.Flags.getEnableCentralOverlayForUpsellPrompt)
local verifiedParentalConsentDialog = require(parent_2.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog
local completeFlowInStudioAccept = game:DefineFastFlag("CompleteFlowInStudioAccept", false)
local name = roactModule.Component:extend(script.Name)

function name.init(p1)
	-- upvalues: httpService (ref)
	p1.state = { analyticId = httpService:GenerateGUID(false) }
	
	function p0.closeModal()
		-- upvalues: p1 (ref)
		local props = p1.props
		p1:reportUserInput("Cancel")
		props.cancelPurchase()
		p1:closeCentralOverlay()
		p1:UnbindActions()
	end
end

function name.didUpdate(p1, p2, _)
	local props = p1.props
	
	if p2.purchaseState ~= props.purchaseState then
		p1:reportModalShown()
		p1:dispatchCentralOverlayAndRenderModal(props)
	end
end

function name.UnbindActions(p1)
	-- upvalues: getEnableCentralOverlayForUpsellPromptModule (ref), contextActionService (ref), constantsModule (ref)
	if getEnableCentralOverlayForUpsellPromptModule() and p1.props.dispatchCentralOverlay then
		contextActionService:UnbindAction(constantsModule.CLOSE_MODAL_ACTION)
	end
end

function name.BindCancelAction(p1)
	-- upvalues: getEnableCentralOverlayForUpsellPromptModule (ref), contextActionService (ref), constantsModule (ref)
	if getEnableCentralOverlayForUpsellPromptModule() and p1.props.dispatchCentralOverlay then
		contextActionService:BindAction(constantsModule.CLOSE_MODAL_ACTION, p1.closeModal, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
	end
end

function name.closeCentralOverlay(p1)
	-- upvalues: getEnableCentralOverlayForUpsellPromptModule (ref)
	local props = p1.props
	
	if getEnableCentralOverlayForUpsellPromptModule() and props.dispatchCentralOverlay then
		props.dispatchCentralOverlay()
	end
end

function name.constructPremiumUpsellPromptAnimatorObj(p1)
	-- upvalues: getPartialPageModalMiddleContentWidth (ref), premiumUpsellFlowStateModule (ref), roactModule (ref), premiumUpsellPromptModule (ref), completeFlowInStudioAccept (ref)
	local props = p1.props
	
	return {
		shouldAnimate = true,
		shouldShow = props.purchaseState == premiumUpsellFlowStateModule.PurchaseModal,
		animateDown = getPartialPageModalMiddleContentWidth(props.screenSize.X) == 492,
		renderChildren = function()
			-- upvalues: roactModule (copy), premiumUpsellPromptModule (copy), props (ref), p1 (ref), completeFlowInStudioAccept (copy)
			return roactModule.createElement(premiumUpsellPromptModule, {
				screenSize = props.screenSize,
				isCatalog = props.isCatalog,
				currencySymbol = props.currencySymbol,
				robuxPrice = props.robuxPrice,
				robuxAmount = props.robuxAmount,
				acceptControllerIcon = props.acceptControllerIcon,
				purchasePremiumActivated = function()
					-- upvalues: p1 (copy), props (copy), completeFlowInStudioAccept (copy)
					p1:reportUserInput("Subscribe")
					props.purchasePremium()
					
					if completeFlowInStudioAccept and game:GetService("RunService"):IsStudio() then
						props.flowComplete()
					end
					p1:closeCentralOverlay()
				end,
				cancelPurchaseActivated = function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("Cancel")
					props.cancelPurchase()
					p1:closeCentralOverlay()
				end
			})
		end
	}
end

function name.constructPurchaseErrorPromptAnimatorObj(p1)
	-- upvalues: premiumUpsellFlowStateModule (ref), roactModule (ref), purchaseErrorPromptModule (ref)
	local props = p1.props
	
	return {
		shouldAnimate = true,
		shouldShow = props.purchaseState == premiumUpsellFlowStateModule.Error,
		renderChildren = function()
			-- upvalues: roactModule (copy), purchaseErrorPromptModule (copy), props (ref), p1 (ref)
			return roactModule.createElement(purchaseErrorPromptModule, {
				screenSize = props.screenSize,
				errorType = props.errorType,
				economicRestrictionError = props.economicRestrictionError,
				doneControllerIcon = props.acceptControllerIcon,
				doneActivated = function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("Done")
					props.flowComplete()
					p1:closeCentralOverlay()
				end
			})
		end
	}
end

function name.constructPurchaseVPCPromptAnimatorObj(p1)
	-- upvalues: premiumUpsellFlowStateModule (ref), roactModule (ref), verifiedParentalConsentDialog (ref)
	local props = p1.props
	p1:BindCancelAction()
	
	return {
		shouldAnimate = true,
		shouldShow = props.purchaseState == premiumUpsellFlowStateModule.PurchaseVPCModal,
		renderChildren = function()
			-- upvalues: roactModule (copy), verifiedParentalConsentDialog (copy), props (ref), p1 (ref)
			return roactModule.createElement(verifiedParentalConsentDialog, {
				isActionable = false,
				screenSize = props.screenSize,
				modalType = props.purchaseVPCType,
				onDismiss = function()
					-- upvalues: p1 (copy), props (copy)
					p1:reportUserInput("Cancel")
					props.cancelPurchase()
					p1:closeCentralOverlay()
				end
			})
		end
	}
end

function name.dispatchCentralOverlayAndRenderModal(p1, p2)
	-- upvalues: getEnableCentralOverlayForUpsellPromptModule (ref), premiumUpsellFlowStateModule (ref), constantsModule (ref)
	if not getEnableCentralOverlayForUpsellPromptModule() or not p2.dispatchCentralOverlay then return end
	local purchaseState = p2.purchaseState
	
	if purchaseState == premiumUpsellFlowStateModule.PurchaseModal then
		p2.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructPremiumUpsellPromptAnimatorObj())
	end
	if purchaseState == premiumUpsellFlowStateModule.Error then
		p2.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructPurchaseErrorPromptAnimatorObj())
	end
	if purchaseState == premiumUpsellFlowStateModule.PurchaseVPCModal then
		p2.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, p1:constructPurchaseVPCPromptAnimatorObj())
	end
end

function name.reportModalShown(p1)
	-- upvalues: getModalShownEventDataModule (ref), premiumUpsellFlowStateModule (ref), httpService (ref)
	local props = p1.props
	local state = p1.state
	
	if p1.props.onAnalyticEvent then
		props.onAnalyticEvent("UserPurchaseFlow", getModalShownEventDataModule(state.analyticId, props.eventPrefix, "PremiumUpsell", premiumUpsellFlowStateModule.toRawValue(props.purchaseState), httpService:JSONEncode({ universe_id = tostring(game.GameId) })))
		
		return
	end
end

function name.reportUserInput(p1, p2)
	-- upvalues: getUserInputEventDataModule (ref), premiumUpsellFlowStateModule (ref), httpService (ref)
	local props = p1.props
	local state = p1.state
	
	if p1.props.onAnalyticEvent then
		props.onAnalyticEvent("UserPurchaseFlow", getUserInputEventDataModule(state.analyticId, props.eventPrefix, "PremiumUpsell", premiumUpsellFlowStateModule.toRawValue(props.purchaseState), p2, httpService:JSONEncode({ universe_id = tostring(game.GameId) })))
		
		return
	end
end

function name.getChildrenElements(p1)
	-- upvalues: roactModule (ref), animatorModule (ref)
	return {
		PremiumUpsellPromptAnimator = roactModule.createElement(animatorModule, p1:constructPremiumUpsellPromptAnimatorObj()),
		PurchaseErrorPromptAnimator = roactModule.createElement(animatorModule, p1:constructPurchaseErrorPromptAnimatorObj()),
		PurchaseVPCPromptAnimator = roactModule.createElement(animatorModule, p1:constructPurchaseVPCPromptAnimatorObj())
	}
end

function name.render(p1)
	-- upvalues: getEnableCentralOverlayForUpsellPromptModule (ref), roactModule (ref)
	return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, if not (getEnableCentralOverlayForUpsellPromptModule() and p1.props.dispatchCentralOverlay) then p1:getChildrenElements() else {})
end

return name