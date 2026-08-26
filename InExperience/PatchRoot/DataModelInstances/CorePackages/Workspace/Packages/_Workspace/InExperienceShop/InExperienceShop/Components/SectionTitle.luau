local parent = script:FindFirstAncestor("InExperienceShop").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize

return function(p1)
	-- upvalues: reactModule (ref), view (ref), text (ref), icon (ref), iconName (ref), iconSize (ref)
	return reactModule.createElement(view, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, {
		TitleRow = reactModule.createElement(view, {
			tag = "row align-y-center size-full-0 auto-y",
			LayoutOrder = 1,
			onActivated = p1.onActivated
		}, {
			Title = reactModule.createElement(text, {
				tag = "auto-xy text-heading-small content-emphasis",
				LayoutOrder = 1,
				Text = p1.title
			}),
			Chevron = reactModule.createElement(icon, {
				LayoutOrder = 2,
				name = iconName.ChevronLargeRight,
				size = iconSize.Small
			})
		})
	})
end