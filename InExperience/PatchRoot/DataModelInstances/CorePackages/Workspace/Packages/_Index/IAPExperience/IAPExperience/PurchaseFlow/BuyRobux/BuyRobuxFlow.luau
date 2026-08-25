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

function name.init(p0)
	-- upvalues: httpService (ref)
	p0.state = {
		analyticId = if p0.props.analyticId then p0.props.analyticId else httpService:GenerateGUID(false)
	}
end

function name.didUpdate(p1, p2, _)
	local props = p1.props
	
	if p2.purchaseState ~= props.purchaseState then
		p1:reportModalShown()
		p1:dispatchAndRenderModal(props)
	end
end

function name.dispatchAndRenderModal(p3, p4)
	-- upvalues: buyRobuxFlowStateModule (ref), constantsModule (ref), roactModule (ref), purchaseErrorPromptModule (ref), u13ConfirmPromptModule (ref), verifiedParentalConsentDialog (ref)
	if p4.purchaseState == buyRobuxFlowStateModule.Error then
		p4.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, {
			shouldAnimate = p4.shouldAnimate,
			shouldShow = p4.purchaseState == buyRobuxFlowStateModule.Error,
			renderChildren = function()
				-- upvalues: roactModule (copy), purchaseErrorPromptModule (copy), p4 (ref), p3 (ref)
				return roactModule.createElement(purchaseErrorPromptModule, {
					screenSize = p4.screenSize,
					errorType = p4.errorType,
					economicRestrictionError = p4.economicRestrictionError,
					doneControllerIcon = p4.acceptControllerIcon,
					doneActivated = function()
						-- upvalues: p3 (copy), p4 (copy)
						p3:reportUserInput("Done")
						p4.flowComplete()
						p4.dispatchCentralOverlay()
					end
				})
			end
		})
		
		return
	elseif p4.purchaseState == buyRobuxFlowStateModule.PurchaseWarning then
		p4.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, {
			shouldAnimate = p4.shouldAnimate,
			shouldShow = p4.purchaseState == buyRobuxFlowStateModule.PurchaseWarning,
			renderChildren = function()
				-- upvalues: roactModule (copy), u13ConfirmPromptModule (copy), p4 (ref), p3 (ref)
				return roactModule.createElement(u13ConfirmPromptModule, {
					screenSize = p4.screenSize,
					modalType = p4.u13ConfirmType,
					doneActivated = function()
						-- upvalues: p3 (copy), p4 (copy)
						p3:reportUserInput("Confirm")
						p4.acceptPurchaseWarning()
						p4.dispatchCentralOverlay()
					end,
					cancelActivated = function()
						-- upvalues: p3 (copy), p4 (copy)
						p3:reportUserInput("Cancel")
						p4.cancelPurchase()
						p4.dispatchCentralOverlay()
					end
				})
			end
		})
		
		return
	elseif p4.purchaseState == buyRobuxFlowStateModule.PurchaseVPC then
		p4.dispatchCentralOverlay(constantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, {
			shouldAnimate = p4.shouldAnimate,
			shouldShow = p4.purchaseState == buyRobuxFlowStateModule.PurchaseVPC,
			renderChildren = function()
				-- upvalues: roactModule (copy), verifiedParentalConsentDialog (copy), p4 (ref), p3 (ref)
				return roactModule.createElement(verifiedParentalConsentDialog, {
					isActionable = false,
					screenSize = p4.screenSize,
					modalType = p4.purchaseVPCType,
					onDismiss = function()
						-- upvalues: p3 (copy), p4 (copy)
						p3:reportUserInput("Close")
						p4.flowComplete()
						p4.dispatchCentralOverlay()
					end
				})
			end
		})
	end
end

function name.reportModalShown(p5)
	-- upvalues: getModalShownEventDataModule (ref), buyRobuxFlowStateModule (ref)
	local props = p5.props
	local state = p5.state
	
	if p5.props.onAnalyticEvent then
		props.onAnalyticEvent("UserPurchaseFlow", getModalShownEventDataModule(state.analyticId, "", "BuyRobux", buyRobuxFlowStateModule.toRawValue(props.purchaseState)))
		
		return
	end
end

function name.reportUserInput(p6, p7)
	-- upvalues: getUserInputEventDataModule (ref), buyRobuxFlowStateModule (ref)
	local props = p6.props
	local state = p6.state
	
	if p6.props.onAnalyticEvent then
		props.onAnalyticEvent("UserPurchaseFlow", getUserInputEventDataModule(state.analyticId, "", "BuyRobux", buyRobuxFlowStateModule.toRawValue(props.purchaseState), p7))
		
		return
	end
end

function name.purchaseStateToOverlayState(_, p8)
	-- upvalues: buyRobuxFlowStateModule (ref), loadingOverlayStateModule (ref)
	return if p8 == buyRobuxFlowStateModule.Loading then loadingOverlayStateModule.Loading elseif p8 == buyRobuxFlowStateModule.RobuxPurchasePending then loadingOverlayStateModule.PurchasingRobux elseif p8 == buyRobuxFlowStateModule.RobuxGrantPending then loadingOverlayStateModule.WaitingForRobux elseif p8 == buyRobuxFlowStateModule.PurchaseWarning then loadingOverlayStateModule.None elseif p8 == buyRobuxFlowStateModule.None then loadingOverlayStateModule.None else nil
end

function name.render(p9)
	-- upvalues: roactModule (ref), buyRobuxPageModule (ref), buyRobuxFlowStateModule (ref), loadingOverlayModule (ref)
	local props = p9.props
	local purchaseState = p9:purchaseStateToOverlayState(props.purchaseState)
	
	return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		BuyRobuxFrame = roactModule.createElement(buyRobuxPageModule, {
			showCloseButton = props.showCloseButton,
			showBackground = props.showBackground,
			isConsoleSize = props.isConsoleSize,
			robuxBalance = props.robuxBalance,
			robuxPackages = props.robuxPackages,
			robuxPackageActivated = function(p10)
				-- upvalues: p9 (ref), props (ref)
				p9:reportUserInput("Confirm")
				props.purchaseRobux(p10)
			end,
			onPageClose = props.onPageClose,
			hasNativePurchaseSucceeded = props.purchaseState == buyRobuxFlowStateModule.Succeed,
			shouldAnimate = props.shouldAnimate,
			analyticId = p9.state.analyticId,
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