local Parent = script:FindFirstAncestor("UserList").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Enums = FoundationModule.Enums
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local Text = FoundationModule.Text
local IconButton = FoundationModule.IconButton
local IconName = Enums.IconName
local IconSize = Enums.IconSize
local IconVariant = Enums.IconVariant

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), Enums (copy), Icon (copy), IconName (copy), IconSize (copy), IconVariant (copy), IconButton (copy)
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col gap-xxsmall align-x-left",
		LayoutOrder = p1.layoutOrder
	}, {
		HeaderRow = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y row align-y-center flex-x-between padding-right-xsmall",
			LayoutOrder = 1
		}, {
			TitleRow = ReactModule.createElement(View, {
				tag = "auto-xy row align-y-center gap-xxsmall",
				LayoutOrder = 1,
				onActivated = if p1.onTitleActivated then p1.onTitleActivated else nil
			}, {
				Title = p1.title and ReactModule.createElement(Text, {
					tag = "text-title-large auto-xy text-align-x-left content-emphasis",
					LayoutOrder = 1,
					Text = p1.title,
					stateLayer = { affordance = Enums.StateLayerAffordance.None }
				}),
				Chevron = p1.hasChevron and ReactModule.createElement(Icon, {
					LayoutOrder = 2,
					name = IconName.ChevronLargeRight,
					size = IconSize.Small,
					variant = IconVariant.Filled
				})
			}),
			TrailingIcon = p1.trailingIcon and (p1.onTrailingIconActivated and ReactModule.createElement(IconButton, {
				LayoutOrder = 2,
				icon = p1.trailingIcon,
				size = IconSize.Small,
				onActivated = p1.onTrailingIconActivated
			}))
		}),
		Subtitle = p1.subtitle and ReactModule.createElement(Text, {
			tag = "text-body-medium auto-xy text-align-x-left content-default text-wrap",
			LayoutOrder = 2,
			Text = p1.subtitle
		})
	})
end