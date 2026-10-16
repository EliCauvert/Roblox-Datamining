local HttpService = game:GetService("HttpService")
local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local GetPartialPageModalMiddleContentWidthFunction = require(Parent2.UIBlox).App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local SubscriptionPurchaseFlowStateModule = require(Parent.SubscriptionPurchaseFlowState)
local AnimatorModule = require(Parent1.Generic.Animator)
local PurchaseErrorPromptModule = require(Parent1.Generic.PurchaseErrorPrompt)
local SubscriptionPurchasePromptModule = require(Parent1.Subscription.SubscriptionPurchasePrompt)
local FormatSubscriptionPurchaseEventDataModule = require(Parent1.Utility.formatSubscriptionPurchaseEventData)
local ExtendResult = RoactModule.Component:extend(script.Name)
local PurchaseFlowTypeModule = require(Parent1.Generic.PurchaseFlowType)
local VerifiedParentalConsentDialog = require(Parent2.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog

function ExtendResult.init(p1) --[[ Line: 77 ]]
	-- upvalues: HttpService (copy)
	p1.state = { analyticId = HttpService:GenerateGUID(false) }
end

function ExtendResult.didUpdate(p1, p2, _) --[[ Line: 83 ]]
	if p2.purchaseState ~= p1.props.purchaseState then
		p1:reportPurchaseEvent("ViewShown")
	end
end

function ExtendResult.reportUserInput(p1, p2) --[[ Line: 91 ]]
	p1:reportPurchaseEvent("UserInput", p2)
end

function ExtendResult.reportPurchaseEvent(p1, p2, p3) --[[ Line: 95 ]]
	-- upvalues: FormatSubscriptionPurchaseEventDataModule (copy), SubscriptionPurchaseFlowStateModule (copy)
	local Props = p1.props
	
	if Props.onAnalyticEvent then
		Props.onAnalyticEvent("SubscriptionPurchase", (FormatSubscriptionPurchaseEventDataModule(p1.state.analyticId, p2, SubscriptionPurchaseFlowStateModule.toRawValue(Props.purchaseState), p3, Props.subscriptionProviderId, Props.subscriptionId, Props.name, Props.description, Props.period, Props.priceTier, Props.displayPrice)))
		
		return
	end
end

function ExtendResult.render(p1) --[[ Line: 119 ]]
	-- upvalues: GetPartialPageModalMiddleContentWidthFunction (copy), RoactModule (copy), AnimatorModule (copy), SubscriptionPurchaseFlowStateModule (copy), SubscriptionPurchasePromptModule (copy), PurchaseErrorPromptModule (copy), PurchaseFlowTypeModule (copy), VerifiedParentalConsentDialog (copy)
	local Props = p1.props
	local PurchaseState = Props.purchaseState
	
	return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		SubscriptionPurchasePromptAnimator = RoactModule.createElement(AnimatorModule, {
			shouldAnimate = true,
			shouldShow = PurchaseState == SubscriptionPurchaseFlowStateModule.PurchaseModal,
			animateDown = GetPartialPageModalMiddleContentWidthFunction(Props.screenSize.X) == 492,
			renderChildren = function() --[[ Line: 133 ]]
				-- upvalues: RoactModule (upval), SubscriptionPurchasePromptModule (upval), Props (copy), p1 (copy)
				return RoactModule.createElement(SubscriptionPurchasePromptModule, {
					name = Props.name,
					subscriptionProviderName = Props.subscriptionProviderName,
					displayPrice = Props.displayPrice,
					period = Props.period,
					disclaimerText = Props.disclaimerText,
					description = Props.description,
					itemIcon = Props.itemIcon,
					disablePurchase = Props.disablePurchase,
					disablePurchaseText = Props.disablePurchaseText,
					shouldUseNewModalDesign = Props.shouldUseNewModalDesign,
					isRobuxSubscription = Props.isRobuxSubscription,
					creatorName = Props.creatorName,
					creatorVerified = Props.creatorVerified,
					primaryPaymentMethod = Props.primaryPaymentMethod,
					secondaryPaymentMethod = Props.secondaryPaymentMethod,
					isTestingMode = Props.isTestingMode,
					screenSize = Props.screenSize,
					purchaseSubscriptionActivated = function(p2) --[[ Line: 155 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Subscribe")
						Props.purchaseSubscription(p2)
						
						if Props.isTestingMode then
							Props.flowComplete()
						end
					end,
					cancelPurchaseActivated = function() --[[ Line: 162 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Cancel")
						Props.cancelPurchase()
					end,
					onReport = if Props.shouldUseNewModalDesign then Props.onReport else nil,
					onShare = if Props.shouldUseNewModalDesign then Props.onShare else nil
				})
			end
		}),
		PurchaseErrorPromptAnimator = RoactModule.createElement(AnimatorModule, {
			shouldAnimate = true,
			shouldShow = PurchaseState == SubscriptionPurchaseFlowStateModule.Error,
			renderChildren = function() --[[ Line: 174 ]]
				-- upvalues: RoactModule (upval), PurchaseErrorPromptModule (upval), Props (copy), PurchaseFlowTypeModule (upval), p1 (copy)
				return RoactModule.createElement(PurchaseErrorPromptModule, {
					screenSize = Props.screenSize,
					errorType = Props.errorType,
					economicRestrictionError = Props.economicRestrictionError,
					flowType = PurchaseFlowTypeModule.Subscription,
					doneControllerIcon = Props.acceptControllerIcon,
					doneActivated = function() --[[ Line: 183 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Done")
						Props.flowComplete()
					end
				})
			end
		}),
		PurchaseVPCPromptAnimator = RoactModule.createElement(AnimatorModule, {
			shouldAnimate = true,
			shouldShow = PurchaseState == SubscriptionPurchaseFlowStateModule.PurchaseVPCModal,
			renderChildren = function() --[[ Line: 193 ]]
				-- upvalues: RoactModule (upval), VerifiedParentalConsentDialog (upval), Props (copy), p1 (copy)
				return RoactModule.createElement(VerifiedParentalConsentDialog, {
					screenSize = Props.screenSize,
					isActionable = Props.openSettingsPage ~= nil,
					modalType = Props.purchaseVPCType,
					onAction = Props.openSettingsPage and function() --[[ Line: 198 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Confirm")
						Props.openSettingsPage()
						Props.flowComplete()
					end,
					onDismiss = function() --[[ Line: 203 ]]
						-- upvalues: p1 (upval), Props (upval)
						p1:reportUserInput("Cancel")
						Props.cancelPurchase()
					end
				})
			end
		})
	})
end

return ExtendResult