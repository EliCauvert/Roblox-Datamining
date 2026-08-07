local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image

return reactModule.memo(function(p0) --[[ line: 11 | named "PlayerContextMenuHeader" ]]
	-- upvalues: reactModule (ref), view (ref), image (ref), text (ref)
	local header = p0.header
	
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-medium size-full-1600 auto-y",
		LayoutOrder = p0.layoutOrder
	}, {
		Avatar = reactModule.createElement(image, {
			tag = "size-1000-1000 radius-circle",
			LayoutOrder = 1,
			Image = header.thumbnail or ""
		}),
		NameColumn = reactModule.createElement(view, { LayoutOrder = 2, tag = "col align-x-left auto-xy" }, {
			DisplayName = reactModule.createElement(text, {
				tag = "auto-xy text-title-medium text-align-x-left content-emphasis",
				LayoutOrder = 1,
				Text = header.displayName
			}),
			Username = reactModule.createElement(text, {
				tag = "auto-xy text-body-medium text-align-x-left content-default",
				LayoutOrder = 2,
				Text = header.username
			})
		})
	})
end)