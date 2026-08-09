local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local iconButton = foundationModule.IconButton
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(p0) --[[ line: 26 | named "OverflowMenuPageShell" ]]
	-- upvalues: reactModule (ref), view (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), text (ref), scrollView (ref)
	local testId = p0.testId or "overflow-menu-page"
	
	return reactModule.createElement(view, {
		tag = "col size-full bg-surface-0",
		LayoutOrder = p0.layoutOrder,
		testId = testId
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-small size-full-0 auto-y padding-x-xlarge padding-y-small"
		}, {
			Close = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				icon = p0.closeIcon or iconName.X,
				onActivated = p0.onClose,
				size = inputSize.Medium,
				testId = `{testId}-close`,
				variant = buttonVariant.Utility
			}),
			Title = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-heading-medium text-align-x-left text-truncate-end content-emphasis",
				Text = p0.title
			})
		}),
		Body = reactModule.createElement(scrollView, {
			LayoutOrder = 2,
			tag = "fill size-full-0 bg-surface-0",
			testId = `{testId}-scroll-view`,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, { Content = p0.content }),
		Footer = reactModule.createElement(view, { LayoutOrder = 3, tag = "size-full-0 auto-y" }, { Footer = p0.footer })
	})
end