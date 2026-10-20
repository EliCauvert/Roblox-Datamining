local Parent = script:FindFirstAncestor("NotApprovedPage").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), View (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y col",
		LayoutOrder = p1.layoutOrder
	}, {
		Label = ReactModule.createElement(Text, {
			tag = "auto-xy text-title-medium text-align-x-left text-wrap content-emphasis",
			LayoutOrder = 1,
			Text = `{p1.fieldLabel}:`
		}),
		Value = ReactModule.createElement(Text, {
			tag = "auto-xy text-body-medium text-align-x-left text-wrap",
			LayoutOrder = 2,
			Text = p1.fieldValue
		})
	})
end)