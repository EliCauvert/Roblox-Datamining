local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), view (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "clip",
		Size = UDim2.fromOffset(p1.width, p1.rowHeight),
		LayoutOrder = p1.layoutOrder
	}, {
		Text = reactModule.createElement(text, {
			Text = p1.text,
			tag = p1.textTag or "size-full text-body-small text-align-x-left content-default"
		})
	})
end)