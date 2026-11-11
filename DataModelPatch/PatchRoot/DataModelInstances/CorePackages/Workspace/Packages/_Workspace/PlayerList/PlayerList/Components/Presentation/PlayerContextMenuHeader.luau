local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), View (copy), Image (copy), Text (copy)
	local Header = p1.header
	
	return ReactModule.createElement(View, {
		tag = "row align-x-left align-y-center gap-medium size-full-1600 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		Avatar = ReactModule.createElement(Image, {
			tag = "size-1000-1000 radius-circle",
			LayoutOrder = 1,
			Image = Header.thumbnail or ""
		}),
		NameColumn = ReactModule.createElement(View, { LayoutOrder = 2, tag = "col align-x-left auto-xy" }, {
			DisplayName = ReactModule.createElement(Text, {
				tag = "auto-xy text-title-medium text-align-x-left content-emphasis",
				LayoutOrder = 1,
				Text = Header.displayName
			}),
			Username = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-medium text-align-x-left content-default",
				LayoutOrder = 2,
				Text = Header.username
			})
		})
	})
end)