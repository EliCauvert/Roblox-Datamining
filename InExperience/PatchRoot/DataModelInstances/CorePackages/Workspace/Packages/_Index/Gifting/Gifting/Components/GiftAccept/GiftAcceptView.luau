local Parent = script:FindFirstAncestor("Gifting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local GiftSheetLayoutViewModule = require(script.Parent.Parent.GiftSheetLayout.GiftSheetLayoutView)
local GiftStateViewModule = require(script.Parent.Parent.GiftState.GiftStateView)
local UserInfoPanelViewModule = require(script.Parent.Parent.UserInfoPanel.UserInfoPanelView)
local Button = FoundationModule.Button
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant

return ReactModule.memo(function(p1) --[[ Line: 39 | Named "GiftAcceptView" ]]
	-- upvalues: ReactModule (copy), GiftStateViewModule (copy), View (copy), UserInfoPanelViewModule (copy), Button (copy), ButtonVariant (copy), GiftSheetLayoutViewModule (copy)
	return ReactModule.createElement(GiftSheetLayoutViewModule, {
		isOpen = p1.isOpen,
		titleText = p1.titleText,
		content = if p1.state then ReactModule.createElement(GiftStateViewModule, p1.state) else ReactModule.createElement(View, { tag = "col gap-medium size-full-0 auto-y" }, {
			UserInfo = ReactModule.createElement(View, { tag = "col size-full-0 auto-y", LayoutOrder = 1 }, {
				Panel = ReactModule.createElement(UserInfoPanelViewModule, p1.userInfoProps)
			}),
			GiftPresentation = ReactModule.createElement(View, {
				tag = "col size-full-0 auto-y",
				testId = "gift-accept-presentation",
				LayoutOrder = 2
			}, p1.giftPresentation)
		}),
		actions = if p1.state then nil else ReactModule.createElement(View, { tag = "row gap-small size-full-0 auto-y" }, {
			Accept = ReactModule.createElement(Button, {
				testId = "gift-accept-accept",
				LayoutOrder = 1,
				text = p1.acceptLabel,
				variant = ButtonVariant.Emphasis,
				width = UDim.new(0.5, -4),
				isLoading = p1.isAcceptLoading,
				isDisabled = p1.isAcceptDisabled,
				onActivated = p1.onAccept
			}),
			Reject = ReactModule.createElement(Button, {
				testId = "gift-accept-reject",
				LayoutOrder = 2,
				text = p1.rejectLabel,
				variant = ButtonVariant.Alert,
				width = UDim.new(0.5, -4),
				isLoading = p1.isRejectLoading,
				isDisabled = p1.isRejectDisabled,
				onActivated = p1.onReject
			})
		}),
		captionText = if p1.state then nil else p1.disclaimerText,
		onClose = p1.onClose
	})
end)