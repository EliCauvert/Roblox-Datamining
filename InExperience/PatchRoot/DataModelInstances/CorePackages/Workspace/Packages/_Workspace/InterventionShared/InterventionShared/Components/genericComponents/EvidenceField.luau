local parent = script:FindFirstAncestor("InterventionShared").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), view (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y col",
		LayoutOrder = p1.layoutOrder
	}, {
		Label = reactModule.createElement(text, {
			tag = "auto-xy text-title-medium text-align-x-left text-wrap content-emphasis",
			LayoutOrder = 1,
			Text = `{p1.fieldLabel}{if p1.hasColon == nil or p1.hasColon then ":" else ""}`
		}),
		Value = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium text-align-x-left text-wrap",
			LayoutOrder = 2,
			Text = p1.fieldValue
		})
	})
end)