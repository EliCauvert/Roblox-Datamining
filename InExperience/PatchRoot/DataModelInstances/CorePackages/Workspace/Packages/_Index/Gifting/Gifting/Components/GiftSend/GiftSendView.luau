local parent = script:FindFirstAncestor("Gifting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local giftAllowanceViewModule = require(script.Parent.Parent.GiftAllowance.GiftAllowanceView)
local giftSheetLayoutViewModule = require(script.Parent.Parent.GiftSheetLayout.GiftSheetLayoutView)
local giftStateViewModule = require(script.Parent.Parent.GiftState.GiftStateView)
local userInfoPanelViewModule = require(script.Parent.Parent.UserInfoPanel.UserInfoPanelView)
local button = foundationModule.Button
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), giftStateViewModule (ref), view (ref), giftAllowanceViewModule (ref), userInfoPanelViewModule (ref), button (ref), buttonVariant (ref), giftSheetLayoutViewModule (ref)
	local allowance = p1.allowance
	local savingsPresentation = p1.savingsPresentation
	
	return reactModule.createElement(giftSheetLayoutViewModule, {
		isOpen = p1.isOpen,
		titleText = p1.titleText,
		onBack = p1.onBack,
		content = if p1.state then reactModule.createElement(giftStateViewModule, p1.state) else reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, {
			Allowance = if allowance then reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 1 }, {
				Panel = reactModule.createElement(giftAllowanceViewModule, allowance)
			}) else nil,
			UserInfo = reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, {
				Panel = reactModule.createElement(userInfoPanelViewModule, p1.userInfoProps)
			}),
			GiftPresentation = reactModule.createElement(view, {
				tag = "col size-full-0 auto-y",
				testId = "gift-send-presentation",
				LayoutOrder = 3
			}, p1.giftPresentation),
			Savings = if savingsPresentation then reactModule.createElement(view, {
				tag = "col size-full-0 auto-y padding-top-small",
				testId = "gift-send-savings",
				LayoutOrder = 4
			}, savingsPresentation) else nil
		}),
		actions = if p1.state then nil else reactModule.createElement(button, {
			testId = "gift-send-buy",
			text = p1.buyLabel,
			variant = buttonVariant.Emphasis,
			width = UDim.new(1, 0),
			isLoading = p1.isBuyLoading,
			isDisabled = p1.isBuyDisabled,
			onActivated = p1.onBuy
		}),
		captionText = if p1.state then nil else p1.disclaimerText,
		onClose = p1.onClose
	})
end)