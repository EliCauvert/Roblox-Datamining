local Parent = script:FindFirstAncestor("Schools").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), IconButton (copy), IconName (copy), IconSize (copy), ButtonVariant (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-small size-full-0 auto-y padding-x-xlarge padding-y-small bg-surface-0",
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId
	}, {
		BackButton = ReactModule.createElement(IconButton, {
			LayoutOrder = 1,
			icon = IconName.ChevronLargeLeft,
			size = IconSize.Medium,
			variant = ButtonVariant.Utility,
			onActivated = p1.onBack
		}),
		Title = ReactModule.createElement(Text, {
			tag = "fill auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis",
			LayoutOrder = 2,
			Text = p1.title
		}),
		Trailing = if p1.renderTrailing then ReactModule.createElement(View, {
			tag = "row align-y-center gap-small auto-xy",
			LayoutOrder = 3
		}, p1.renderTrailing()) else nil
	})
end