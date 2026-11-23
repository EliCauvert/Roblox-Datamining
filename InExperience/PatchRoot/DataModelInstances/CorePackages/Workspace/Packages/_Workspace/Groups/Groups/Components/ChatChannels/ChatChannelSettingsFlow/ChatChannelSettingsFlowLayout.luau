local Parent = script:FindFirstAncestor("Groups").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col size-full",
		ref = p1.containerRef,
		testId = p1.testId
	}, {
		Header = ReactModule.createElement(FoundationModule.View, {
			tag = "row align-y-center gap-small size-full-0 auto-y padding-x-xlarge padding-y-small",
			LayoutOrder = 1
		}, {
			Content = ReactModule.createElement(FoundationModule.View, { tag = "fill size-0-0 auto-y", LayoutOrder = 1 }, p1.header),
			Close = if p1.hideCloseButton then nil else ReactModule.createElement(FoundationModule.IconButton, {
				LayoutOrder = 2,
				icon = FoundationModule.Enums.IconName.X,
				size = FoundationModule.Enums.InputSize.Small,
				variant = FoundationModule.Enums.ButtonVariant.Utility,
				onActivated = p1.onClose,
				testId = `{p1.testId}--close`
			})
		}),
		[p1.contentKey] = ReactModule.createElement(FoundationModule.ScrollView, {
			tag = "fill size-full-0",
			LayoutOrder = 2,
			scroll = {
				ScrollingDirection = Enum.ScrollingDirection.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new()
			}
		}, p1.body),
		Actions = if p1.actions then ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0 auto-y padding-xlarge",
			LayoutOrder = 3
		}, p1.actions) else nil
	})
end