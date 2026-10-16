local HttpService = game:GetService("HttpService")
local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local BuyRobuxFlowStateModule = require(Parent.BuyRobuxFlowState)
local ConstantsModule = require(Parent1.Generic.Constants)
local LoadingOverlayModule = require(Parent1.Generic.LoadingOverlay)
local LoadingOverlayStateModule = require(Parent1.Generic.LoadingOverlayState)
local BuyRobuxPageModule = require(Parent1.BuyRobux.BuyRobuxPage)
local PurchaseErrorPromptModule = require(Parent1.Generic.PurchaseErrorPrompt)
local U13ConfirmPromptModule = require(Parent1.Generic.U13ConfirmPrompt)
local GetModalShownEventDataModule = require(Parent1.Utility.getModalShownEventData)
local GetUserInputEventDataModule = require(Parent1.Utility.getUserInputEventData)
local VerifiedParentalConsentDialog = require(Parent2.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog
local ExtendResult = RoactModule.Component:extend(script.Name)

function ExtendResult.init(p1) --[[ Line: 62 ]]
	-- upvalues: HttpService (copy)
	p1.state = {
		analyticId = if p1.props.analyticId then p1.props.analyticId else HttpService:GenerateGUID(false)
	}
end

function ExtendResult.didUpdate(p1, p2, _) --[[ Line: 68 ]]
	local Props = p1.props
	
	if p2.purchaseState ~= Props.purchaseState then
		p1:reportModalShown()
		p1:dispatchAndRenderModal(Props)
	end
end

function ExtendResult.dispatchAndRenderModal(p1, Props) --[[ Line: 78 ]]
	-- upvalues: BuyRobuxFlowStateModule (copy), ConstantsModule (copy), RoactModule (copy), PurchaseErrorPromptModule (copy), U13ConfirmPromptModule (copy), VerifiedParentalConsentDialog (copy)
	if Props.purchaseState == BuyRobuxFlowStateModule.Error then
		Props.dispatchCentralOverlay(ConstantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, {
			shouldAnimate = Props.shouldAnimate,
			shouldShow = Props.purchaseState == BuyRobuxFlowStateModule.Error,
			renderChildren = function() --[[ Line: 83 ]]
				-- upvalues: RoactModule (upval), PurchaseErrorPromptModule (upval), Props (copy), p1 (copy)
				return RoactModule.createElement(PurchaseErrorPromptModule, {
					screenSize = Props.screenSize,
					errorType = Props.errorType,
					economicRestrictionError = Props.economicRestrictionError,
					doneControllerIcon = Props.acceptControllerIcon,
					doneActivated = function() --[[ Line: 92 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Done")
						Props.flowComplete()
						Props.dispatchCentralOverlay()
					end
				})
			end
		})
		
		return
	end
	if Props.purchaseState == BuyRobuxFlowStateModule.PurchaseWarning then
		Props.dispatchCentralOverlay(ConstantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, {
			shouldAnimate = Props.shouldAnimate,
			shouldShow = Props.purchaseState == BuyRobuxFlowStateModule.PurchaseWarning,
			renderChildren = function() --[[ Line: 107 ]]
				-- upvalues: RoactModule (upval), U13ConfirmPromptModule (upval), Props (copy), p1 (copy)
				return RoactModule.createElement(U13ConfirmPromptModule, {
					screenSize = Props.screenSize,
					modalType = Props.u13ConfirmType,
					doneActivated = function() --[[ Line: 113 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Confirm")
						Props.acceptPurchaseWarning()
						Props.dispatchCentralOverlay()
					end,
					cancelActivated = function() --[[ Line: 118 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Cancel")
						Props.cancelPurchase()
						Props.dispatchCentralOverlay()
					end
				})
			end
		})
		
		return
	end
	if Props.purchaseState == BuyRobuxFlowStateModule.PurchaseVPC then
		Props.dispatchCentralOverlay(ConstantsModule.CENTRAL_OVERLAY_TYPE_ANIMATOR, {
			shouldAnimate = Props.shouldAnimate,
			shouldShow = Props.purchaseState == BuyRobuxFlowStateModule.PurchaseVPC,
			renderChildren = function() --[[ Line: 133 ]]
				-- upvalues: RoactModule (upval), VerifiedParentalConsentDialog (upval), Props (copy), p1 (copy)
				return RoactModule.createElement(VerifiedParentalConsentDialog, {
					isActionable = false,
					screenSize = Props.screenSize,
					modalType = Props.purchaseVPCType,
					onDismiss = function() --[[ Line: 138 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Close")
						Props.flowComplete()
						Props.dispatchCentralOverlay()
					end
				})
			end
		})
	end
end

function ExtendResult.reportModalShown(p1) --[[ Line: 149 ]]
	-- upvalues: GetModalShownEventDataModule (copy), BuyRobuxFlowStateModule (copy)
	local Props = p1.props
	local State = p1.state
	
	if p1.props.onAnalyticEvent then
		Props.onAnalyticEvent("UserPurchaseFlow", (GetModalShownEventDataModule(State.analyticId, "", "BuyRobux", BuyRobuxFlowStateModule.toRawValue(Props.purchaseState))))
		
		return
	end
end

function ExtendResult.reportUserInput(p1, p2) --[[ Line: 163 ]]
	-- upvalues: GetUserInputEventDataModule (copy), BuyRobuxFlowStateModule (copy)
	local Props = p1.props
	local State = p1.state
	
	if p1.props.onAnalyticEvent then
		Props.onAnalyticEvent("UserPurchaseFlow", (GetUserInputEventDataModule(State.analyticId, "", "BuyRobux", BuyRobuxFlowStateModule.toRawValue(Props.purchaseState), p2)))
		
		return
	end
end

function ExtendResult:purchaseStateToOverlayState(PurchaseState) --[[ Line: 182 ]]
	-- upvalues: BuyRobuxFlowStateModule (copy), LoadingOverlayStateModule (copy)
	return if PurchaseState == BuyRobuxFlowStateModule.Loading then LoadingOverlayStateModule.Loading elseif PurchaseState == BuyRobuxFlowStateModule.RobuxPurchasePending then LoadingOverlayStateModule.PurchasingRobux elseif PurchaseState == BuyRobuxFlowStateModule.RobuxGrantPending then LoadingOverlayStateModule.WaitingForRobux elseif PurchaseState == BuyRobuxFlowStateModule.PurchaseWarning then LoadingOverlayStateModule.None elseif PurchaseState == BuyRobuxFlowStateModule.None then LoadingOverlayStateModule.None else nil
end

function ExtendResult.render(p1) --[[ Line: 198 ]]
	-- upvalues: RoactModule (copy), BuyRobuxPageModule (copy), BuyRobuxFlowStateModule (copy), LoadingOverlayModule (copy)
	local Props = p1.props
	local PurchaseStateToOverlayStateResult = p1:purchaseStateToOverlayState(Props.purchaseState)
	
	return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		BuyRobuxFrame = RoactModule.createElement(BuyRobuxPageModule, {
			showCloseButton = Props.showCloseButton,
			showBackground = Props.showBackground,
			isConsoleSize = Props.isConsoleSize,
			robuxBalance = Props.robuxBalance,
			robuxPackages = Props.robuxPackages,
			robuxPackageActivated = function(p2) --[[ Line: 217 ]]
				-- upvalues: p1 (copy), Props (copy)
				p1:reportUserInput("Confirm")
				Props.purchaseRobux(p2)
			end,
			onPageClose = Props.onPageClose,
			hasNativePurchaseSucceeded = Props.purchaseState == BuyRobuxFlowStateModule.Succeed,
			shouldAnimate = Props.shouldAnimate,
			analyticId = p1.state.analyticId,
			onAnalyticEvent = Props.onAnalyticEvent
		}),
		LoadingOverlay = RoactModule.createElement(LoadingOverlayModule, {
			shouldAnimate = false,
			showOverlay = PurchaseStateToOverlayStateResult ~= nil,
			loadingState = PurchaseStateToOverlayStateResult
		})
	})
end

return ExtendResult