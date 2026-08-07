local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local view = foundationModule.View
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize

return function(p0) --[[ line: 19 ]]
	-- upvalues: reactModule (ref), view (ref), icon (ref), iconSize (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "row align-x-center align-y-center gap-xsmall size-600 auto-x padding-x-small radius-circle bg-shift-300",
		LayoutOrder = p0.LayoutOrder
	}, {
		Icon = if p0.iconName then reactModule.createElement(icon, {
			LayoutOrder = 1,
			tag = "content-emphasis",
			name = p0.iconName,
			size = iconSize.XSmall
		}) else nil,
		Text = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-xy text-caption-small text-align-x-center content-emphasis",
			Text = p0.Text
		})
	})
end