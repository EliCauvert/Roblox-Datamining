local Parent = script:FindFirstAncestor("InExperienceShop").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize

return function(Frame)
	-- upvalues: ReactModule (copy), View (copy), Text (copy), Icon (copy), IconName (copy), IconSize (copy)
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		TitleRow = ReactModule.createElement(View, {
			tag = "row align-y-center size-full-0 auto-y",
			LayoutOrder = 1,
			onActivated = Frame.onActivated
		}, {
			Title = ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-small content-emphasis",
				LayoutOrder = 1,
				Text = Frame.title
			}),
			Chevron = ReactModule.createElement(Icon, {
				LayoutOrder = 2,
				name = IconName.ChevronLargeRight,
				size = IconSize.Small
			})
		})
	})
end