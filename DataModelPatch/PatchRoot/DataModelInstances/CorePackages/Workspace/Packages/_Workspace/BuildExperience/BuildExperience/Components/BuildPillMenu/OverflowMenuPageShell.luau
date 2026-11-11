local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local IconButton = FoundationModule.IconButton
local ScrollView = FoundationModule.ScrollView
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), Text (copy), ScrollView (copy)
	local TestId = p1.testId or "overflow-menu-page"
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center size-full bg-surface-0",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "composition-content-header row align-y-center gap-small size-full-0 auto-y padding-y-small",
			testId = `{TestId}-header`
		}, {
			Close = ReactModule.createElement(IconButton, {
				LayoutOrder = 1,
				isCircular = true,
				icon = p1.closeIcon or IconName.X,
				onActivated = p1.onClose,
				size = InputSize.Medium,
				testId = `{TestId}-close`,
				variant = ButtonVariant.Utility
			}),
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "fill text-heading-medium text-align-x-left text-truncate-end content-emphasis",
				Text = p1.title
			})
		}),
		Body = ReactModule.createElement(ScrollView, {
			LayoutOrder = 2,
			tag = "fill size-full-0 bg-surface-0",
			testId = `{TestId}-scroll-view`,
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				CanvasSize = UDim2.new(1, 0, 0, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, {
			ContentBody = ReactModule.createElement(View, {
				tag = "composition-content-body col size-full-0 auto-y",
				testId = `{TestId}-content-body`
			}, { Content = p1.content })
		}),
		Footer = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "composition-content-body size-full-0 auto-y",
			testId = `{TestId}-footer-body`
		}, { Footer = p1.footer })
	})
end