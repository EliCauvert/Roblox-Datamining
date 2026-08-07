local parent = script:FindFirstAncestor("UserList").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local enums = foundationModule.Enums
local icon = foundationModule.Icon
local view = foundationModule.View
local text = foundationModule.Text
local iconButton = foundationModule.IconButton
local iconName = enums.IconName
local iconSize = enums.IconSize
local iconVariant = enums.IconVariant

return function(p0) --[[ line: 26 | named "UserListHeader" ]]
	-- upvalues: reactModule (ref), view (ref), text (ref), enums (ref), icon (ref), iconName (ref), iconSize (ref), iconVariant (ref), iconButton (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-xxsmall align-x-left",
		LayoutOrder = p0.layoutOrder
	}, {
		HeaderRow = reactModule.createElement(view, {
			tag = "size-full-0 auto-y row align-y-center flex-x-between padding-right-xsmall",
			LayoutOrder = 1
		}, {
			TitleRow = reactModule.createElement(view, {
				tag = "auto-xy row align-y-center gap-xxsmall",
				LayoutOrder = 1,
				onActivated = if p0.onTitleActivated then p0.onTitleActivated else nil
			}, {
				Title = p0.title and reactModule.createElement(text, {
					tag = "text-title-large auto-xy text-align-x-left content-emphasis",
					LayoutOrder = 1,
					Text = p0.title,
					stateLayer = { affordance = enums.StateLayerAffordance.None }
				}),
				Chevron = p0.hasChevron and reactModule.createElement(icon, {
					LayoutOrder = 2,
					name = iconName.ChevronLargeRight,
					size = iconSize.Small,
					variant = iconVariant.Filled
				})
			}),
			TrailingIcon = p0.trailingIcon and (p0.onTrailingIconActivated and reactModule.createElement(iconButton, {
				LayoutOrder = 2,
				icon = p0.trailingIcon,
				size = iconSize.Small,
				onActivated = p0.onTrailingIconActivated
			}))
		}),
		Subtitle = p0.subtitle and reactModule.createElement(text, {
			tag = "text-body-medium auto-xy text-align-x-left content-default text-wrap",
			LayoutOrder = 2,
			Text = p0.subtitle
		})
	})
end