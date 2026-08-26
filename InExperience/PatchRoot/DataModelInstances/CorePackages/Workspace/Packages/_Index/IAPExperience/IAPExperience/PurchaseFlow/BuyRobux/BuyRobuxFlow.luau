local httpService = game:GetService("HttpService")
local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local buyRobuxFlowStateModule = require(parent.BuyRobuxFlowState)
local constantsModule = require(parent_1.Generic.Constants)
local loadingOverlayModule = require(parent_1.Generic.LoadingOverlay)
local loadingOverlayStateModule = require(parent_1.Generic.LoadingOverlayState)
local buyRobuxPageModule = require(parent_1.BuyRobux.BuyRobuxPage)
local purchaseErrorPromptModule = require(parent_1.Generic.PurchaseErrorPrompt)
local u13ConfirmPromptModule = require(parent_1.Generic.U13ConfirmPrompt)
local getModalShownEventDataModule = require(parent_1.Utility.getModalShownEventData)
local getUserInputEventDataModule = require(parent_1.Utility.getUserInputEventData)
local verifiedParentalConsentDialog = require(parent_2.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog
local name = roactModule.Component:extend(script.Name)

function name.init(p1)
	-- upvalues: httpService (ref)
	p1.state = {
		analyticId = if p1.props.analyticId then p1.props.analyticId else httpService:GenerateGUID(false)
	}
end

function name.didUpdate(p1, p2, _)
	local props = p1.props
	
	if p2.purchaseState ~= props.purchaseState then
		p1:reportModalShown()
		p1:dispatchAndRenderModal(props)
	end
end

function name.dispatchAndRenderModal(p1, p2)
	-- upvalues: buyRobuxFlowStateModule (ref), constantsModule (ref), roactModule (ref), purchaseErrorPromptModule (ref), u13ConfirmPromptModule (ref), verifiedParentalConsentDialog (ref)
	if p2.purchaseState == buyRobuxFlowStateModule.Error then
		p2.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, {
			shouldAnimate = p2.shouldAnimate,
			shouldShow = p2.purchaseState == buyRobuxFlowStateModule.Error,
			renderChildren = function()
				-- upvalues: roactModule (copy), purchaseErrorPromptModule (copy), p2 (ref), p1 (ref)
				return roactModule.createElement(purchaseErrorPromptModule, {
					screenSize = p2.screenSize,
					errorType = p2.errorType,
					economicRestrictionError = p2.economicRestrictionError,
					doneControllerIcon = p2.acceptControllerIcon,
					doneActivated = function()
						-- upvalues: p1 (copy), p2 (copy)
						p1:reportUserInput("Done")
						p2.flowComplete()
						p2.dispatchCentralOverlay()
					end
				})
			end
		})
		
		return
	elseif p2.purchaseState == buyRobuxFlowStateModule.PurchaseWarning then
		p2.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, {
			shouldAnimate = p2.shouldAnimate,
			shouldShow = p2.purchaseState == buyRobuxFlowStateModule.PurchaseWarning,
			renderChildren = function()
				-- upvalues: roactModule (copy), u13ConfirmPromptModule (copy), p2 (ref), p1 (ref)
				return roactModule.createElement(u13ConfirmPromptModule, {
					screenSize = p2.screenSize,
					modalType = p2.u13ConfirmType,
					doneActivated = function()
						-- upvalues: p1 (copy), p2 (copy)
						p1:reportUserInput("Confirm")
						p2.acceptPurchaseWarning()
						p2.dispatchCentralOverlay()
					end,
					cancelActivated = function()
						-- upvalues: p1 (copy), p2 (copy)
						p1:reportUserInput("Cancel")
						p2.cancelPurchase()
						p2.dispatchCentralOverlay()
					end
				})
			end
		})
		
		return
	elseif p2.purchaseState == buyRobuxFlowStateModule.PurchaseVPC then
		p2.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, {
			shouldAnimate = p2.shouldAnimate,
			shouldShow = p2.purchaseState == buyRobuxFlowStateModule.PurchaseVPC,
			renderChildren = function()
				-- upvalues: roactModule (copy), verifiedParentalConsentDialog (copy), p2 (ref), p1 (ref)
				return roactModule.createElement(verifiedParentalConsentDialog, {
					isActionable = false,
					screenSize = p2.screenSize,
					modalType = p2.purchaseVPCType,
					onDismiss = function()
						-- upvalues: p1 (copy), p2 (copy)
						p1:reportUserInput("Close")
						p2.flowComplete()
						p2.dispatchCentralOverlay()
					end
				})
			end
		})
	end
end

function name.reportModalShown(p1)
	-- upvalues: getModalShownEventDataModule (ref), buyRobuxFlowStateModule (ref)
	local props = p1.props
	local state = p1.state
	
	if p1.props.onAnalyticEvent then
		props.onAnalyticEvent("UserPurchaseFlow", getModalShownEventDataModule(state.analyticId, "", "BuyRobux", buyRobuxFlowStateModule.toRawValue(props.purchaseState)))
		
		return
	end
end

function name.reportUserInput(p1, p2)
	-- upvalues: getUserInputEventDataModule (ref), buyRobuxFlowStateModule (ref)
	local props = p1.props
	local state = p1.state
	
	if p1.props.onAnalyticEvent then
		props.onAnalyticEvent("UserPurchaseFlow", getUserInputEventDataModule(state.analyticId, "", "BuyRobux", buyRobuxFlowStateModule.toRawValue(props.purchaseState), p2))
		
		return
	end
end

function name.purchaseStateToOverlayState(_, p1)
	-- upvalues: buyRobuxFlowStateModule (ref), loadingOverlayStateModule (ref)
	return if p1 == buyRobuxFlowStateModule.Loading then loadingOverlayStateModule.Loading elseif p1 == buyRobuxFlowStateModule.RobuxPurchasePending then loadingOverlayStateModule.PurchasingRobux elseif p1 == buyRobuxFlowStateModule.RobuxGrantPending then loadingOverlayStateModule.WaitingForRobux elseif p1 == buyRobuxFlowStateModule.PurchaseWarning then loadingOverlayStateModule.None elseif p1 == buyRobuxFlowStateModule.None then loadingOverlayStateModule.None else nil
end

function name.render(p1)
	-- upvalues: roactModule (ref), buyRobuxPageModule (ref), buyRobuxFlowStateModule (ref), loadingOverlayModule (ref)
	local props = p1.props
	local purchaseState = p1:purchaseStateToOverlayState(props.purchaseState)
	
	return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		BuyRobuxFrame = roactModule.createElement(buyRobuxPageModule, {
			showCloseButton = props.showCloseButton,
			showBackground = props.showBackground,
			isConsoleSize = props.isConsoleSize,
			robuxBalance = props.robuxBalance,
			robuxPackages = props.robuxPackages,
			robuxPackageActivated = function(p2)
				-- upvalues: p1 (ref), props (ref)
				p1:reportUserInput("Confirm")
				props.purchaseRobux(p2)
			end,
			onPageClose = props.onPageClose,
			hasNativePurchaseSucceeded = props.purchaseState == buyRobuxFlowStateModule.Succeed,
			shouldAnimate = props.shouldAnimate,
			analyticId = p1.state.analyticId,
			onAnalyticEvent = props.onAnalyticEvent
		}),
		LoadingOverlay = roactModule.createElement(loadingOverlayModule, {
			shouldAnimate = false,
			showOverlay = purchaseState ~= nil,
			loadingState = purchaseState
		})
	})
end

return name