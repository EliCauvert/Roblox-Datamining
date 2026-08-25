local httpService = game:GetService("HttpService")
local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local getPartialPageModalMiddleContentWidth = require(parent_2.UIBlox).App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local subscriptionPurchaseFlowStateModule = require(parent.SubscriptionPurchaseFlowState)
local animatorModule = require(parent_1.Generic.Animator)
local purchaseErrorPromptModule = require(parent_1.Generic.PurchaseErrorPrompt)
local subscriptionPurchasePromptModule = require(parent_1.Subscription.SubscriptionPurchasePrompt)
local getEnableDisableSubPurchaseModule = require(parent_1.Flags.getEnableDisableSubPurchase)
local formatSubscriptionPurchaseEventDataModule = require(parent_1.Utility.formatSubscriptionPurchaseEventData)
local name = roactModule.Component:extend(script.Name)
local purchaseFlowTypeModule = require(parent_1.Generic.PurchaseFlowType)
local verifiedParentalConsentDialog = require(parent_2.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog

function name.init(p0)
	-- upvalues: httpService (ref)
	p0.state = { analyticId = httpService:GenerateGUID(false) }
end

function name.didUpdate(p1, p2, _)
	if p2.purchaseState ~= p1.props.purchaseState then
		p1:reportPurchaseEvent("ViewShown")
	end
end

function name.reportUserInput(p3, p4)
	p3:reportPurchaseEvent("UserInput", p4)
end

function name.reportPurchaseEvent(p5, p6, p7)
	-- upvalues: formatSubscriptionPurchaseEventDataModule (ref), subscriptionPurchaseFlowStateModule (ref)
	local props = p5.props
	
	if props.onAnalyticEvent then
		props.onAnalyticEvent("SubscriptionPurchase", formatSubscriptionPurchaseEventDataModule(p5.state.analyticId, p6, subscriptionPurchaseFlowStateModule.toRawValue(props.purchaseState), p7, props.subscriptionProviderId, props.subscriptionId, props.name, props.description, props.period, props.priceTier, props.displayPrice))
		
		return
	end
end

function name.render(p8)
	-- upvalues: getPartialPageModalMiddleContentWidth (ref), roactModule (ref), animatorModule (ref), subscriptionPurchaseFlowStateModule (ref), subscriptionPurchasePromptModule (ref), getEnableDisableSubPurchaseModule (ref), purchaseErrorPromptModule (ref), purchaseFlowTypeModule (ref), verifiedParentalConsentDialog (ref)
	local props = p8.props
	local purchaseState = props.purchaseState
	
	return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		SubscriptionPurchasePromptAnimator = roactModule.createElement(animatorModule, {
			shouldAnimate = true,
			shouldShow = purchaseState == subscriptionPurchaseFlowStateModule.PurchaseModal,
			animateDown = getPartialPageModalMiddleContentWidth(props.screenSize.X) == 492,
			renderChildren = function()
				-- upvalues: roactModule (copy), subscriptionPurchasePromptModule (copy), props (ref), getEnableDisableSubPurchaseModule (copy), p8 (ref)
				return roactModule.createElement(subscriptionPurchasePromptModule, {
					name = props.name,
					subscriptionProviderName = props.subscriptionProviderName,
					displayPrice = props.displayPrice,
					period = props.period,
					disclaimerText = props.disclaimerText,
					description = props.description,
					itemIcon = props.itemIcon,
					disablePurchase = if getEnableDisableSubPurchaseModule() or props.shouldUseNewModalDesign then props.disablePurchase else nil,
					disablePurchaseText = if getEnableDisableSubPurchaseModule() or props.shouldUseNewModalDesign then props.disablePurchaseText else nil,
					shouldUseNewModalDesign = props.shouldUseNewModalDesign,
					isRobuxSubscription = props.isRobuxSubscription,
					creatorName = props.creatorName,
					creatorVerified = props.creatorVerified,
					primaryPaymentMethod = props.primaryPaymentMethod,
					secondaryPaymentMethod = props.secondaryPaymentMethod,
					isTestingMode = props.isTestingMode,
					screenSize = props.screenSize,
					purchaseSubscriptionActivated = function(p9)
						-- upvalues: p8 (copy), props (copy)
						p8:reportUserInput("Subscribe")
						props.purchaseSubscription(p9)
						
						if props.isTestingMode then
							props.flowComplete()
						end
					end,
					cancelPurchaseActivated = function()
						-- upvalues: p8 (copy), props (copy)
						p8:reportUserInput("Cancel")
						props.cancelPurchase()
					end,
					onReport = if props.shouldUseNewModalDesign then props.onReport else nil,
					onShare = if props.shouldUseNewModalDesign then props.onShare else nil
				})
			end
		}),
		PurchaseErrorPromptAnimator = roactModule.createElement(animatorModule, {
			shouldAnimate = true,
			shouldShow = purchaseState == subscriptionPurchaseFlowStateModule.Error,
			renderChildren = function()
				-- upvalues: roactModule (copy), purchaseErrorPromptModule (copy), props (ref), purchaseFlowTypeModule (copy), p8 (ref)
				return roactModule.createElement(purchaseErrorPromptModule, {
					screenSize = props.screenSize,
					errorType = props.errorType,
					economicRestrictionError = props.economicRestrictionError,
					flowType = purchaseFlowTypeModule.Subscription,
					doneControllerIcon = props.acceptControllerIcon,
					doneActivated = function()
						-- upvalues: p8 (copy), props (copy)
						p8:reportUserInput("Done")
						props.flowComplete()
					end
				})
			end
		}),
		PurchaseVPCPromptAnimator = roactModule.createElement(animatorModule, {
			shouldAnimate = true,
			shouldShow = purchaseState == subscriptionPurchaseFlowStateModule.PurchaseVPCModal,
			renderChildren = function()
				-- upvalues: roactModule (copy), verifiedParentalConsentDialog (copy), props (ref), p8 (ref)
				return roactModule.createElement(verifiedParentalConsentDialog, {
					screenSize = props.screenSize,
					isActionable = props.openSettingsPage ~= nil,
					modalType = props.purchaseVPCType,
					onAction = props.openSettingsPage and function()
						-- upvalues: p8 (copy), props (copy)
						p8:reportUserInput("Confirm")
						props.openSettingsPage()
						props.flowComplete()
					end,
					onDismiss = function()
						-- upvalues: p8 (copy), props (copy)
						p8:reportUserInput("Cancel")
						props.cancelPurchase()
					end
				})
			end
		})
	})
end

return name