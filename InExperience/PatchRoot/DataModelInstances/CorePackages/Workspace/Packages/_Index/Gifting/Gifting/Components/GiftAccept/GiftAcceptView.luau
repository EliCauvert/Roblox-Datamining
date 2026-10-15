local parent = script:FindFirstAncestor("Gifting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local giftSheetLayoutViewModule = require(script.Parent.Parent.GiftSheetLayout.GiftSheetLayoutView)
local giftStateViewModule = require(script.Parent.Parent.GiftState.GiftStateView)
local userInfoPanelViewModule = require(script.Parent.Parent.UserInfoPanel.UserInfoPanelView)
local button = foundationModule.Button
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), giftStateViewModule (ref), view (ref), userInfoPanelViewModule (ref), button (ref), buttonVariant (ref), giftSheetLayoutViewModule (ref)
	return reactModule.createElement(giftSheetLayoutViewModule, {
		isOpen = p1.isOpen,
		titleText = p1.titleText,
		content = if p1.state then reactModule.createElement(giftStateViewModule, p1.state) else reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, {
			UserInfo = reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 1 }, {
				Panel = reactModule.createElement(userInfoPanelViewModule, p1.userInfoProps)
			}),
			GiftPresentation = reactModule.createElement(view, {
				tag = "col size-full-0 auto-y",
				testId = "gift-accept-presentation",
				LayoutOrder = 2
			}, p1.giftPresentation)
		}),
		actions = if p1.state then nil else reactModule.createElement(view, { tag = "row gap-small size-full-0 auto-y" }, {
			Accept = reactModule.createElement(button, {
				testId = "gift-accept-accept",
				LayoutOrder = 1,
				text = p1.acceptLabel,
				variant = buttonVariant.Emphasis,
				width = UDim.new(0.5, -4),
				isLoading = p1.isAcceptLoading,
				isDisabled = p1.isAcceptDisabled,
				onActivated = p1.onAccept
			}),
			Reject = reactModule.createElement(button, {
				testId = "gift-accept-reject",
				LayoutOrder = 2,
				text = p1.rejectLabel,
				variant = buttonVariant.Alert,
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