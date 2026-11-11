local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), View (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "clip",
		Size = UDim2.fromOffset(p1.width, p1.rowHeight),
		LayoutOrder = p1.layoutOrder
	}, {
		Text = ReactModule.createElement(Text, {
			Text = p1.text,
			tag = p1.textTag or "size-full text-body-small text-align-x-left content-default"
		})
	})
end)