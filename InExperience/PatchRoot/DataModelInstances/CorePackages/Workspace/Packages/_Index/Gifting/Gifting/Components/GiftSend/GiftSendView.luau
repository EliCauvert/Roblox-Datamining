local Parent = script:FindFirstAncestor("Gifting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local GiftAllowanceViewModule = require(script.Parent.Parent.GiftAllowance.GiftAllowanceView)
local GiftSheetLayoutViewModule = require(script.Parent.Parent.GiftSheetLayout.GiftSheetLayoutView)
local GiftStateViewModule = require(script.Parent.Parent.GiftState.GiftStateView)
local UserInfoPanelViewModule = require(script.Parent.Parent.UserInfoPanel.UserInfoPanelView)
local Button = FoundationModule.Button
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), GiftStateViewModule (copy), View (copy), GiftAllowanceViewModule (copy), UserInfoPanelViewModule (copy), Button (copy), ButtonVariant (copy), GiftSheetLayoutViewModule (copy)
	local Allowance = p1.allowance
	local SavingsPresentation = p1.savingsPresentation
	
	return ReactModule.createElement(GiftSheetLayoutViewModule, {
		isOpen = p1.isOpen,
		titleText = p1.titleText,
		onBack = p1.onBack,
		content = if p1.state then ReactModule.createElement(GiftStateViewModule, p1.state) else ReactModule.createElement(View, { tag = "col gap-medium size-full-0 auto-y" }, {
			Allowance = if Allowance then ReactModule.createElement(View, { tag = "col size-full-0 auto-y", LayoutOrder = 1 }, {
				Panel = ReactModule.createElement(GiftAllowanceViewModule, Allowance)
			}) else nil,
			UserInfo = ReactModule.createElement(View, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, {
				Panel = ReactModule.createElement(UserInfoPanelViewModule, p1.userInfoProps)
			}),
			GiftPresentation = ReactModule.createElement(View, {
				tag = "col size-full-0 auto-y",
				testId = "gift-send-presentation",
				LayoutOrder = 3
			}, p1.giftPresentation),
			Savings = if SavingsPresentation then ReactModule.createElement(View, {
				tag = "col size-full-0 auto-y padding-top-small",
				testId = "gift-send-savings",
				LayoutOrder = 4
			}, SavingsPresentation) else nil
		}),
		actions = if p1.state then nil else ReactModule.createElement(Button, {
			testId = "gift-send-buy",
			text = p1.buyLabel,
			variant = ButtonVariant.Emphasis,
			width = UDim.new(1, 0),
			isLoading = p1.isBuyLoading,
			isDisabled = p1.isBuyDisabled,
			onActivated = p1.onBuy
		}),
		captionText = if p1.state then nil else p1.disclaimerText,
		onClose = p1.onClose
	})
end)