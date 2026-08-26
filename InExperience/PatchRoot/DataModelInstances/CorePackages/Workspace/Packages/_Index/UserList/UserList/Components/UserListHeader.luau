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
local fFlagAddFriendsIgnoreAllFoundationMenu = require(parent.SharedFlags).FFlagAddFriendsIgnoreAllFoundationMenu

return function(p1)
	-- upvalues: reactModule (ref), view (ref), text (ref), enums (ref), icon (ref), iconName (ref), iconSize (ref), iconVariant (ref), iconButton (ref), fFlagAddFriendsIgnoreAllFoundationMenu (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col gap-xxsmall align-x-left",
		LayoutOrder = p1.layoutOrder
	}, {
		HeaderRow = reactModule.createElement(view, {
			tag = "size-full-0 auto-y row align-y-center flex-x-between padding-right-xsmall",
			LayoutOrder = 1
		}, {
			TitleRow = reactModule.createElement(view, {
				tag = "auto-xy row align-y-center gap-xxsmall",
				LayoutOrder = 1,
				onActivated = if p1.onTitleActivated then p1.onTitleActivated else nil
			}, {
				Title = p1.title and reactModule.createElement(text, {
					tag = "text-title-large auto-xy text-align-x-left content-emphasis",
					LayoutOrder = 1,
					Text = p1.title,
					stateLayer = { affordance = enums.StateLayerAffordance.None }
				}),
				Chevron = p1.hasChevron and reactModule.createElement(icon, {
					LayoutOrder = 2,
					name = iconName.ChevronLargeRight,
					size = iconSize.Small,
					variant = iconVariant.Filled
				})
			}),
			TrailingIcon = p1.trailingIcon and (p1.onTrailingIconActivated and reactModule.createElement(iconButton, {
				LayoutOrder = 2,
				icon = p1.trailingIcon,
				size = iconSize.Small,
				onActivated = p1.onTrailingIconActivated,
				ref = if fFlagAddFriendsIgnoreAllFoundationMenu then p1.trailingIconRef else nil
			}))
		}),
		Subtitle = p1.subtitle and reactModule.createElement(text, {
			tag = "text-body-medium auto-xy text-align-x-left content-default text-wrap",
			LayoutOrder = 2,
			Text = p1.subtitle
		})
	})
end