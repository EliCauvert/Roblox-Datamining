local Parent = script:FindFirstAncestor("EditProfile").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), IconButton (copy), IconName (copy), IconSize (copy), ButtonVariant (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "row flex-between align-y-center gap-small size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge",
		padding = { top = UDim.new(0, UseTokensFunction().Margin.Large) }
	}, {
		HeaderBar = ReactModule.createElement(View, { tag = "row align-y-center size-0-1800 auto-x gap-small" }, {
			BackButton = ReactModule.createElement(IconButton, {
				isCircular = true,
				LayoutOrder = 1,
				icon = IconName.ChevronLargeLeft,
				size = IconSize.Medium,
				variant = ButtonVariant.Utility,
				onActivated = p1.onClose
			}),
			HeaderText = ReactModule.createElement(Text, {
				tag = "text-heading-small auto-xy",
				LayoutOrder = 2,
				Text = p1.headerText
			})
		}),
		SaveButton = if p1.onSave then ReactModule.createElement(IconButton, {
			isCircular = true,
			icon = IconName.CheckLarge,
			size = IconSize.Medium,
			variant = ButtonVariant.Utility,
			onActivated = p1.onSave,
			isDisabled = p1.isLoading or p1.isDisabled == true
		}) else nil
	})
end