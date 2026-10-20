local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize

return function(Frame)
	-- upvalues: ReactModule (copy), View (copy), Icon (copy), IconSize (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "row align-x-center align-y-center gap-xsmall size-600 auto-x padding-x-small radius-circle bg-shift-300",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Icon = if Frame.iconName then ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			tag = "content-emphasis",
			name = Frame.iconName,
			size = IconSize.XSmall
		}) else nil,
		Text = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "auto-xy text-caption-small text-align-x-center content-emphasis",
			Text = Frame.Text
		})
	})
end