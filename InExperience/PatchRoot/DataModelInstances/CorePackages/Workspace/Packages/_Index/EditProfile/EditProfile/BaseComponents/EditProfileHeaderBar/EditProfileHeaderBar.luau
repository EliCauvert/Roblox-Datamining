local parent = script:FindFirstAncestor("EditProfile").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local view = foundationModule.View
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local buttonVariant = foundationModule.Enums.ButtonVariant

return function(p0) --[[ line: 22 | named "EditProfileHeaderBar" ]]
	-- upvalues: reactModule (ref), view (ref), iconButton (ref), iconName (ref), iconSize (ref), buttonVariant (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "row flex-between align-y-center gap-small size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge padding-top-xxlarge"
	}, {
		HeaderBar = reactModule.createElement(view, { tag = "row align-y-center size-0-1800 auto-x gap-small" }, {
			BackButton = reactModule.createElement(iconButton, {
				isCircular = true,
				LayoutOrder = 1,
				icon = iconName.ChevronLargeLeft,
				size = iconSize.Medium,
				variant = buttonVariant.Utility,
				onActivated = p0.onClose
			}),
			HeaderText = reactModule.createElement(text, {
				tag = "text-heading-small auto-xy",
				LayoutOrder = 2,
				Text = p0.headerText
			})
		}),
		SaveButton = if p0.onSave then reactModule.createElement(iconButton, {
			isCircular = true,
			icon = iconName.CheckLarge,
			size = iconSize.Medium,
			variant = buttonVariant.Utility,
			onActivated = p0.onSave,
			isDisabled = p0.isLoading or p0.isDisabled == true
		}) else nil
	})
end