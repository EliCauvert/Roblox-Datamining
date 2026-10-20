local _ = require(script.Parent.ActionBarWithContextualTextView)

return function(Frame)
	return {
		titleText = Frame.titleText,
		actionButtonText = Frame.actionButtonText,
		onActionActivated = Frame.onActionActivated,
		onMoreActivated = Frame.onMoreActivated,
		isActionDisabled = Frame.isActionDisabled,
		isActionLoading = Frame.isActionLoading,
		LayoutOrder = Frame.LayoutOrder
	}
end